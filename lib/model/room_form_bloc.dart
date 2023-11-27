/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 room_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eliud_core_helpers/firestore/firestore_tools.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_pkg_chat_model/model/abstract_repository_singleton.dart';
import 'package:eliud_pkg_chat_model/model/model_export.dart';

import 'package:eliud_pkg_chat_model/model/room_form_event.dart';
import 'package:eliud_pkg_chat_model/model/room_form_state.dart';

class RoomFormBloc extends Bloc<RoomFormEvent, RoomFormState> {
  final FormAction? formAction;
  final String? appId;

  RoomFormBloc(this.appId, {this.formAction}) : super(RoomFormUninitialized()) {
    on<InitialiseNewRoomFormEvent>((event, emit) {
      RoomFormLoaded loaded = RoomFormLoaded(
          value: RoomModel(
        documentID: "",
        ownerId: "",
        appId: "",
        description: "",
        members: [],
      ));
      emit(loaded);
    });

    on<InitialiseRoomFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      RoomFormLoaded loaded = RoomFormLoaded(
          value:
              await roomRepository(appId: appId)!.get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseRoomFormNoLoadEvent>((event, emit) async {
      RoomFormLoaded loaded = RoomFormLoaded(value: event.value);
      emit(loaded);
    });
    RoomModel? newValue;
    on<ChangedRoomDocumentID>((event, emit) async {
      if (state is RoomFormInitialized) {
        final currentState = state as RoomFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableRoomForm(value: newValue));
        }
      }
    });
    on<ChangedRoomOwnerId>((event, emit) async {
      if (state is RoomFormInitialized) {
        final currentState = state as RoomFormInitialized;
        newValue = currentState.value!.copyWith(ownerId: event.value);
        emit(SubmittableRoomForm(value: newValue));
      }
    });
    on<ChangedRoomAppId>((event, emit) async {
      if (state is RoomFormInitialized) {
        final currentState = state as RoomFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableRoomForm(value: newValue));
      }
    });
    on<ChangedRoomDescription>((event, emit) async {
      if (state is RoomFormInitialized) {
        final currentState = state as RoomFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableRoomForm(value: newValue));
      }
    });
    on<ChangedRoomIsRoom>((event, emit) async {
      if (state is RoomFormInitialized) {
        final currentState = state as RoomFormInitialized;
        newValue = currentState.value!.copyWith(isRoom: event.value);
        emit(SubmittableRoomForm(value: newValue));
      }
    });
    on<ChangedRoomTimestamp>((event, emit) async {
      if (state is RoomFormInitialized) {
        final currentState = state as RoomFormInitialized;
        newValue = currentState.value!
            .copyWith(timestamp: dateTimeFromTimestampString(event.value!));
        emit(SubmittableRoomForm(value: newValue));
      }
    });
  }

  DocumentIDRoomFormError error(String message, RoomModel newValue) =>
      DocumentIDRoomFormError(message: message, value: newValue);

  Future<RoomFormState> _isDocumentIDValid(
      String? value, RoomModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<RoomModel?> findDocument = roomRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableRoomForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
