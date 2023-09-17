import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/quotes_model.dart';

class QuotePage extends StatefulWidget {
  const QuotePage(
      {super.key, required this.writer, required this.allQuotesByTheWriter});
  final String writer;
  final List<QuoteModel> allQuotesByTheWriter;

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  List<String> allQ = [];
  @override
  void initState() {
    singleWriterAllQuotes();
    super.initState();
  }

  void singleWriterAllQuotes() {
    for (var element in widget.allQuotesByTheWriter) {
      if (widget.writer == element.author) {
        allQ.add(element.quote);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.writer),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: allQ.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(allQ[index]),
                  subtitle: Text(
                    widget.writer,
                    style:
                        const TextStyle(color: CupertinoColors.destructiveRed),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
