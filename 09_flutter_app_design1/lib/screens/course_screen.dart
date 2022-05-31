import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_design1/components/lists/course_section_list.dart';
import 'package:flutter_app_design1/model/course.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../constants.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({this.course});

  final Course course;

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Widget indicators() {
    List<Widget> indicators = [];

    for (var i = 0; i < 9; i++) {
      indicators.add(
        Container(
          width: 7.0,
          height: 7.0,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == 0 ? Color(0xFF0971FE) : Color(0xFFA6AEBD),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  PanelController panelController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          color: kBackgroundColor,
          child: SlidingUpPanel(
            controller: panelController,
            backdropEnabled: true,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(34.0)),
            color: kCardPopupBackgroundColor,
            boxShadow: [
              BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, -12),
                  blurRadius: 32.0),
            ],
            minHeight: 0.0,
            maxHeight: MediaQuery.of(context).size.height * 0.95,
            panel: CourseSectionScreen(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    overflow: Overflow.clip,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration:
                              BoxDecoration(gradient: widget.course.background),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: SafeArea(
                          bottom: false,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Hero(
                                        tag: widget.course.logo,
                                        child: Image.asset(
                                          'asset/logos/${widget.course.logo}',
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: widget.course.courseSubtitle,
                                            child: Text(
                                              widget.course.courseSubtitle,
                                              style: kSecondaryCalloutLabelStyle
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                          Hero(
                                            tag: widget.course.courseTitle,
                                            child: Text(
                                              widget.course.courseTitle,
                                              style: kLargeTitleStyle.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 36.0,
                                        height: 36.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: kPrimaryLabelColor
                                              .withOpacity(0.8),
                                        ),
                                        child: Icon(Icons.close,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 28.0,
                              ),
                              Expanded(
                                child: Hero(
                                  tag: widget.course.illustration,
                                  child: Image.asset(
                                    'asset/illustrations/${widget.course.illustration}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 28.0),
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 12.5,
                            bottom: 13.5,
                            left: 20.5,
                            right: 14.5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: [
                              BoxShadow(
                                color: kShadowColor,
                                blurRadius: 16.0,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          width: 60.0,
                          height: 60.0,
                          child: Image.asset('asset/icons/icon-play.png'),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 12.0,
                      left: 28.0,
                      right: 28.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Container(
                                  padding: EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    child: Icon(
                                      Platform.isAndroid
                                          ? Icons.people
                                          : CupertinoIcons.group_solid,
                                      color: Colors.white,
                                    ),
                                    radius: 21.0,
                                    backgroundColor: kCourseElementIconColor,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kBackgroundColor,
                                    borderRadius: BorderRadius.circular(29.0),
                                  ),
                                ),
                              ),
                              height: 58.0,
                              width: 58.0,
                              decoration: BoxDecoration(
                                gradient: widget.course.background,
                                borderRadius: BorderRadius.circular(29.0),
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "28.7k",
                                  style: kTitle2Style,
                                ),
                                Text(
                                  "Students",
                                  style: kSearchPlaceholderStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Container(
                                  padding: EdgeInsets.all(4.0),
                                  child: CircleAvatar(
                                    child: Icon(
                                      Platform.isAndroid
                                          ? Icons.format_quote
                                          : CupertinoIcons.news_solid,
                                      color: Colors.white,
                                    ),
                                    radius: 21.0,
                                    backgroundColor: kCourseElementIconColor,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kBackgroundColor,
                                    borderRadius: BorderRadius.circular(29.0),
                                  ),
                                ),
                              ),
                              height: 58.0,
                              width: 58.0,
                              decoration: BoxDecoration(
                                gradient: widget.course.background,
                                borderRadius: BorderRadius.circular(29.0),
                              ),
                            ),
                            SizedBox(
                              width: 12.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "12.4k",
                                  style: kTitle2Style,
                                ),
                                Text(
                                  "Comments",
                                  style: kSearchPlaceholderStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        indicators(),
                        GestureDetector(
                          onTap: () {
                            panelController.open();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: kShadowColor,
                                    offset: Offset(0, 12),
                                    blurRadius: 16.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(14.0)),
                            width: 80.0,
                            height: 40.0,
                            child: Text(
                              "View all",
                              style: kSearchTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Great Course.",
                          style: kBodyLabelStyle,
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Text(
                          "About this course",
                          style: kTitle1Style,
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        Text(
                          "This course was written for people who are passionate about design.",
                          style: kBodyLabelStyle,
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CourseSectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(34.0)),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34.0),
                bottomLeft: Radius.circular(34.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Course Sections',
                  style: kTitle2Style,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  '12 Sections',
                  style: kSubtitleStyle,
                ),
              ],
            ),
          ),
          CourseSectionList(),
          SizedBox(
            height: 32.0,
          )
        ],
      ),
    );
  }
}
