part of 'api.dart';

class ApiPath {
  static const String _auth = "auth";

  static const String register = "$_auth/register";

  static const String login = "$_auth/login";

  static const String forgotPassword = "$_auth/forgot-password";
  static const String resetPassword = "$_auth/change-password";
}
