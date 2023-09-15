import 'dart:convert';

import 'package:avacado_test/model/trending_model.dart';
import 'package:http/http.dart';

class ApiProvider {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";
  Future<List<SimpleModel>> getTrending() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<SimpleModel> posts = body
          .map(
            (item) => SimpleModel.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
