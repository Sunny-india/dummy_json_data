import 'package:dummy_json_data/models/quotes_model.dart';
import 'package:dummy_json_data/second_model_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'data_model_page.dart';
import 'json_post_page.dart';

class PageForData extends StatefulWidget {
  const PageForData({super.key, required this.webAddress});
  final String webAddress;

  @override
  State<PageForData> createState() => _PageForDataState();
}

class _PageForDataState extends State<PageForData> {
  List<String> keyNames = [];
  List<ItemLabels> objectList = [];
  final PageController _pageController = PageController();
  fromTheCategory() {
    categories.keys.map((e) {
      keyNames.add(e);
    }).toList();
    // once done. do this.
    for (String name in keyNames) {
      objectList.add(ItemLabels(label: name));
    }
  }

  @override
  void initState() {
    fromTheCategory();

    for (ItemLabels single in objectList) {
      single.isSelected = false;
    }
    setState(() {
      /// objectList[index].isSelected = true;
      objectList[0].isSelected = true;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('PageForData'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              child: sideNavigator(size),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: otherHalf(size),
            ),
          ],
        ),
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return Container(
      height: size.height * .85,
      width: size.width * .28,
      color: CupertinoColors.systemTeal,
      child: ListView.builder(
          itemCount: objectList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                /// sent the whole code below to the PageView
                /// to make it connected from there.
                // for (ItemLabels single in objectList) {
                //   single.isSelected = false;
                // }
                // setState(() {
                //   objectList[index].isSelected = true;
                // });
                /// The whole code below is
                /// for the otherHalf functioning.
                /// Used it here to make it connected with here.
                // _pageController.jumpToPage(value);
                _pageController.jumpToPage(index);
              },
              child: Container(
                color: objectList[index].isSelected == true
                    ? CupertinoColors.secondarySystemBackground
                    : CupertinoColors.activeGreen,
                height: size.height / objectList.length,
                child: Center(child: Text(objectList[index].label.toString())),
              ),
            );
          }),
    );
  }

  Widget otherHalf(Size size) {
    return Container(
      height: size.height * .85,
      width: size.width * .72,
      color: CupertinoColors.secondarySystemBackground,
      child: PageView(
          controller: _pageController,
          onPageChanged: (value) {
            /// The whole code below is
            /// for the sideNavigator functioning.
            /// Used it here to make it connected with here.
            for (ItemLabels single in objectList) {
              single.isSelected = false;
            }
            setState(() {
              /// objectList[index].isSelected = true;
              objectList[value].isSelected = true;
            });

            /// sent the whole code below to the PageView
            /// to make it connected from there.
            // _pageController.jumpToPage(value);
          },
          scrollDirection: Axis.vertical,
          children: const [
            DataModelPage(),
            SecondModelPage(),
            JsonPostPage(),
            //Center(child: Text('JsonPost')),
            Center(child: Text('ForthJson')),
            Center(child: Text('User')),
          ]),
    );
  }
}

class ItemLabels {
  String label;
  bool isSelected;
  ItemLabels({required this.label, this.isSelected = false});
}
