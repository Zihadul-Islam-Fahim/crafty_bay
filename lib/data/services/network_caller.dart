import 'dart:convert';
import 'dart:developer';
import 'package:crafty_bay/data/models/network_response.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url, {String? token}) async {
                                                                                  log(url);

    Response response = await get(Uri.parse(url), headers: {
      'token': (token ?? AuthController.token).toString(),
      'Content-type': 'application/json'
    });
                                                                                  log(response.statusCode.toString());
                                                                                  log(response.body.toString());
    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 && decodedResponse["msg"] == "success") {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedResponse,
      );
    } else if(response.statusCode == 401){
      AuthController.goToLogIn();
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        msg: decodedResponse['data'],
      );
    }else {
      return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          responseData: decodedResponse,
          msg: decodedResponse['data'] ?? 'Something Went Wrong');
    }
  }

  Future<NetworkResponse> postRequest(String url,
      {Map<String, dynamic>? body, String? token}) async {
                                                                                  log(url);
                                                                                  log(body.toString());
    Response response = await post(Uri.parse(url),
        body: jsonEncode(body),
        headers: {
          'token': (token ?? AuthController.token).toString(),
          'Content-type': 'application/json'
        });
                                                                                  log(response.statusCode.toString());
                                                                                  log(response.body.toString());

    final decodedResponse = jsonDecode(response.body);

    if (response.statusCode == 200 && decodedResponse["msg"] == "success") {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedResponse,
      );
    } else if (response.statusCode == 401) {
      AuthController.goToLogIn();
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        msg: decodedResponse['data'],
      );
    } else {
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedResponse,
        msg: decodedResponse['data'],
      );
    }
  }
}
