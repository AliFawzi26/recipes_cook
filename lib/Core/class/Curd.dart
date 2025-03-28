import 'dart:convert';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:recipes_cook/Core/class/status_request.dart';



import 'check_internet.dart';


class Crud {
  Future<Either<StatusRequest, Map>> postData(
      String linkUrl, Map data, Map<String, String> headers) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(
          Uri.parse(linkUrl),
          body: jsonEncode(data),
          headers: headers,
        );

        print(response);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(response.body);
          return Right(responseBody);
        } else {
          return Left(StatusRequest.serverfailure);
        }
      } else {
        return Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      print(e);
      return Left(StatusRequest.serverfailure);
    }
  }
}