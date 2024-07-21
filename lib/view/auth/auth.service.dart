import 'package:horizon/core/helpers/result.dart';

import '../../core/network/network_exception.dart';
import '../../core/network/network_manager.dart';
import '../../locator.dart';
import 'model/auth.model.dart';

class AuthService extends IAuthService with ApiBaseHelper {
  final NetworkManager _api = locator<NetworkManager>();

  static const _signIn = "/auth/authenticate";

  @override
  Future<Result<String, LoginModel>> authenticate(body) async {
    // After auth
    try {
      final response = await _api.post(_signIn, body);

      switch (response.statusCode) {
        case 200:
          LoginModel authModel = LoginModel.fromJson(response.data);
          return Right(authModel);
        default:
          return const Left("Please try again");
      }
    } catch (e) {
      return const Left("Please try again");
    }
  }
}

abstract class IAuthService {
  Future<Result<String, LoginModel>> authenticate(dynamic body);
}

/// Created by Balaji Malathi on 7/21/2024 at 20:16.
