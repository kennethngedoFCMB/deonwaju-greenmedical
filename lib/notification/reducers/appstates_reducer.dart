import 'package:deon_greenmed/notification/actions/actions.dart';
import 'package:deon_greenmed/notification/models/reminder.dart';
import 'package:deon_greenmed/notification/store/appstate.dart';
import 'package:deon_greenmed/notification/store/reminderstate.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
      remindersState: remindersReducer(state.remindersState, action),
    );

final remindersReducer = combineReducers<RemindersState>([
  TypedReducer<RemindersState, SetReminderAction>(_setReminderAction),
  TypedReducer<RemindersState, ClearReminderAction>(_clearReminderAction),
  TypedReducer<RemindersState, RemoveReminderAction>(_removeReminderAction),
]);

RemindersState _setReminderAction(
    RemindersState state, SetReminderAction action) {
  var remindersList = state.reminders;
  if (remindersList != null) {
    remindersList.add(new Reminder(
        repeat: action.repeat, name: action.name, time: action.time));
  }
  return state.copyWith(reminders: remindersList);
}

RemindersState _clearReminderAction(
        RemindersState state, ClearReminderAction action) =>
    state.copyWith(reminders: []);

RemindersState _removeReminderAction(
    RemindersState state, RemoveReminderAction action) {
  var remindersList = state.reminders;
  remindersList.removeWhere((reminder) => reminder.name == action.name);
  return state.copyWith(reminders: remindersList);
}
