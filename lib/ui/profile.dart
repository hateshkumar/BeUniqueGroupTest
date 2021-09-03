import 'dart:math';

import 'package:Test/models/profile_result.dart';
import 'package:Test/redux/actions.dart';
import 'package:Test/redux/app_state.dart';
import 'package:Test/redux/store.dart';
import 'package:Test/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:circle_list/circle_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:geocoder/geocoder.dart';
import 'package:adobe_xd/pinned.dart';



class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileStore.dispatch(getProfile());
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
   return StoreProvider<AppState>(
      store: profileStore,
      child:Scaffold(
        backgroundColor: COLOR_BLUE_OPS,
        body: Center(
          child: SingleChildScrollView(

            child:  StoreConnector<AppState, _ProfileScreenViewModel>(
              converter: (profileStore) {
                return _ProfileScreenViewModel(
                    state: profileStore.state.dataState,
                    results: profileStore.state.profileModel
                );
              },
              builder: (context, viewModel) {

                print(viewModel.state);
                print(viewModel.results);
                if(viewModel.state == EnumState.LOADING){
                  return CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)

                  );
                }
                else if(viewModel.state == EnumState.SUCCESS)
                {
                  return Column(
                    children: [
                      SliderWidget(viewModel.results.data.profile),
                      BodyWidget(viewModel.results.data.profile),
                    ],
                  );

                }
                else
                  return Center(child: Container(
                    child: Text("Something went wrong, Please try again!",style: TextStyle(
                        color: Colors.white
                    ),),
                  ));
              },
            ),
          ),
        ),
      ),
    );
  }



}

class BodyWidget extends StatelessWidget {
  final Profile profile;
  BodyWidget(this.profile);
  ScrollController _scrollController = ScrollController();
  Random random = new Random();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
     // height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [COLOR_BLUE, COLOR_BLUE.withOpacity(0.9)])),
      child:  Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .08),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * .03,
              ),
              TitleView(
                titleText: '${profile.name??""}, ${profile.age??""}',
              ),
              SizedBox(
                height: height * .03,
              ),
              LongTextView(
                text:
                '${profile.bio??""}',
              ),
              SizedBox(
                height: height * .03,
              ),
              TitleView(
                titleText: 'Basic Info',
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                decoration: BoxDecoration(
                    color: COLOR_BLUE_OPS,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  children: [
                    RowView(text: 'Name',fillText: '${profile.name??""}',),
                    Divider(color: COLOR_BLUE.withOpacity(0.5),height: 0,thickness: 2.5,),
                    RowView(text: 'Gender',fillText: '${profile.gender??""}',),
                    Divider(color: COLOR_BLUE.withOpacity(0.5),height: 0,thickness: 2.5,),
                    RowView(text: 'Age',fillText: '${profile.age??""}',),
                    Divider(color: COLOR_BLUE.withOpacity(0.3),height: 0,thickness: 2.5,),
                    RowView(text: 'Location',fillText: 'location',),
                  ],
                ),
              ),
              SizedBox(
                height: height * .06,
              ),
              TitleView(
                titleText: 'Personal Info',
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                decoration: BoxDecoration(
                    color: COLOR_BLUE_OPS,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: ListView.builder(
                    itemCount: profile.basicInfo.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          RowView(text: '${profile.basicInfo[index].keys.name }',fillText: '${profile.basicInfo[index].value}',),
                          Divider(color: COLOR_BLUE.withOpacity(0.5),height: 0,thickness: 2.5,),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: height * .04,
              ),
              TitleView(
                titleText: '100 Instagram Posts',
              ),
              SizedBox(
                height: height * .02,
              ),

              Wrap(
                runSpacing: height*0.01,
                spacing: height*0.01,
                children: List.generate(6, (index){
                  return Container(
                    height: height*0.135,
                    width: height*.132,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: height * .04,
              ),
              TitleView(
                titleText: 'Passion',
              ),
              SizedBox(
                height: height * .04,
              ),
              CircleList(

                origin: Offset(-40, 10),
                children: List.generate( profile.interests.length, (index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Container(
                        width: 70,
                        height: 70,
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
                                image: NetworkImage( profile.interests[index]
                                    .getInteresetPhoto()))),
                        child: Text(
                          '${ profile.interests[index].name}',
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
                      ));

                }),
                  centerWidget: Container(
                    width: 70,
                    height: 70,
                    child: ClipRRect(

                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        child: Image(
                          image: NetworkImage( profile.interests[0]
                              .getInteresetPhoto()),
                        )),
                  )
              ),
              SizedBox(
                height: height * .01,
              ),
              ButtonView(height: height, width: width,color: COLOR_BLUE,text: 'Report'.toUpperCase(),),
              SizedBox(
                height: height * .01,
              ),
              ButtonView(height: height, width: width,color: COLOR_BLUE_OPS,text: 'Unpair'.toUpperCase(),),
              SizedBox(
                height: height * .01,
              ),
              ButtonView(height: height, width: width,color: Color(0xFF4D548A),text: 'Block'.toUpperCase(),),

              SizedBox(
                height: height * .03,
              ),
            ],
          ),
        ),
      ),
    );
  }

 Future<String> getAddress(Location location) async {
    final coordinates = new Coordinates(location.coordinates[0], location.coordinates[1]);

    var  addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(first.addressLine);

    return first.addressLine;
  }
}

