// ignore: file_names

import 'package:flutter/material.dart';
import 'package:page_animation_transition/animations/top_to_bottom_faded.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:travel_app/user/home_user.dart';

pageHotel1() {
  return SafeArea(
      child: Column(children: [
    Builder(builder: (context) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(PageAnimationTransition(
                      page: const HomeUser(),
                      pageAnimationType: TopToBottomFadedTransition()));
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),

                
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              'Hotel',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    })
  ]));
}
