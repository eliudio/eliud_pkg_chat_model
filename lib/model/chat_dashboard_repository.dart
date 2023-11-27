/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 chat_dashboard_repository.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_pkg_chat_model/model/model_export.dart';
import 'package:eliud_pkg_chat_model/model/entity_export.dart';

import 'dart:async';
import 'package:eliud_core_helpers/query/query_tools.dart';
import 'package:eliud_core_helpers/helpers/common_tools.dart';
import 'package:eliud_core_helpers/repository/repository_base.dart';

typedef ChatDashboardModelTrigger = Function(List<ChatDashboardModel?> list);
typedef ChatDashboardChanged = Function(ChatDashboardModel? value);
typedef ChatDashboardErrorHandler = Function(dynamic o, dynamic e);

abstract class ChatDashboardRepository
    extends RepositoryBase<ChatDashboardModel, ChatDashboardEntity> {
  @override
  Future<ChatDashboardEntity> addEntity(
      String documentID, ChatDashboardEntity value);
  @override
  Future<ChatDashboardEntity> updateEntity(
      String documentID, ChatDashboardEntity value);
  @override
  Future<ChatDashboardModel> add(ChatDashboardModel value);
  @override
  Future<void> delete(ChatDashboardModel value);
  @override
  Future<ChatDashboardModel?> get(String? id, {Function(Exception)? onError});
  @override
  Future<ChatDashboardModel> update(ChatDashboardModel value);

  @override
  Stream<List<ChatDashboardModel?>> values(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Stream<List<ChatDashboardModel?>> valuesWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ChatDashboardModel?>> valuesList(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  Future<List<ChatDashboardModel?>> valuesListWithDetails(
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      SetLastDoc? setLastDoc,
      int? privilegeLevel,
      EliudQuery? eliudQuery});

  @override
  StreamSubscription<List<ChatDashboardModel?>> listen(
      ChatDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<List<ChatDashboardModel?>> listenWithDetails(
      ChatDashboardModelTrigger trigger,
      {String? orderBy,
      bool? descending,
      Object? startAfter,
      int? limit,
      int? privilegeLevel,
      EliudQuery? eliudQuery});
  @override
  StreamSubscription<ChatDashboardModel?> listenTo(
      String documentId, ChatDashboardChanged changed,
      {ChatDashboardErrorHandler? errorHandler});
  @override
  void flush();

  @override
  String? timeStampToString(dynamic timeStamp);

  @override
  dynamic getSubCollection(String documentId, String name);
  @override
  Future<ChatDashboardModel?> changeValue(
      String documentId, String fieldName, num changeByThisValue);

  @override
  Future<void> deleteAll();
}
