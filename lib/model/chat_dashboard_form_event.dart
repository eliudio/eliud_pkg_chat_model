/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 chat_dashboard_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_pkg_chat_model/model/model_export.dart';

@immutable
abstract class ChatDashboardFormEvent extends Equatable {
  const ChatDashboardFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewChatDashboardFormEvent extends ChatDashboardFormEvent {}

class InitialiseChatDashboardFormEvent extends ChatDashboardFormEvent {
  final ChatDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseChatDashboardFormEvent({this.value});
}

class InitialiseChatDashboardFormNoLoadEvent extends ChatDashboardFormEvent {
  final ChatDashboardModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseChatDashboardFormNoLoadEvent({this.value});
}

class ChangedChatDashboardDocumentID extends ChatDashboardFormEvent {
  final String? value;

  ChangedChatDashboardDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedChatDashboardDocumentID{ value: $value }';
}

class ChangedChatDashboardAppId extends ChatDashboardFormEvent {
  final String? value;

  ChangedChatDashboardAppId({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedChatDashboardAppId{ value: $value }';
}

class ChangedChatDashboardDescription extends ChatDashboardFormEvent {
  final String? value;

  ChangedChatDashboardDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedChatDashboardDescription{ value: $value }';
}

class ChangedChatDashboardConditions extends ChatDashboardFormEvent {
  final StorageConditionsModel? value;

  ChangedChatDashboardConditions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedChatDashboardConditions{ value: $value }';
}

class ChangedChatDashboardMembersType extends ChatDashboardFormEvent {
  final MembersType? value;

  ChangedChatDashboardMembersType({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedChatDashboardMembersType{ value: $value }';
}
