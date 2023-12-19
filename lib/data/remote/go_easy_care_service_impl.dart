import 'dart:convert';
import 'dart:io';

import 'package:go_easy_care/data/model/banner_messages.dart';
import 'package:go_easy_care/data/model/login.dart';
import 'package:go_easy_care/data/model/user.dart';
import 'package:go_easy_care/data/storage_helper.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import '../graph_ql_configuration.dart';
import '../model/media.dart';
import 'apis/app_exception.dart';
import 'go_easy_care_service.dart';
import '../graphql_operation/mutations/mutations.dart' as mutations;

import '../graphql_operation/queries/get_banner_messages.dart' as queries;

class GoEasyCareServiceImpl extends GoEasyCareService {
  @override
  Future<List<Media>> getMediaList(String url) async {

    try {
      final response = await http.get(Uri.parse(mediaBaseUrl + url));
      print("myapplog webservice response: "+response.statusCode.toString()+","+response.body.toString());
      dynamic responseJson = returnResponse(response);

      final jsonData = responseJson['results'] as List;
      List<Media> mediaList =
      jsonData.map((tagJson) => Media.fromJson(tagJson)).toList();
      return mediaList;

    } catch (e) {
      print("myapplog webservice error: "+e.toString());
      throw FetchDataException('No Internet Connection');
    }
  }

  @override
  Future<Login> login(String email, String password) async{


    print("Email: ${email}, Password: ${password}");
    final _options = MutationOptions(
      document:
      gql(mutations.login),
      variables: <String, String?>{
        'email': email,
        'password': password,
      },
    );




    final result = checkResponse(await GraphQLConfiguration().getClient().mutate(_options));
    print("Login result: ${result.toString()}");

    if(result.containsKey("action")) {
      Login login = Login(result["action"]);
      return login;
    }
    throw SomethingWentWrong("Something went wrong");
  }

  @override
  Future<List<BannerMessages>> getBannerMessages() async{

    final _options = WatchQueryOptions(
      document: gql(queries.getBannerMessages),
    );

    final result = checkResponse(await GraphQLConfiguration().getClient().query(_options));
    print("Get banner message result: ${result.toString()}");

    if(result.containsKey("getBannerMessages")) {

      final jsonData = result["getBannerMessages"];
      print("lenght: "+result.length.toString());
      List<BannerMessages> mediaList =
      jsonData.map<BannerMessages>((tagJson) => BannerMessages.fromJson(tagJson)).toList();

      return mediaList;
    }
    throw SomethingWentWrong("Something went wrong");
  }
}
