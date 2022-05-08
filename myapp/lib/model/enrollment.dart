import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Enrollment extends StatefulWidget {
  const Enrollment({Key? key}) : super(key: key);

  @override
  State<Enrollment> createState() => _EnrollmentState();
}

List dropItems = ["2022 Semester 1", "2022 Semester 2"];

class _EnrollmentState extends State<Enrollment> with TickerProviderStateMixin {
  late PageController pagecontroller;
  late AnimationController controller;
  late int duration;
  late Color color;
  double height = 0;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    pagecontroller = PageController(initialPage: 0);
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: pagecontroller,
                children: dropItems.map((e) => PageContainer(e)).toList(),
              ),
            ),
            Positioned(
              right: 80,
              top: 50,
              child: Container(
                height: 360,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          height == 0 ? height == 300 : height = 0;
                          isPlaying = !isPlaying;
                          isPlaying
                              ? controller.forward()
                              : controller.reverse();
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 215,
                        color: Colors.red.shade800,
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: Duration(milliseconds: 250),
                              width: height == 300 ? 95 : 0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1.0),
                              child: Text(
                                "2022 Semester 1",
                                // height == 300
                                //     ? "2022 Semester 2"
                                //     : "2022 Semester 1",
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: AnimatedIcon(
                                  progress: controller,
                                  color: Colors.white,
                                  icon: AnimatedIcons.menu_close),
                            ),
                            SizedBox(
                              width: 10.0,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        top: 50.0,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          height: height,
                          width: 200,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                                children: dropItems.map((e) {
                              return CustomnavigationButton(e, () {
                                setState(() {
                                  pagecontroller.animateToPage(
                                      dropItems.indexOf(e),
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                });
                              });
                            }).toList()),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PageContainer extends StatefulWidget {
  // const PageContainer({Key? key}) : super(key: key);
  final String text;
  PageContainer(this.text);

  @override
  _PageContainerState createState() => _PageContainerState();
}

class _PageContainerState extends State<PageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          widget.text.toUpperCase(),
          style: GoogleFonts.roboto(
              fontSize: 50, fontWeight: FontWeight.w900, color: Colors.black26),
        ),
      ),
    );
  }
}

class CustomnavigationButton extends StatefulWidget {
  final String text;
  final Function fun;
  CustomnavigationButton(
    this.text,
    this.fun,
  );
//  const CustomnavigationButton({Key? key}) : super(key: key);

  @override
  _CustomnavigationButtonState createState() => _CustomnavigationButtonState();
}

class _CustomnavigationButtonState extends State<CustomnavigationButton> {
  // late int duration;
  int duration = 100;
  //late Color color;
  Color color = Colors.black;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.fun();
      },
      child: MouseRegion(
        onEnter: (val) {
          setState(() {
            //  duration:
            100;
            //  Color:
            Colors.blue;
          });
        },
        onExit: (val) {
          setState(() {
            duration;
            color;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: duration),
          color: color,
          height: 50,
          width: 200,
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text(
                    widget.text,
                    style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
