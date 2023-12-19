import 'package:go_easy_care/data/storage_helper.dart';
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLConfiguration {

  static final HttpLink _httpLink = HttpLink(
    'https://api.qa.gec.onl/graphql'
  );

  static final AuthLink _authLink = AuthLink(
    // ignore: undefined_identifier
    //getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',

    getToken: () async => StorageHelper.instance.getValue("token"),
  );




  static final Link _link = _authLink.concat(_httpLink);

  GraphQLClient getClient() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: _link,
    );
  }

}