class ButtonView extends StatelessWidget {
   ButtonView({
    @required this.height,
    @required this.width,
     this.color = COLOR_BLUE,
     this.text = 'Some Text'
  });

  final double height;
  final double width;
  String text;
  Color color;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height*0.08,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        color: color
          ),
      child: TitleView(titleText: text,)
    );
  }
}

class RowView extends StatelessWidget {
   RowView({
     this.text,
     this.fillText
  });
  String text;
   String fillText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          LongTextView(text: text),
          Spacer(),
          TitleView(titleText: fillText)
        ],
      ),
    );
  }
}

class LongTextView extends StatelessWidget {
  const LongTextView({ @required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: MediaQuery.of(context).size.width*0.035,
        color: const Color(0xffffffff),
        height: 1.7142857142857142,
      ),
      textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
      textAlign: TextAlign.start,
      maxLines: 2,
    );
  }
}

class TitleView extends StatelessWidget {
  const TitleView({ @required this.titleText}) ;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: TextStyle(
        fontFamily: 'Helvetica Neue',
        fontSize: MediaQuery.of(context).size.width*0.04,
        color: const Color(0xffffffff),
        fontWeight: FontWeight.w700,
        height: 2,
      ),
      textAlign: TextAlign.start,
    );
  }
}

class SliderWidget extends StatelessWidget {
  final Profile profile;
  SliderWidget(this.profile);

  int currentPos = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          height: height * .6,
          width: width,
          color: COLOR_BLUE.withOpacity(0.2),
          child: getBannerSliderWidget(context),
        ),
        Positioned(
          right: width * 0.1,
          bottom: height * .15,
          child: Column(
            children: [
              CircularIconWidget(
                  child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              )),
              const SizedBox(
                height: 20,
              ),
              CircularIconWidget(
                  child: Icon(Icons.thumb_down, color: Colors.white)),
            ],
          ),
        )
      ],
    );
  }

  Widget getBannerSliderWidget(BuildContext context) {

  return  Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider(

                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height*0.60,
                  scrollPhysics: BouncingScrollPhysics(),
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: true,
                  viewportFraction: 0.96,
                   autoPlay: true,
                  autoPlayInterval: Duration(seconds: 10),
                  autoPlayAnimationDuration:
                  Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,

                  //onPageChanged: callbackFunction,
                  scrollDirection: Axis.horizontal,
                ),
                items: profile.media.map((banner) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: banner.filename == null? (){}:(){

                        },
                        child: getNetworkImage(url:banner.filename==null?profile.profilePicture:banner.filename),
                      );
                    },
                  );
                }).toList(),
              ),
            ]
        )
    );
  }
  Widget getNetworkImage({String url}){
    return    CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(10),
        ),
        child: CupertinoActivityIndicator(
          animating: true,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }



}

class CircularIconWidget extends StatelessWidget {
  const CircularIconWidget({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(shape: BoxShape.circle, color: COLOR_BLUE),
      child: child,
    );
  }
}

class _ProfileScreenViewModel {
  final EnumState state;
  final ProfileModel results;

  _ProfileScreenViewModel({this.state, this.results});
}
