import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:horizon/core/base/base_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../core/enums/pref.dart';
import '../../product/navigation/route_constant.dart';
import '../../product/utils/ui.dart';
import 'auth.service.dart';
import 'model/jwt.model.dart';

class AuthViewModel extends BaseModel with BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  //region Variable Initialization
  final formKey = GlobalKey<FormBuilderState>();
  late AuthService _service;
  bool _formLoading = false;

  bool get formLoading => _formLoading;

  set formLoading(bool value) {
    _formLoading = value;
    notifyListeners();
  }

  //endregion

  @override
  void init() {
    _service = AuthService();
  }

  Future login(Map<String, dynamic> formData) async {
    formLoading = true;

    await _service.authenticate(formData).then((value) =>
        value.fold((l) => showSnackBar(context: context, content: l), (r) {
          // Extracting user details
          JwtModel model = JwtModel.fromJson(JwtDecoder.decode(r.token));
          localManager.setString(Pref.authToken, r.token);
          localManager.setString(Pref.refreshToken, r.refreshToken);
          localManager.setString(Pref.uid, model.jti);
          localManager.setString(Pref.email, model.upn);
          localManager.setBool(Pref.isLogged, true);
          formLoading = false;
          routerService.pushAndClear(Routes.home);
        }));
  }
}
