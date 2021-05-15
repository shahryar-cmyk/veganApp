import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:veganapp/Models/wordpress_post.dart';
import 'package:veganapp/const.dart';

class NetworkWordPress {
  Future getPosts() async {
    print('This Save Runss --- ');
    try {
      Response responseDataString = await HttpRequestOfApp()
          .postFunction({}, '$WORDPRESS_POST_OF_THE_CONTENT');
      final wordPress = wordPressPostFromJson(responseDataString.body);
      print('This is the Post Arthur ${wordPress[0].author}');
      print('This is the json String ${responseDataString.body}');

      print(responseDataString.body);

      return wordPress;
    } catch (error) {
      throw error;
    }
  }
}
