import 'package:envied/envied.dart';

part 'environment.g.dart';

@Envied(path: '.env')
abstract class Environment {
  @EnviedField(varName: 'SCHEMA_PROD')
  static const String schemaProd = _Environment.schemaProd;
  @EnviedField(varName: 'HOST_PROD')
  static const String hostProd = _Environment.hostProd;
  @EnviedField(varName: 'PATH_PROD')
  static const String pathProd = _Environment.pathProd;

  @EnviedField(varName: 'SCHEMA_DEV')
  static const String schemaDev = _Environment.schemaDev;
  @EnviedField(varName: 'HOST_DEV')
  static const String hostDev = _Environment.hostDev;
  @EnviedField(varName: 'PATH_DEV')
  static const String pathDev = _Environment.pathDev;
  @EnviedField(varName: 'WEB_PUSH_CERTIFICATE')
  static const String vapidKey = _Environment.vapidKey;

  @EnviedField(varName: 'MAPS_API_KEY')
  static const String mapsKey = _Environment.mapsKey;
  @EnviedField(varName: 'MAPS_SCHEMA')
  static const String mapsSchema = _Environment.mapsSchema;
  @EnviedField(varName: 'MAPS_HOST')
  static const String mapsHost = _Environment.mapsHost;
  @EnviedField(varName: 'MAPS_PATH')
  static const String mapsPath = _Environment.mapsPath;
}

// String envMode = "production";
String envMode = "development";