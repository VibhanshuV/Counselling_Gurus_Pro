import 'package:counselling_gurus/Pages/Mentor/Dashboard.dart';
import 'package:counselling_gurus/Pages/Student/SideNav/AfterPlans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/Plan.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final int lT = 0xFFD5D3E0; //light color
final int dT = 0xFF000000; //dark text
final List<Plan> plans = [
  Plan(
      "Starter",
      [
        "Choice Filling",
        "Mentoring Sessions",
        "Live Chat",
        "Career Guidance",
        "Previous Year Stats",
        "Branch-College Dilemma",
        "Video Support",
        "-"
      ],
      "₹1598/-",
      "₹799",
      "50%"),
  Plan(
      "Standard",
      [
        "Choice Filling",
        "Personal Mentoring",
        "Video+Chat Support",
        "Career Guidance",
        "Previous Year Stats",
        "College Placement Stats",
        "Spot Round",
        "-"
      ],
      "₹2998/-",
      "₹1499",
      "50%"),
  Plan(
      "Enhanced",
      [
        "Choice Filling",
        "IITian Mentors",
        "1-on-1 Video Sessions",
        "Career Guidance",
        "Placement Stats",
        "State+JOSSA Counselling",
        "Spot Round",
        "-"
      ],
      "₹4998/-",
      "₹2499",
      "50%")
];
final List<List<int>> featColor = [
  [dT, dT, dT, dT, dT, dT],
  [dT, dT, dT, lT, lT, lT],
  [dT, dT, dT, dT, dT, dT]
];

final List<String> plansUrl = [
  'https://rzp.io/l/CGstarter',
  'https://rzp.io/l/CGstandard',
  'https://rzp.io/l/CGenhanced',
  'https://rzp.io/l/CGpremium'
];

class Plans extends StatelessWidget {
  // List<String> plans = ["Starter","Standard","Enhanced","Premium"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F4FF),
      body:
          CustomScrollView(scrollDirection: Axis.horizontal, slivers: <Widget>[
        SliverAppBar(
          leading: BackButton(color: Color(0xFFFF4E00),),
              backgroundColor: Color(0xFFF8F4FF),
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset('assets/images/plans.png')
              ),
            ),
           SliverFixedExtentList(
              itemExtent: 320,
              delegate: SliverChildListDelegate([

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 5),
                  child: _plansCardView(context, 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 5),
                  child: _plansCardView(context, 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 5),
                  child: _plansCardView(context, 2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 5),
                  child: _premiumCardView(context),
                ),

              ])
            )

          ]
        ),
      //   Container(
      //   color: Color(0xFFD5D3E0),
      //   margin: EdgeInsets.fromLTRB(10,45,10,20),
      //   child: _plansListView(context, plans),
      // )
    );
  }
}

Widget _plansCardView(BuildContext context, int index) {
      return Container(
          child: GestureDetector(
          onLongPress:() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AfterPlans(index)),
            );
          },
          child:Card(
          color: Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
              // side: BorderSide(color: appThemeColor.shade200, width: 0.5),
              borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:24.0,vertical: 16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text(plans[index].name.toString(),style: GoogleFonts.aBeeZee(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),),
                      Spacer(),
                    ],
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0,vertical:12.0),
                    child: Row(
                      children: [Icon(
                        Icons.check,
                        color: Color(dT),
                        size: 20.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                        SizedBox(width: 5,),
                        Text(plans[index].features[0].toString(),style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.w100, letterSpacing: 0.14, color: Color(dT)),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0,vertical:12.0),
                    child: Row(
                      children: [Icon(
                        Icons.check,
                        color: Color(dT),
                        size: 20.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                        SizedBox(width: 5,),
                        Text(plans[index].features[1].toString(),style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.w100, letterSpacing: 0.14, color: Color(dT)),),
                      ],
                    ),
                  ),
                  // SizedBox(height: 34),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0,vertical:12.0),
                    child: Row(
                      children: [
                        Icon(
                        Icons.check,
                        color: Color(dT),
                        size: 20.0,
                        semanticLabel: 'Text to announce in accessibility modes',
                      ),
                        SizedBox(width: 5,),
                        Text(plans[index].features[2].toString(),style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.w100, letterSpacing: 0.14, color: Color(dT)),),
                      ],
                    ),
                  ),
                  // SizedBox(height: 34),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0,vertical:12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(dT),
                          size: 20.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                        SizedBox(width: 5,),
                        Text(plans[index].features[3].toString(),style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.w100, letterSpacing: 0.14, color: Color(dT)),),
                      ],
                    ),
                  ),
                  // SizedBox(height: 34),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0,vertical:12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(dT),
                          size: 20.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                        SizedBox(width: 5,),
                        Text(plans[index].features[4].toString(),style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.w100, letterSpacing: 0.14, color: Color(dT)),),
                      ],
                    ),
                  ),
                  // SizedBox(height: 34),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0,vertical:12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(dT),
                          size: 20.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                        SizedBox(width: 5,),
                        Text(plans[index].features[5].toString(),style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.w100, letterSpacing: 0.14, color: Color(dT)),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:4.0,vertical:12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check,
                          color: Color(dT),
                          size: 20.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                        SizedBox(width: 5,),
                        Text(plans[index].features[6].toString(),style: GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.w100, letterSpacing: 0.14, color: Color(dT)),),
                      ],
                    ),
                  ),
                   SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(plans[index].price.toString(),style: GoogleFonts.aBeeZee(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.14, color:Color(0xFFD5D3E0), decoration: TextDecoration.lineThrough ),),
                    ],
                  ),
                  // SizedBox(height: 34),
                 Row(
                   children: [SizedBox(width: 142),
                     Container(
                        height: 18,
                        width:50,
                        child: Center(
                          child: new Text (
                              "50% off",
                              style:TextStyle(
                                fontSize: 10,color: Colors.white, letterSpacing: 0.09)
                          ),
                        ),
                        decoration: new BoxDecoration (
                            borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
                            color: Colors.red
                        ),
                      padding: EdgeInsets.symmetric(horizontal:1,vertical:1),
                      ),
                   ],
                 ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40.0,vertical:0.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(plans[index].discounted_price.toString(),style: GoogleFonts.aBeeZee(fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 0.14),),
                          SizedBox(width: 6,),
                          Text("only",style: GoogleFonts.aBeeZee(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.14),)
                        ],
                      ),
                    ),
                  ),
                   SizedBox(height: 34),
                  Container(
                    height: 50,
                    width: 250,
                    child: RaisedButton(
                      child: Text("Choose", style:GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.14, color: Colors.white ,)),
                      color: Color(0xFFFF4E00),
                      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))  ,
                      onPressed: () {
                        _launchURL(plansUrl[index]);
                      },

                    ),
                  )
                ]
              ),
            ),
            elevation: 3,
          ),
          )
      );
}

