import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/quotes_model.dart';

class SecondModelPage extends StatefulWidget {
  const SecondModelPage({super.key});

  @override
  State<SecondModelPage> createState() => _SecondModelPageState();
}

class _SecondModelPageState extends State<SecondModelPage> {
  late Future<SecondModel> data;

  Future<SecondModel> dataFromWeb() async {
    var response = await http.get(Uri.parse('https://dummyjson.com/comments'));
    if (response.statusCode == 200) {
      print(response.body);
      var inner = jsonDecode(response.body);
      SecondModel secondModel = SecondModel.fromJson(inner);
      return secondModel;
    } else {
      return SecondModel();
    }
  }

  @override
  void initState() {
    data = dataFromWeb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<SecondModel>(
          future: data,
          builder: (BuildContext context, AsyncSnapshot<SecondModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Error: ${snapshot.error.toString()}');
              } else {
                if (!snapshot.hasData) {
                  return const Text('Data Does Not Exist');
                } else {
                  if (snapshot.data == null) {
                    return const Text('Data is Null');
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.comments!.length,
                        itemBuilder: (context, index) {
                          Comments comments = snapshot.data!.comments![index];
                          return Card(
                            child: ListTile(
                              leading: Text(comments.id.toString()),
                              title: Text(
                                comments.body.toString(),
                                textAlign: TextAlign.left,
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Posted By:'),
                                  const SizedBox(height: 6),
                                  Text(comments.postId.toString()),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }
              }
            }
          },
        ),
      ),
    );
  }
}
