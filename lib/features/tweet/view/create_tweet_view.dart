import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/assets_constants.dart';
import 'package:twitter_clone/core/core.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/theme/pallete.dart';

class CreateTweetView extends ConsumerStatefulWidget {
  static String route = "/CreateTweetView";
  const CreateTweetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateTweetViewState();
}

class _CreateTweetViewState extends ConsumerState<CreateTweetView> {
  List<File> images = [];
  final tweetController = TextEditingController();

  onPickImages() async {
    images = await pickImages();
    setState(() {});
  }

  @override
  void dispose() {
    tweetController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          RoundedSmallButton(
            onPressed: () {},
            text: "Tweet",
            backgroundColor: Pallete.blueColor,
            color: Pallete.whiteColor,
          ),
        ],
      ),
      body: currentUser == null
          ? Loader()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(currentUser.profilePicture),
                      ),
                      const SizedBox(width: 19),
                      Expanded(
                        child: TextFormField(
                          controller: tweetController,
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                          decoration: const InputDecoration(
                            hintText: "What's happening?",
                            hintStyle: TextStyle(
                              color: Pallete.greyColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                        ),
                      ),
                    ],
                  ),
                  if (images.isNotEmpty)
                    CarouselSlider(
                      items: images
                          .map(
                            (file) => Image.file(
                              file,
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        height: 400,
                        enableInfiniteScroll: false,
                      ),
                    ),
                ],
              ),
            ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          width: 0.3,
          color: Pallete.greyColor,
        ))),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onPickImages,
              child: SvgPicture.asset(AssetsConstants.galleryIcon),
            ),
            const SizedBox(width: 20),
            SvgPicture.asset(AssetsConstants.gifIcon),
            const SizedBox(width: 20),
            SvgPicture.asset(AssetsConstants.emojiIcon),
          ],
        ),
      ),
    );
  }
}
