import 'dart:convert';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quick_pay/Components/custom_button.dart';
import 'package:quick_pay/Components/entry_field.dart';
import 'package:http/http.dart' as http;
import 'package:quick_pay/Locale/locales.dart';
import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:quick_pay/helper/constant.dart';
import 'package:quick_pay/model/Recharge-Third-Party-Model/get_operator_model.dart';

class PhoneRechargePage extends StatefulWidget {
  @override
  _PhoneRechargePageState createState() => _PhoneRechargePageState();
}

class _PhoneRechargePageState extends State<PhoneRechargePage> {

  bool postpaid = false;
  String? categoryValue;
  List<OperatorList> operatorList = [];
  TextEditingController mobileController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMobileOperator();
    // Future.delayed(Duration(seconds: 1), (){
    //   getMobileOperator();
    // });
  }

  getMobileOperator() async{
    var headers = {
      'Token': jwtToken.toString(),
      'Authorisedkey': authKey.toString(),
      'Cookie': 'ci_session=aa83f4f9d3335df625437992bb79565d0973f564'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiService.getMobileOperators));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String str = await response.stream.bytesToString();
      var result = json.decode(str);
      final finalResponse = GetOperatorModel.fromJson(result);
      operatorList = finalResponse.data!;
      print("this is operator list ----->>>> ${operatorList[0].name}");
    }
    else {
      print(response.reasonPhrase);
    }

  }

  doRecharge() async{
    var headers = {
      'Token': jwtToken.toString(),
      'Authorisedkey': authKey.toString(),
      'Cookie': 'ci_session=aa83f4f9d3335df625437992bb79565d0973f564'
    };

    var request = http.MultipartRequest('POST', Uri.parse(ApiService.doRecharge));

    request.headers.addAll(headers);

    //  data = json.encode({
    //   "operator": categoryValue.toString(),
    //   "canumber": mobileController.text.toString(),
    //   "amount": amountController.text.toString(),
    //   "referenceid": '123'
    // }) ;


    // request.fields.addAll(data);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String str = await response.stream.bytesToString();
      var result = json.decode(str);
      Fluttertoast.showToast(msg: "${result['message']}");
      // final finalResponse = GetOperatorModel.fromJson(result);

      // operatorList = finalResponse.data!;

    }
    else {
      print(response.reasonPhrase);
    }
  }


  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        centerTitle: true,
        iconTheme: IconThemeData(color: white),
        title: Text(
          locale.phoneRecharge!,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w700,color: white),
        ),
      ),
      body: FadedSlideAnimation(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Spacer(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       locale.prepaid!,
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .subtitle1!
                  //           .copyWith(fontWeight: FontWeight.w700),
                  //     ),
                  //     Transform.scale(
                  //         scale: 0.8,
                  //         child: CupertinoSwitch(
                  //             activeColor: Theme.of(context).primaryColorLight,
                  //             trackColor: Theme.of(context).primaryColorLight,
                  //             value: postpaid,
                  //             onChanged: (value) {
                  //               setState(() {
                  //                 postpaid = !postpaid;
                  //               });
                  //             })),
                  //     Text(
                  //       locale.postpaid!,
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .subtitle1!
                  //           .copyWith(fontWeight: FontWeight.w700),
                  //     )
                  //   ],
                  // ),
                  // Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: EntryField(
                        locale.enterPhoneNumber,
                        Icon(
                          Icons.perm_contact_cal,
                          color: Theme.of(context).primaryColorLight,
                        ), controller: mobileController,),

                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: EntryField(
                  //       locale.selectOperator, Icon(Icons.keyboard_arrow_down)),
                  // ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: EntryField(
                        locale.amount! + '(\₹)',
                        Icon(Icons.add_box_outlined, color: Colors.white,),
                        controller: amountController,

                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 16.0, horizontal: 12.0),
                        //   child: Text(
                        //     "View plans",
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodyText1!
                        //         .copyWith(
                        //             color: Theme.of(context).primaryColorLight),
                        //   ),
                        // )
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: DropdownButton(
                      // Initial Value
                      value: categoryValue,
                      // underline: Container(),
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: Icon(Icons.keyboard_arrow_down, color: primary,),
                      hint: Text("Select Operator", style: TextStyle(
                          color: blackColor
                      ),),
                      // Array list of items
                      items: operatorList.map((items) {
                        return DropdownMenuItem(
                          value: items.id,
                          child: Container(
                              child: Text(items.name.toString())),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          categoryValue = newValue!;
                          print("selected category ${categoryValue}");
                        });
                      },
                    ),
                  ),
                  Spacer(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  //   child: EntryField("CashBack", null),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 12),
                    child: CustomButton(locale.payViaQuickpay,
                    onTap: (){
                      if(amountController.text.isNotEmpty && mobileController.text.isNotEmpty && categoryValue!.isNotEmpty) {
                        doRecharge();
                      }else{
                        Fluttertoast.showToast(msg: "Please fill required fields");
                      }
                    },),
                    
                  ),
                  // WinterSaleBanner(),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
