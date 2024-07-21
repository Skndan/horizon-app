import 'package:horizon/core/helpers/result.dart';
import 'package:horizon/core/network/network_exception.dart';
import 'package:horizon/core/network/network_manager.dart';
import 'package:horizon/view/home/profile.model.dart';

import '../../locator.dart';

/// Created by Balaji Malathi on 7/21/2024 at 20:57.
class ProfileService extends IProfileService with ApiBaseHelper {
  final NetworkManager _api = locator<NetworkManager>();

  static const _getProfileByUserId = "/profile/get-by-user/";
  static const _getProfileById = "/profile/";

  @override
  Future<Result<String, ProfileModel>> getByUserId(String userId) async {
    // After auth
    // try {
      final response = await _api.get(_getProfileByUserId + userId);

      switch (response.statusCode) {
        case 200:
          ProfileModel profileModel = ProfileModel.fromJson(response.data);
          return Right(profileModel);
        default:
          return const Left("Please try again");
      }
    // } catch (e) {
    //   return const Left("Please try again");
    // }
  }

  @override
  Future<Result<String, ProfileModel>> getById(String profileId) async {
    // try {
      final response = await _api.get(_getProfileById + profileId);

      switch (response.statusCode) {
        case 200:
          ProfileModel profileModel = ProfileModel.fromJson(response.data);
          return Right(profileModel);
        default:
          return const Left("Please try again");
      }
    // } catch (e) {
    //   return const Left("Please try again");
    // }
  }
}

abstract class IProfileService {
  // get profile by userId
  Future<Result<String, ProfileModel>> getByUserId(String userId);

  Future<Result<String, ProfileModel>> getById(String profileId);
}
