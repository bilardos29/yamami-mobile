part of 'api.dart';

class ApiPath {
  static const String _auth = "auth";

  static const String register = "$_auth/register";

  static const String login = "$_auth/login";

  static const String forgotPassword = "$_auth/forgot-password";
  static const String resetPassword = "$_auth/change-password";

  static const String verifyOtp = "$_auth/verify-otp";
  static const String requestOtp = "$_auth/request-otp";

  static const String promoBanner = "promo-banners";
  static const String category = "product-categories";
  static const String product = "products";

  static const String promoCollection = "admin/promo-collections";
}
