import 'dart:math';

import 'package:Test/models/category_result.dart';
import 'package:Test/redux/actions.dart';
import 'package:Test/redux/app_state.dart';
import 'package:Test/redux/store.dart';
import 'package:Test/ui/profile.dart';
import 'package:Test/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

import 'package:flutter_redux/flutter_redux.dart';

class PassionScreen extends StatefulWidget {
  @override
  _PassionScreenState createState() => _PassionScreenState();
}

class _PassionScreenState extends State<PassionScreen> {
  ScrollController _scrollController = ScrollController();
  Random random = new Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    store.dispatch(getCategory());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    print(
        "MediaQuery.of(context).size.width*0.02 ${MediaQuery.of(context).size.width * 0.04}");
    return StoreProvider<AppState>(
      store: store,
      child: Scaffold(
        //backgroundColor: const Color(0xFF011071),
        body: Stack(
          children: [
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(start: 0.0, end: 0.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                      const Color(0xFF020F5F),
                      const Color(0xFF011071).withOpacity(0.95)
                    ])),
              ),
            ),
            Pinned.fromPins(
              Pin(size: 76.0, middle: 0.5),
              Pin(size: 18.0, middle: 0.09),
              child: Text(
                'PASSIONS',
                style: TextStyle(
                  fontFamily: 'Helvetica Neue',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
            Container(),
            Pinned.fromPins(
              Pin(size: 260.0, middle: 0.5),
              Pin(size: 38.0, middle: 0.159),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Text(
                      'What are you into?',
                      style: TextStyle(
                        fontFamily: 'Helvetica Neue',
                        fontSize: MediaQuery.of(context).size.width * 0.08,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Pinned.fromPins(
              Pin(start: 54.0, end: 54.0),
              Pin(size: 67.0, middle: 0.2556),
              child: Text(
                'Pick at least 5',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: const Color(0xffffffff),
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
              ),
            ),
            StoreConnector<AppState, _PassionScreenViewModel>(
              converter: (store) {
                return _PassionScreenViewModel(
                    state: store.state.dataState, results: store.state.results);
              },
              builder: (context, viewModel) {
                if (viewModel.state == EnumState.LOADING) {
                  print("Asda");
                  return Padding(
                    padding: EdgeInsets.only(
                        top: height * 0.3, bottom: height * 0.2),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (viewModel.state == EnumState.SUCCESS)
                  return SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.3, bottom: height * 0.2),
                        child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            direction: Axis.vertical,
                            children: List.generate(
                                viewModel.results.data.interests.length,
                                (index) {
                              double num = random.nextInt(50).toDouble();

                              return Container(
                                width: 75 + num,
                                height: 75 + num,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.elliptical(9999.0, 9999.0)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          COLOR_BLUE_OPS,
                                          COLOR_BLUE_OPS
                                        ]),
                                    image: DecorationImage(
                                        image: NetworkImage(viewModel
                                            .results.data.interests[index]
                                            .getInteresetPhoto()))),
                                child: Text(
                                  '${viewModel.results.data.interests[index].name}',
                                  style: TextStyle(
                                    fontFamily: 'Helvetica',
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.03,
                                    color: const Color(0xffffffff),
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }))),
                  );
                else
                  return Center(
                      child: Container(
                    child: Text(
                      "Something went wrong, Please try again!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ));
              },
            ),
           /* Pinned.fromPins(
              Pin(size: 260.0, middle: 0.52),
              Pin(size: 0.3, middle: 0.85),
              child: LinearProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black12),
                value: _scrollController.offset,

              ),
            ),*/
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProfileScreen()));
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: width * 0.1,
                      left: width * 0.1,
                      right: width * 0.1),
                  child: Container(
                    alignment: Alignment.center,
                    //  margin: EdgeInsets.only(bottom: width*0.1,left: width*0.1,right: width*0.1),
                    height: height * 0.08,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              1.0, // Move to right 10  horizontally
                              1.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              COLOR_BLUE,
                              Color(0xFF466AFA),
                            ])),
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: const Color(0xffffffff),
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PassionScreenViewModel {
  final EnumState state;
  final Category results;

  _PassionScreenViewModel({this.state, this.results});
}
