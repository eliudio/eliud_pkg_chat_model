/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 room_list.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:math';
import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/style/frontend/has_button.dart';
import 'package:eliud_core_main/apis/style/frontend/has_divider.dart';
import 'package:eliud_core_main/apis/style/frontend/has_list_tile.dart';
import 'package:eliud_core_main/apis/style/frontend/has_tabs.dart';
import 'package:eliud_core_main/apis/style/frontend/has_text.dart';
import 'package:eliud_core_main/apis/registryapi/component/component_spec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';
import 'package:eliud_core_helpers/query/query_tools.dart';

import 'abstract_repository_singleton.dart';
import 'room_list_bloc.dart';
import 'room_list_event.dart';
import 'room_list_state.dart';
import 'room_model.dart';

/* 
 * RoomComponentSelector is a component selector for Room, allowing to select a Room component
 */
class RoomComponentSelector extends ComponentSelector {
  /* 
   * createSelectWidget creates the widget
   */
  @override
  Widget createSelectWidget(BuildContext context, AppModel app,
      int privilegeLevel, double height, SelectComponent selected, editor) {
    var appId = app.documentID;
    return BlocProvider<RoomListBloc>(
      create: (context) => RoomListBloc(
        eliudQuery: getComponentSelectorQuery(0, app.documentID),
        roomRepository: roomRepository(appId: appId)!,
      )..add(LoadRoomList()),
      child: _SelectRoomWidget(
          app: app,
          height: height,
          containerPrivilege: privilegeLevel,
          selected: selected,
          editorConstructor: editor),
    );
  }
}

/* 
 * _SelectRoomWidget 
 */
class _SelectRoomWidget extends StatefulWidget {
  final AppModel app;
  final double height;
  final SelectComponent selected;
  final int containerPrivilege;
  final ComponentEditorConstructor editorConstructor;

  const _SelectRoomWidget(
      {required this.app,
      required this.containerPrivilege,
      required this.height,
      required this.selected,
      required this.editorConstructor});

  @override
  State<_SelectRoomWidget> createState() {
    return _SelectRoomWidgetState();
  }
}

class _SelectRoomWidgetState extends State<_SelectRoomWidget>
    with TickerProviderStateMixin {
  TabController? _privilegeTabController;
  final List<String> _privilegeItems = ['No', 'L1', 'L2', 'Owner'];
  final int _initialPrivilege = 0;
  int _currentPrivilege = 0;

  @override
  void initState() {
    var privilegeASize = _privilegeItems.length;
    _privilegeTabController =
        TabController(vsync: this, length: privilegeASize);
    _privilegeTabController!.addListener(_handlePrivilegeTabSelection);
    _privilegeTabController!.index = _initialPrivilege;

    super.initState();
  }

  @override
  void dispose() {
    if (_privilegeTabController != null) {
      _privilegeTabController!.dispose();
    }
    super.dispose();
  }

  void _handlePrivilegeTabSelection() {
    if ((_privilegeTabController != null) &&
        (_privilegeTabController!.indexIsChanging)) {
      _currentPrivilege = _privilegeTabController!.index;
      BlocProvider.of<RoomListBloc>(context).add(RoomChangeQuery(
          newQuery: getComponentSelectorQuery(
              _currentPrivilege, widget.app.documentID)));
    }
  }

  Widget theList(BuildContext context, List<RoomModel?> values) {
    var app = widget.app;
    return ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: values.length,
        itemBuilder: (context, index) {
          final value = values[index];
          if (value != null) {
            return getListTile(
              context,
              widget.app,
              trailing: PopupMenuButton<int>(
                  child: Icon(Icons.more_vert),
                  elevation: 10,
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: text(widget.app, context, 'Add to page'),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: text(widget.app, context, 'Update'),
                        ),
                      ],
                  onSelected: (selectedValue) {
                    if (selectedValue == 1) {
                      widget.selected(value.documentID);
                    } else if (selectedValue == 2) {
                      widget.editorConstructor.updateComponent(
                          widget.app, context, value, (_, __) {});
                    }
                  }),
              title: Center(
                  child: StyleRegistry.registry()
                      .styleWithApp(app)
                      .frontEndStyle()
                      .textStyle()
                      .text(app, context, value.documentID)),
              subtitle: value.description != null
                  ? Center(
                      child: StyleRegistry.registry()
                          .styleWithApp(app)
                          .frontEndStyle()
                          .textStyle()
                          .text(app, context, value.description!))
                  : Container(),
            );
          } else {
            return Container();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomListBloc, RoomListState>(builder: (context, state) {
      var children = <Widget>[];
      var newPrivilegeItems = <Widget>[];
      int i = 0;
      for (var privilegeItem in _privilegeItems) {
        newPrivilegeItems.add(Wrap(children: [
          (i <= widget.containerPrivilege)
              ? Icon(Icons.check)
              : Icon(Icons.close),
          Container(width: 2),
          text(widget.app, context, privilegeItem)
        ]));
        i++;
      }
      children.add(tabBar2(widget.app, context,
          items: newPrivilegeItems, tabController: _privilegeTabController!));
      if ((state is RoomListLoaded) && (state.values != null)) {
        children.add(Container(
            height: max(30, widget.height - 101),
            child: theList(
              context,
              state.values!,
            )));
      } else {
        children.add(Container(
          height: max(30, widget.height - 101),
        ));
      }
      children.add(Column(children: [
        divider(widget.app, context),
        Center(
            child: iconButton(
          widget.app,
          context,
          onPressed: () {
            widget.editorConstructor
                .createNewComponent(widget.app, context, (_, __) {});
          },
          icon: Icon(Icons.add),
        ))
      ]));
      return ListView(
          physics: ScrollPhysics(), shrinkWrap: true, children: children);
    });
  }
}
