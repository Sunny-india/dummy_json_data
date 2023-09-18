import 'dart:convert';

import 'package:dummy_json_data/quote_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/quotes_model.dart';

import 'package:http/http.dart' as http;

class DataModelPage extends StatefulWidget {
  const DataModelPage({super.key});

  @override
  State<DataModelPage> createState() => _DataModelPageState();
}

class _DataModelPageState extends State<DataModelPage> {
  late Future<DataModel?> data;
  late String appBarTitle = '';

  Future<DataModel?> fetchFromJson() async {
    var response = await http.get(Uri.parse("https://dummyjson.com/quotes"));
    print(response.runtimeType);
    if (response.statusCode == 200) {
      print(response.body);
      var json = jsonDecode(response.body);
      DataModel dataModel = DataModel.fromJson(json);
      fetchTitle();
      return dataModel;
    } else {
      return DataModel();
    }
  }

  void fetchTitle() {
    data.then((dataModel) {
      if (dataModel != null) {
        appBarTitle = dataModel.total.toString();
      } else {
        appBarTitle = 'Loading';
      }
    });
    data.whenComplete(() {
      setState(() {});
    });
  }

  @override
  void initState() {
    data = fetchFromJson();
    // fetchTitle(); or in the above function.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: data,
          builder: (BuildContext context, AsyncSnapshot<DataModel?> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.quotes!.length,
                  itemBuilder: (context, index) {
                    QuoteModel quotes = snapshot.data!.quotes![index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return QuotePage(
                            writer: quotes.author.toString(),
                            allQuotesByTheWriter: snapshot.data!.quotes!,
                          );
                        }));
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(
                            quotes.quote.toString(),
                          ),
                          subtitle: Text(
                            quotes.author.toString(),
                            style: const TextStyle(
                                color: CupertinoColors.destructiveRed),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const Text('Not met the first if condition.');
            }
          },
        ),
      ),
    );
  }
}
