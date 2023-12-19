import 'dart:convert';
import 'dart:io';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;

import 'apis/app_exception.dart';

abstract class BaseService {
  final String mediaBaseUrl = "https://itunes.apple.com/search?term=";

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }

  Map<String, dynamic> checkResponse(QueryResult response) {


    if(response.hasException) {

      OperationException? exception = response.exception;

      if(exception != null) {

        if(exception.graphqlErrors.isNotEmpty) {
          throw OperationExceptionApp(exception.graphqlErrors[0].message);
        } else {

          if(exception.linkException != null && exception.linkException?.originalException != null) {
            SocketException? socketException = (exception.linkException?.originalException) as SocketException;
            throw OperationExceptionApp(socketException.message);
          } else {
            throw SomethingWentWrong("Something went wrong");
          }
        }
      } else {
        throw SomethingWentWrong("Something went wrong");
      }
    } else {
      if(response.data != null)
        return response.data!;
      else
        throw SomethingWentWrong("Something went wrong");
    }

  }

}
