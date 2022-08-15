import 'package:test/models/posts_list.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<PostsList?> getPosts() async {
    var client = http.Client();
    var url = Uri.parse('http://localhost:8000/api/v1/post/');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var json = response.body;
      return postsFromJson(json);
    }
    return null;
  }
}