void _launchURL(url) async {
  if (await canLaunch(url)) {
    var bool = await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget _premiumCardView(BuildContext context) {
  return Container(
      child: GestureDetector(
        onLongPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AfterPlans(5)),
          );
        },
        child:Card(
          color: Color(0xFFF9F9F9),
          shape: RoundedRectangleBorder(
            // side: BorderSide(color: appThemeColor.shade200, width: 0.5),
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:24.0,vertical: 16.0),
            child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text("Want More?\nGo Premium!",style: GoogleFonts.aBeeZee(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),),
                      Spacer(),
                      Image.asset("assets/images/diamond.png",height: 56,width: 56,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Container(
                          height: 100,
                          width: 100,
                          decoration: new BoxDecoration (
                              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                              color: Color(0xFFF8F4FF)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  MdiIcons.update,
                                  color: Color(dT),
                                  size: 40.0,
                                  semanticLabel: "t"
                              ),
                            SizedBox(height: 4,),
                            Text("24x7 Support", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),)
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: new BoxDecoration (
                              borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                              color: Color(0xFFF8F4FF)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                  MdiIcons.familyTree,
                                  color: Color(dT),
                                  size: 40.0,
                                  semanticLabel: "t"
                              ),
                              SizedBox(height: 4,),
                              Text("Support During", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),)
                            ,Text("Branch Sliding", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),)
                            ],
                          ),

                        ),
                      ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Container(
                            height: 100,
                            width: 100,
                            decoration: new BoxDecoration (
                                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                                color: Color(0xFFF8F4FF)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    MdiIcons.bullseyeArrow,
                                    color: Color(dT),
                                    size: 40.0,
                                    semanticLabel: "t"
                                ),
                                SizedBox(height: 4,),
                                Text("Career Guidance", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: new BoxDecoration (
                                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                                color: Color(0xFFF8F4FF)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    MdiIcons.accountGroup,
                                    color: Color(dT),
                                    size: 40.0,
                                    semanticLabel: "t"
                                ),
                                SizedBox(height: 4,),
                                Text("Best Picked", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),),
                                Text("Mentors", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),)
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Container(
                            height: 100,
                            width: 100,
                            decoration: new BoxDecoration (
                                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                                color: Color(0xFFF8F4FF)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    MdiIcons.textBoxCheck,
                                    color: Color(dT),
                                    size: 40.0,
                                    semanticLabel: "t"
                                ),
                                SizedBox(height: 4,),
                                Text("All Plans", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),),
                                Text("Features", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),)
                              ],
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: new BoxDecoration (
                                borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                                color: Color(0xFFF8F4FF)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                    MdiIcons.fileQuestionOutline,
                                    color: Color(dT),
                                    size: 40.0,
                                    semanticLabel: "t"
                                ),
                                SizedBox(height: 4,),
                                Text("Every Required", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),)
                              ,Text("Facility", style: GoogleFonts.aBeeZee(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.17, color: Color(dT)),)
                              ],
                            ),
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 46),
                  Container(
                    height: 50,
                    width: 250,
                    child: RaisedButton(
                      child: Text("Go Premium", style:GoogleFonts.aBeeZee(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.14, color: Colors.white ,)),
                      color: Color(0xFF8645FF),
                      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))  ,
                      onPressed: () {
                        _launchURL("https://rzp.io/l/CGpremium");
                      },

                    ),
                  )
                ]
            ),
          ),
          elevation: 3,
        ),
      )
  ) ;

}

