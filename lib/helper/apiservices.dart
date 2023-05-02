import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  ///RECHARGE 3rd PARTY API////////////////
  static const String rechargeBaseUrl = "https://paysprint.in/service-api/api/v1/service/recharge/";
  static const String getMobileOperators = rechargeBaseUrl+'recharge/getoperator';
  static const String doRecharge = rechargeBaseUrl+'recharge/dorecharge';

  ///RECHARGE 3rd PARTY API////////////////



  static const String baseUrl = "https://developmentalphawizz.com/financego/app/v1/api/";
  static const String imageUrl = "https://developmentalphawizz.com/financego/";

  static const String userRegister = baseUrl+'user_register';
  static const String login = baseUrl+'v_send_otp';
  static const String verifyOtp = baseUrl+'v_verify_otp';
  static const String getSlider = baseUrl + 'get_slider_images';
  static const String getUserProfile = baseUrl+'get_profile';
  static const String updateUserProfile = baseUrl+'update_user';
  static const String getEvents = baseUrl+'get_events';
  static const String getFaq = baseUrl+'get_faqs';
  static const String getWallet = baseUrl+'get_wallet_transaction';
  static const String addMoneyWallet = baseUrl+'add_money_wallet';
  static const String getServices = baseUrl+'get_service';
  static const String getBanner = baseUrl+'get_slider_images';
  static const String getNewType = baseUrl+'get_news_type';
  static const String selectCategory = baseUrl+'select_category';
  static const String getCounting = baseUrl+'get_counting';
  static const String getEditorial = baseUrl+'get_editorial';
  static const String addDoctorNews = baseUrl+'add_doctor_news';
  static const String addDoctorAwreness = baseUrl+'add_awareness';
  static const String addDoctorEditorial = baseUrl+'add_doctor_editorial';
  static const String addDoctorEvent = baseUrl+'add_doctor_event';
  static const String getAwareness = baseUrl+'get_awareness';
  static const String getSettings = baseUrl+'get_settings';
  static const String getPharmaCategory = baseUrl+'select_category';
  static const String getPharmaProductsCategory = baseUrl+'pharma_category';
  static const String getPharmaProducts = baseUrl+'get_products';
  static const String getUserCart = baseUrl+'get_user_cart';
  static const String getPlaceOrderApi = baseUrl+'place_order';
  static const String getRemoveCartApi = baseUrl+'remove_from_cart';
  static const String getManageCartApi = baseUrl+'manage_cart';
  static const String addDoctorWebinar = baseUrl+'add_doctor_webinar';
}


