/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 chat_form_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'chat_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ChatFormState extends Equatable {
  const ChatFormState();

  @override
  List<Object?> get props => [];
}

// Startup: menu has not been initialised yet and so we should show a "loading indicator" or something
class ChatFormUninitialized extends ChatFormState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '''ChatFormState()''';
  }
}

// ChatModel has been initialised and hence ChatModel is available
class ChatFormInitialized extends ChatFormState {
  final ChatModel? value;

  @override
  List<Object?> get props => [value];

  const ChatFormInitialized({this.value});
}

// Menu has been initialised and hence a menu is available
abstract class ChatFormError extends ChatFormInitialized {
  final String? message;

  @override
  List<Object?> get props => [message, value];

  const ChatFormError({this.message, super.value});

  @override
  String toString() {
    return '''ChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class DocumentIDChatFormError extends ChatFormError {
  const DocumentIDChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''DocumentIDChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AuthorIdChatFormError extends ChatFormError {
  const AuthorIdChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AuthorIdChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AppIdChatFormError extends ChatFormError {
  const AppIdChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AppIdChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class RoomIdChatFormError extends ChatFormError {
  const RoomIdChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''RoomIdChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class TimestampChatFormError extends ChatFormError {
  const TimestampChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''TimestampChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class SayingChatFormError extends ChatFormError {
  const SayingChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''SayingChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AccessibleByGroupChatFormError extends ChatFormError {
  const AccessibleByGroupChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AccessibleByGroupChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class AccessibleByMembersChatFormError extends ChatFormError {
  const AccessibleByMembersChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''AccessibleByMembersChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ReadAccessChatFormError extends ChatFormError {
  const ReadAccessChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ReadAccessChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ChatMediaChatFormError extends ChatFormError {
  const ChatMediaChatFormError({super.message, super.value});

  @override
  List<Object?> get props => [message, value];

  @override
  String toString() {
    return '''ChatMediaChatFormError {
      value: $value,
      message: $message,
    }''';
  }
}

class ChatFormLoaded extends ChatFormInitialized {
  const ChatFormLoaded({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''ChatFormLoaded {
      value: $value,
    }''';
  }
}

class SubmittableChatForm extends ChatFormInitialized {
  const SubmittableChatForm({super.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() {
    return '''SubmittableChatForm {
      value: $value,
    }''';
  }
}
