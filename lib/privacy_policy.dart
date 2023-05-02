import 'dart:convert';

import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'Theme/colors.dart';
import 'package:http/http.dart'as http;

import 'helper/apiservices.dart';
import 'model/getsettingmodel.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  var privacyPolicy;
  getSettingApi() async {
    var headers = {
      'Cookie': 'ci_session=eb651cdce0850614d296b81363913b2ca08fe641'
    };
    var request = http.Request('POST', Uri.parse('${ApiService.getSettings}'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("Privacy PolicyI hereeeeeeeeeeeeeeeeee${privacyPolicy}");
      final result =  await response.stream.bytesToString();
      final jsonResponse = json.decode(result);
      print("Thiiiiiiiiiiiiiiiiisssssssss${jsonResponse}");
      setState(() {
        privacyPolicy = jsonResponse['data']['privacy_policy'][0];
      });
    }
    else {
      print(response.reasonPhrase);
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSettingApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primary,
          title: Text("Privacy Policy"),
        ),
        body: ListView(
          children: [
            privacyPolicy == null ? Center(child: CircularProgressIndicator()) :Html(
                data:"${privacyPolicy}"
            )
          ],
        )
    );
  }
}
