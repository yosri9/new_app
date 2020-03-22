import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:news_app/utilities/api_utilities.dart';
import 'package:news_app/models/post.dart';


class PostsAPI{
  Future <List<Post>> fetchWhatsNew() async {
    String whatsNewApi = base_api + whats_NewApi;
    var response = await http.get(whatsNewApi);
    List<Post> posts = List<Post>();
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];
      for (var item in data) {
        Post post = Post(
            item["id"].toString(),
            item["title"].toString(),
            item["content"].toString(),
            item["datewritten"].toString(),
            item["featuredImage"].toString(),
            item["votes_up"],
            item["vote_down"],
            (item["voters_up"] == null) ? List<int>() : jsonDecode(
                item["voters_up"]),
            (item["voters_down"] == null) ? List<int>() : jsonDecode(
                item["voters_down"]),
            item["user_id"],
            item["category_id"]
        );
        posts.add(post);
      }
    }


    return posts;


  }
}