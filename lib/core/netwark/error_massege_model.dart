import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
 final String statuscode;
 final bool success;
 final String statusMessage;

const ErrorMessageModel({
   required this.statuscode,
   required this.success,
   required this.statusMessage,
 });
factory ErrorMessageModel.fromjson(Map<String,dynamic>json){
  return ErrorMessageModel(
      statuscode: json["status_code"],
      success: json["success"],
      statusMessage: json["status_message"]
  );
}

  @override
  List<Object?> get props => [statuscode,success,statusMessage];


}