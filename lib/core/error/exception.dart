
import 'package:movies_app/core/netwark/error_massege_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

 const ServerException({required this.errorMessageModel});
}