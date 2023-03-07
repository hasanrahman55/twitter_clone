import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/constants/appwrite_constant.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/features/home/view/home_view.dart';
import 'package:twitter_clone/features/tweet/view/create_tweet_view.dart';
import 'package:twitter_clone/theme/app_theme.dart';

import 'common/common.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      routes: {
        HomeView.route: (context) => const HomeView(),
        LoginView.route: (context) => const LoginView(),
        SignUpView.route: (context) => const SignUpView(),
        CreateTweetView.route: (context) => const CreateTweetView(),
      },
      home: ref.watch(currentUserAccountProvider).when(
            data: (user) {
              if (user != null) {
                return HomeView();
              }
              return LoginView();
            },
            error: (error, s) => ErrorPage(error: error.toString()),
            loading: () => LoadingPage(),
          ),
    );
  }
}
