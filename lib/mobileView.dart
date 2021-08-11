import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:webapp/styles/apptext.dart';
import 'package:webapp/styles/spinkit1.dart';
import 'package:webapp/styles/typeo2.dart';
import 'package:webapp/typeHeadlines.dart';

class MobileOne extends StatefulWidget {
  @override
  _MobileOneState createState() => _MobileOneState();
}

class _MobileOneState extends State<MobileOne> {
  var selectedTop = 'Adani';
  bool gasdummy;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection('Company')
        .doc(selectedTop)
        .collection('Tweets')
        .limit(1)
        .get()
        .then((value) {
      setState(() {
        gasdummy = value.docs.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '.Predictor',
          style: TextStyle(
              fontFamily: "Open Sans",
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: -1.0,
              wordSpacing: 3.0),
        ),
        backgroundColor: Color(0xFF73AEF5),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF5165E0),
                  Color(0xFF5165E0)
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Company').snapshots(),
              builder: (context, snapshot1) {
                if (!snapshot1.hasData) return Center(child: Loading());
                final int messageCount = snapshot1.data.docs.length;
                List topL = [];
                dynamic Neg, Pos, Neu, Comp;

                for (int i = 0; i < messageCount; i++) {
                  DocumentSnapshot snap = snapshot1.data.docs[i];
                  topL.add("${snap.id}");
                }
                final int posit = int.parse(
                    snapshot1.data.docs[topL.indexOf(selectedTop)]['Positive']);
                final int negat = int.parse(
                    snapshot1.data.docs[topL.indexOf(selectedTop)]['Negative']);
                final int neut = int.parse(
                    snapshot1.data.docs[topL.indexOf(selectedTop)]['Neutral']);
                return messageCount == 0
                    ? Center(child: Loading())
                    : SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: DropdownButton(
                                    items: topL.map((e) {
                                      return DropdownMenuItem(
                                        child: Text(
                                          e,
                                        ),
                                        value: "${e}",
                                      );
                                    }).toList(),
                                    onChanged: (topval) {
                                      setState(() {
                                        selectedTop = topval;
                                        FirebaseFirestore.instance
                                            .collection('Company')
                                            .doc(topval)
                                            .collection('Tweets')
                                            .limit(1)
                                            .get()
                                            .then((value) {
                                          setState(() {
                                            gasdummy = value.docs.isNotEmpty;
                                          });
                                        });
                                      });
                                    },
                                    value: selectedTop,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${snapshot1.data.docs[topL.indexOf(selectedTop)]['company']}',
                                      style: TextStyle(
                                          fontFamily: "Open Sans",
                                          fontSize: 30,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black38,
                                          letterSpacing: -1.0,
                                          wordSpacing: 3.0),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    if (posit > neut && posit > negat)
                                      Icon(
                                        Icons.arrow_drop_up,
                                        color: Colors.green,
                                        size: 60,
                                      )
                                    else if (neut > posit && neut > negat)
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.yellow,
                                        size: 60,
                                      )
                                    else
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.red,
                                        size: 60,
                                      )
                                  ],
                                ),
                                if (posit > neut && posit > negat)
                                  Column(
                                    children: [
                                      Text(posit.toString(),
                                          style: TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 50,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.green,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0)),
                                      Text(negat.toString(),
                                          style: TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0)),
                                      Text(neut.toString(),
                                          style: mainScanTitle = new TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.yellow,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0))
                                    ],
                                  )
                                else if (neut > posit && neut > negat)
                                  Column(
                                    children: [
                                      Text(posit.toString(),
                                          style: TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.green,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0)),
                                      Text(negat.toString(),
                                          style: TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0)),
                                      Text(neut.toString(),
                                          style: mainScanTitle = new TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 50,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.yellow,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0))
                                    ],
                                  )
                                else
                                  Column(
                                    children: [
                                      Text(posit.toString(),
                                          style: TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.green,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0)),
                                      Text(negat.toString(),
                                          style: TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 50,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.red,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0)),
                                      Text(neut.toString(),
                                          style: mainScanTitle = new TextStyle(
                                              fontFamily: "Open Sans",
                                              fontSize: 25,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.yellow,
                                              letterSpacing: -1.0,
                                              wordSpacing: 3.0))
                                    ],
                                  ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 20, right: 15, left: 15),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  color: Colors.black,
                                  child: HeadlineTypes(
                                    topic: selectedTop,
                                    view: 'News',
                                    wwrap: true,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 20, right: 15, left: 15),
                                  width:
                                      MediaQuery.of(context).size.width / 1.1,
                                  color: Colors.black,
                                  child: HeadTwo(
                                      gasdummy: gasdummy,
                                      topic: selectedTop,
                                      view: 'Tweets',
                                      wwrap: true),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
              }),
        ],
      ),
    );
  }
}
