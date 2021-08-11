import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeadTwo extends StatefulWidget {
  final String topic, view;
  final bool wwrap, gasdummy;
  const HeadTwo({Key key, this.topic, this.view, this.wwrap, this.gasdummy})
      : super(key: key);
  @override
  HeadTwoState createState() => HeadTwoState();
}

class HeadTwoState extends State<HeadTwo> {
  @override
  Widget build(BuildContext context) {
    return widget.gasdummy == false
        ? Container()
        : StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Company')
                .doc(widget.topic)
                .collection(widget.view)
                .limit(30)
                .snapshots(),
            builder: (context, snapshot2) {
              if (!snapshot2.hasData) {
                return Container();
              } else {
                final int messageCount = snapshot2.data.docs.length;
                return ListView.builder(
                    shrinkWrap: widget.wwrap,
                    itemCount: 25,
                    itemBuilder: (BuildContext context, int index) {
                      final dynamic nw = snapshot2.data.docs[index]['news'];
                      return Text(
                        'Tweet-${index + 1} \n"$nw" \n',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF26E86F),
                            letterSpacing: -1.0,
                            wordSpacing: 3.0),
                      );
                    });
              }
            });
  }
}
