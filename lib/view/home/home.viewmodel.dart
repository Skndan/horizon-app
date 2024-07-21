import 'package:bonsoir/bonsoir.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:horizon/product/utils/ui.dart';
import 'package:horizon/view/home/profile.model.dart';
import 'package:horizon/view/home/profile.service.dart';

import '../../core/base/base_model.dart';
import '../../core/enums/pref.dart';

/// Created by Balaji Malathi on 7/21/2024 at 18:25.

class HomeViewModel extends BaseModel with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  //region Variable Initialization
  final formKey = GlobalKey<FormBuilderState>();
  late ProfileService _profileService;
  BonsoirService? _service;
  BonsoirBroadcast? _publisher;
  String profileId = "", userId = "";
  bool _loadingUser = false;

  String _broadcastMessage = "Starting Broadcast";

  String get broadcastMessage => _broadcastMessage;

  set broadcastMessage(String value) {
    _broadcastMessage = value;
    notifyListeners();
  }

  bool _loadingBroadcast = false;

  bool get loadingUser => _loadingUser;

  bool get loadingBroadcast => _loadingBroadcast;

  set loadingBroadcast(bool value) {
    _loadingBroadcast = value;
    notifyListeners();
  }

  late ProfileModel profile;

  set loadingUser(bool value) {
    _loadingUser = value;
    notifyListeners();
  } //endregion

  @override
  void init() {
    profileId = localManager.getString(Pref.profileId);
    userId = localManager.getString(Pref.uid);
    _profileService = ProfileService();
  }

  Future getProfile() async {
    await checkProfile().then((value) {
      profileId = localManager.getString(Pref.profileId);
    });
  }

  Future bonsoirStop() async {
   await _publisher!.stop();
  }

  Future bonsoirInit() async {
    _service = BonsoirService(
      name: profile.name ?? '',
      type: '_horizon_attendance._tcp',
      port: 3030,
      attributes: {
        "id": profile.id ?? ''
      }
    );
    _publisher = BonsoirBroadcast(service: _service!);
    _publisher!.ready.then((_) {
      _publisher!.start().then((value) {
        broadcastMessage = "Broadcast Started";
        loadingBroadcast = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _publisher?.stop();
  }

  Future checkProfile() async {
    setState(ViewState.Busy);
    if (profileId.isEmpty) {
      // call api
      await _profileService.getByUserId(userId).then((value) {
        value.fold((l) {
          showSnackBar(context: context, content: l);
        }, (r) {
          profile = r;
          localManager.setString(Pref.profileId, r.id ?? '');
          setState(ViewState.Idle);
          notifyListeners();
        });
      });
    } else {
      await _profileService.getById(profileId).then((value) {
        value.fold((l) {
          showSnackBar(context: context, content: l);
        }, (r) {
          profile = r;
          localManager.setString(Pref.profileId, r.id ?? '');
          notifyListeners();
          setState(ViewState.Idle);
        });
      });
    }
  }
}
