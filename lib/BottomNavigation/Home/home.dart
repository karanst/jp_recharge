
import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quick_pay/BottomNavigation/Account/my_profile.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/add_money.dart';

import 'package:quick_pay/Theme/colors.dart';
import 'package:quick_pay/helper/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/constant.dart';
import '../../model/RechrgeModel.dart';
import '../../model/getbannermodel.dart';
import '../../model/userprofile.dart';
import '../Account/notifications_page.dart';
import '../Scan/scan_page.dart';
import 'Pages/MyWallet.dart';
import 'Pages/get_payment.dart';
import 'Pages/phone_recharge.dart';
import 'Pages/transactions_page.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Payment {
  String image;
  String? title;
  Function onTap;
  Payment(this.image, this.title, this.onTap);
}
class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
  int currentindex=0;

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;
  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
    await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );
    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }
    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }

  Getbannermodel? getbannermodel;
  getBanner() async {
    var headers = {
      'Cookie': 'ci_session=83721b31871c96522e60f489ca4e917362cdb60c'
    };
    var request = http.Request('GET', Uri.parse('${ApiService.getBanner}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = Getbannermodel.fromJson(json.decode(finalResponse));
      print("aaaaaaaa>>>>>>>>>>>>>$jsonResponse");
      setState(() {
        getbannermodel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  String? username;
  String? address;


  Userprofile? getprofile;

  getuserProfile() async{
    print("This is user profile${username}");
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id  =  preferences.getString('id');
    username  =  preferences.getString('username');
    address =preferences.getString("address");
    var headers = {
      'Cookie': 'ci_session=7ff77755bd5ddabba34d18d1a5a3b7fbca686dfa'
    };
    var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}get_profile'));
    request.fields.addAll({
      'user_id': id.toString()
    });
    print("____________________${id}");
    print("request-----------__________${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();


    print("This is user request-----------${response.statusCode}");

    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = Userprofile.fromJson(json.decode(finalResult));
      print("this is final resultsssssssss${finalResult}");
      print("getuserdetails==============>${jsonResponse}");
      setState(() {
        getprofile = jsonResponse;

      });
    }
    else {
      print(response.reasonPhrase);
    }
  }
  RechrgeModel? rechargecard;

  RechargeCard() async {
    var headers = {
      'Cookie': 'ci_session=08b6c6afe557dc70d0ed3fb13b09bda9d8e3e0f2'
    };
    var request = http.Request('POST', Uri.parse('${ApiService.getServices}'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var finalrespionse = await response.stream.bytesToString();
      final jsonresponse = RechrgeModel.fromJson(json.decode(finalrespionse));

      setState(() {
        rechargecard = jsonresponse;
      });
      print(" Rechargemodelllllllllllllllll${finalrespionse}");
      print("Succes>>>>>>>>>>>>>>>>>>>>>>>>>${jsonresponse}");

    }
    else {
      print(response.reasonPhrase);
    }

  }
  void initState(){
    super.initState();
    getuserProfile();
    getBanner();
    RechargeCard();
  }
  Future<Null> _refresh() {
    return callAPI();
  }
 callAPI(){
   getuserProfile();
   getBanner();
   RechargeCard();
 }

  @override
  void dispose() {
    super.dispose();
    _anchoredBanner?.dispose();
  }
  List<Map<String, dynamic>> newsList = [
    {"image": "assets/imgs/Pay or Send.png", "title": "Pay Or Send",},
    {"image": "assets/imgs/wallet.png", "title": "My wallet",},
    {"image": "assets/imgs/Add Money.png", "title": "Add Money",},
    {"image": "assets/imgs/Get Payment.png", "title": "QR Code",},
    {"image": "assets/imgs/Add Money.png", "title": "Transaction History",},
    // {"image": "assets/imgs/Editorial1.png", "title": "Editorial",},
    // {"image": "assets/imgs/Awareness inputs.png", "title": "Awareness Inputs",},
  ];
  List<Map<String, dynamic>> newsList2 = [
    {"image": "assets/imgs/Recharge.png", "title": "Recharge",},
    {"image": "assets/imgs/Electricity.png", "title": "Electricity",},
    {"image": "assets/imgs/Water Bill.png", "title": " Water Bill",},
    {"image": "assets/imgs/Gas Bill.png", "title": "Gas Bil",},
    {"image": "assets/imgs/Recharge.png", "title": "Dth",},
    {"image": "assets/imgs/See all.png", "title": "See all",},
    // {"image": "assets/imgs/Awareness inputs.png", "title": "Awareness Inputs",},
  ];
  @override
  Widget build(BuildContext context) {
    print('${getprofile?.data?.isEmpty}__________');
    return Scaffold(
      key: _refreshIndicatorKey,
      backgroundColor: background,
      body: RefreshIndicator(
        color: primary,
        onRefresh: () async {
          _refresh();
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        // onRefresh: _refresh,
        child: SingleChildScrollView(
          child: getprofile==null || getprofile?.data == ""? Center(child: CircularProgressIndicator(color: white,),):
          Column(
            children: <Widget>[
              Container(
                // height:MediaQuery.of(context).size.height/0.0,
                width:MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color:primary,
                    borderRadius: BorderRadius.only(bottomLeft:Radius.circular(20),
                        bottomRight:Radius.circular(20))),
                child: Column(
                  children: <Widget>[
                    // SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 5, right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => MyProfilePage()));
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(

                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(70),
                                      child:Image.asset("assets/imgs/Layer 1753.png",fit: BoxFit.fill,),

                                      // Image.network("${getprofile?.data?.first.image}")
                                    ),
                                  ),
                                  SizedBox(width: 5,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:50,
                                          child:
                                          Text("${getprofile?.data?.first.username}" ?? " ",style: TextStyle(color: Colors.white,fontSize: 15,overflow: TextOverflow.ellipsis))),
                                      // Container(
                                      //   width: 80,
                                      //   child: Text(address?? "" ,style: TextStyle(color: Colors.white,fontSize: 14, overflow: TextOverflow.ellipsis,
                                      //   ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 4,),
                          Image.asset("assets/homelogo.png",height: 90,),
                          SizedBox(width: 8,),
                          Row(
                            children: [
                              // InkWell(
                              //     onTap: (){
                              //       Navigator.push(context, MaterialPageRoute(builder: (c)=> ScanQRPage()));
                              //     },
                              //     child: Icon(Icons.qr_code_scanner,color: Colors.white,)),
                              SizedBox(width: 5,),
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (c)=> NotificationsPage()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.notifications,color: Colors.white,),
                                  )),
                            ],),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("Quick recharge & Bill Payment",style: TextStyle(color: blackColor,fontWeight: FontWeight.bold,fontSize: 15),),
                  ),
                  _RechargCard2(),
                  _CarouselSlider(),
                ],
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                        width: 30.0,
                        height: 4.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                    Container(
                        width: 30.0,
                        height: 4.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(10),
                        )
                    )
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  newsCard(int i){
    return InkWell(
      onTap: (){
        if(i == 0) {
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => ScanQRPage()));
        }else if(i ==1){
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => MyWallet()));
        }
        else if(i == 2){
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => AddMoneyUI()));
        }
        else if(i == 3){
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => GetPaymentPage()));
        }
        else {
          Navigator.push(
              context, MaterialPageRoute(builder: (C) => TransactionPage()));
        }
      },
      child: Container(
        height: 150,
        width: 100,
        child: Card(
            margin: EdgeInsets.all(10.6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                    children:[
                      Image.asset('${newsList[i]['image']}',height: 45),
                    ]
                ),
                SizedBox(height: 5,),
                Text("${newsList[i]['title']}",textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight: FontWeight.bold),)
              ],
            )),
      ),
    );
  }
  newsCard2(int i){
    return
      rechargecard?.data?[i].status == "1" ?
      Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: (){
          // if(i == 0) {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => PhoneRechargePage()));
          // }
          if(rechargecard?.data?[i].d2h.toString() == "Mobile Recharge"){
            Navigator.push(
                context, MaterialPageRoute(builder: (C) => PhoneRechargePage()));
          }
          // else if(i ==1){
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          //
          // }else if(i == 2){
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          // } else if (i==3){
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          // } else if (i==4){
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          // } else {
          //   Navigator.push(
          //       context, MaterialPageRoute(builder: (C) => MyProfilePage()));
          // }
        },
        child: Container(
          margin:EdgeInsets.all(2) ,
          child: Card(
            elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              // color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                      children:[
                        Image.network('${rechargecard?.data?[i].image}',fit: BoxFit.fill,),
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("${rechargecard?.data?[i].d2h}",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),),
                  )
                ],
              )),
        ),
      ),
    )
    : const SizedBox.shrink();
  }
  _RechargCard2(){
    return  rechargecard == null || rechargecard == "" ? Center(child: CircularProgressIndicator(),)
     : GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:3,
          childAspectRatio: (1 / 1.1),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
      itemBuilder:(context, index) {
        return newsCard2(index);
      },
      itemCount: rechargecard?.data?.length,
    );
  }
  _CarouselSlider(){
    return  Padding(
      padding: EdgeInsets.only(
          top: 18, bottom: 18, left: 10, right: 10),
      child: getbannermodel == null || getbannermodel == "" ? Center(child: CircularProgressIndicator(),):
      CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 1.0,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration:
          Duration(milliseconds: 150),
          enlargeCenterPage: false,
          scrollDirection: Axis.horizontal,
          height: 180,
          onPageChanged: (position, reason) {
            setState(() {
              currentindex = position;
            });
            print(reason);
            print(CarouselPageChangedReason.controller);
          },
        ),
        items: getbannermodel?.data?.map((val) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(20)),
            // height: 180,
            // width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius:
                BorderRadius.circular(20),
                child: Image.network(
                  "${val.image}",
                  fit: BoxFit.fill,
                )),
          );
        }).toList(),
      ),
    );

  }
}

