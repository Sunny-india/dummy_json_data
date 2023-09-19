import 'dart:convert';

import 'package:dummy_json_data/models/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonPostPage extends StatefulWidget {
  const JsonPostPage({super.key});

  @override
  State<JsonPostPage> createState() => _JsonPostPageState();
}

class _JsonPostPageState extends State<JsonPostPage> {
  Future<JsonPost> fromWeb() async {
    String webAddress = 'https://dummyjson.com/posts';
    var response = await http.get(Uri.parse(webAddress));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      JsonPost jsonPost = JsonPost.fromJson(json);
      return jsonPost;
    } else {
      return JsonPost();
    }
  }

  ///
  @override
  void initState() {
    fromWeb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              height: MediaQuery.sizeOf(context).height * .25,
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * .55,
              child: FutureBuilder<JsonPost>(
                  future: fromWeb(),
                  builder:
                      (BuildContext context, AsyncSnapshot<JsonPost> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else if (!snapshot.hasData) {
                      return Text('No Data Exists');
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.posts!.length,
                          itemBuilder: (context, index) {
                            Post post = snapshot.data!.posts![index];
                            return Card(
                              child: ListTile(
                                title: Text(post.body.toString()),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
