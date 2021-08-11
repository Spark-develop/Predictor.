import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HeadlineTypes extends StatefulWidget {
  final String topic, view;
  final bool wwrap;

  const HeadlineTypes({Key key, this.topic, this.view, this.wwrap})
      : super(key: key);
  @override
  HeadlineTypesState createState() => HeadlineTypesState();
}

class HeadlineTypesState extends State<HeadlineTypes> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Company')
            .doc(widget.topic)
            .collection(widget.view)
            .snapshots(),
        builder: (context, snapshot2) {
          if (!snapshot2.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            final int messageCount = snapshot2.data.docs.length;
            return messageCount == 0
                ? CircularProgressIndicator()
                : ListView.builder(
                    shrinkWrap: widget.wwrap,
                    itemCount: messageCount,
                    itemBuilder: (BuildContext context, int index) {
                      if (!snapshot2.hasData) {
                        CircularProgressIndicator();
                      }
                      if (index != messageCount - 1 &&
                          snapshot2.data.docs[index]['news'] ==
                              snapshot2.data.docs[index + 1]['news']) {
                        return Container();
                      } else {
                        final dynamic nw = snapshot2.data.docs[index]['news'];
                        return Text(
                          'Headline-${index + 1}\n"$nw" \n',
                          style: TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF26E86F),
                              letterSpacing: -1.0,
                              wordSpacing: 3.0),
                        );
                      }
                    });
          }
        });
  }
}
