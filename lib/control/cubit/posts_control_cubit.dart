import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:posts_api/model/posts.dart';
import 'package:http/http.dart' as http;
part 'posts_control_state.dart';

class PostsControlCubit extends Cubit<PostsControlState> {
  PostsControlCubit() : super(PostsControlInitial());

  List<Posts>? p;
  String url = 'https://jsonplaceholder.typicode.com/posts';
  Future<void> getdata() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        p = data.map((post) => Posts.fromJson(post)).toList();
        emit(FetchData());
      }
    } catch (e) {
      print(e);
    }
  }
}
