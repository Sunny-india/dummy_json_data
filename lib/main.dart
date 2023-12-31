import 'package:dummy_json_data/models/quotes_model.dart';
import 'package:dummy_json_data/page_for_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_model_page.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedValue = 'DataModel';
  String passingValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.systemPurple),
                borderRadius: BorderRadius.circular(20),
              ),
              width: 300,
              child: DropdownButton<String>(
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                },
                items: categories.keys.map((key) {
                  return DropdownMenuItem<String>(
                    value: key,
                    child: Text(key),
                  );
                }).toList(),
                isExpanded: true,
                padding: const EdgeInsets.symmetric(horizontal: 22),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          const SizedBox(height: 80),
          Text(passingValue),
          ElevatedButton(
            onPressed: () {
              categories.forEach((key, value) {
                if (key == selectedValue) {
                  passingValue = value;
                }
              });
              setState(() {});
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PageForData(
                  webAddress: passingValue,
                );
              }));
            },
            child: Text(selectedValue),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const DataModelPage();
          }));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.next_plan_outlined),
      ),
    );
  }
}
