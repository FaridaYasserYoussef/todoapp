// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addNewTask": MessageLookupByLibrary.simpleMessage("Add New Task"),
        "darkMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "editTask": MessageLookupByLibrary.simpleMessage("Edit Task"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "selectedDate": MessageLookupByLibrary.simpleMessage("Selected Date"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "taskDescription":
            MessageLookupByLibrary.simpleMessage("Task Description"),
        "taskDescriptionErrorMessageOne": MessageLookupByLibrary.simpleMessage(
            "Task Description cannot be empty"),
        "taskDescriptionErrorMessageTwo": MessageLookupByLibrary.simpleMessage(
            "Task Description cannot be less than 6 letters"),
        "taskName": MessageLookupByLibrary.simpleMessage("Task Name"),
        "taskNameErrorMessageOne":
            MessageLookupByLibrary.simpleMessage("Task Name cannot be empty"),
        "taskNameErrorMessageTwo": MessageLookupByLibrary.simpleMessage(
            "Task Name cannot be less than 5 letters"),
        "tasksList": MessageLookupByLibrary.simpleMessage("Tasks List")
      };
}
