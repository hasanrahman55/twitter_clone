import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/apis/user_api.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/home/view/home_view.dart';
import 'package:twitter_clone/model/user_model.dart';

import '../../../core/core.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authApi: ref.watch(authApiProvider),
    userApi: ref.watch(userApiProvider),
  );
});

final currentUserAccountProvider = FutureProvider((ref) async {
  final authController = ref.watch(authControllerProvider.notifier);
  return authController.currentAccount();
});

class AuthController extends StateNotifier<bool> {
  final AuthApi _authApi;
  final UserApi _userApi;
  AuthController({required AuthApi authApi, required UserApi userApi})
      : _authApi = authApi,
        _userApi = userApi,
        super(false);

  Future<model.Account?> currentAccount() => _authApi.currentUserAccount();
  void signUp(
      {required email,
      required password,
      required BuildContext context}) async {
    state = true;
    final res = await _authApi.signUp(email: email, password: password);
    state = false;
    res.fold((l) => showSnakBar(context, l.message), (r) async {
      UserModel userModel = UserModel(
        name: getNameFromEmail(email),
        email: email,
        followers: [],
        following: [],
        profilePicture: '',
        banarPicture: '',
        uid: '',
        bio: '',
        isTwitterblue: false,
      );
      final result = await _userApi.saveUserData(userModel);
      result.fold((l) => showSnakBar(context, l.message), (r) {
        showSnakBar(context, "account created! please login");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ),
        );
      });
    });
  }

  void signIn(
      {required email,
      required password,
      required BuildContext context}) async {
    state = true;
    final res = await _authApi.logIn(email: email, password: password);
    state = false;
    res.fold((l) => showSnakBar(context, l.message), (r) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeView(),
        ),
      );
    });
  }
}
