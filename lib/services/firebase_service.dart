import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/auth/models/userDataModel.dart';
import 'package:todoapp/models/taskModel.dart';
class FireBaseService{

static Stream<List<TaskModel>> getTasksByDate(DateTime date) async*{
   Stream<QuerySnapshot<TaskModel>> tasksQuerySnapshot = getTasksCollection()
   .where('date', isEqualTo: Timestamp.fromDate(date))
   .snapshots();
  var data = tasksQuerySnapshot.map((event) => event.docs.map((e) => e.data()).toList());
  yield* data;
}

static Future<void> createTask(TaskModel task) async{
  task.date = DateTime(task.date.year, task.date.month, task.date.day);
 DocumentReference<TaskModel> taskDocRef =  getTasksCollection().doc();
 task.id = taskDocRef.id;
 await taskDocRef.set(task);
}

static Future<void> deleteTask(String id) async{
   await getTasksCollection().doc(id).delete();
}
static updateTask(TaskModel task) async{
  await getTasksCollection().doc(task.id).set(task);
}

static Future<UserDataModel> signup(UserDataModel userDataModel, String password) async{
 UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: userDataModel.email!,
    password: password,
  );

 userDataModel.id = credential.user!.uid;
 await createUser(userDataModel);
 return userDataModel;

}
static createUser(UserDataModel userDataModel) async{
  await getUserCollection().doc(userDataModel.id).set(userDataModel);
}
static CollectionReference<UserDataModel> getUserCollection(){
  return FirebaseFirestore.instance.collection("users")
  .withConverter(
    fromFirestore: (snapshot, _) =>UserDataModel
    .fromJson(snapshot.data() ?? {}), 
    toFirestore: (value, _) => value.toJson());
}

static CollectionReference<TaskModel> getTasksCollection(){
 return getUserCollection().doc(FirebaseAuth.instance.currentUser!.uid)
  .collection("tasks")
  .withConverter<TaskModel>(fromFirestore: (snapshot, _) =>TaskModel
    .fromJson(snapshot.data() ?? {}), 
    toFirestore: (value, _) => value.toJson());
}

static Future<UserDataModel?> login(String email, String password) async{
 UserCredential credentials = await  FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  return getUser();

}

static Future<UserDataModel?> getUser() async{
 DocumentSnapshot<UserDataModel> userSnapshot =  await getUserCollection().doc(FirebaseAuth.instance.currentUser!.uid).get();
 UserDataModel? user = userSnapshot.data();
 return user;
}
static Future? logout()async{

  try{
  await FirebaseAuth.instance.signOut();
  return true;
  }catch(e){
       String? message;
      if (e is FirebaseAuthException) {
        message = e.message;
      }
      Fluttertoast.showToast(
        msg: message ?? "something went wrong",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white
        );
        return false;
  }
}

}

