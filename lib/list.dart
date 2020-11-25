import 'package:flutter/material.dart';

import 'controller/form_controller.dart';
import 'model/form.dart';
class FeedbackListScreen extends StatefulWidget {
  @override
  _FeedbackListScreen createState() => new _FeedbackListScreen();
}
class _FeedbackListScreen extends State<FeedbackListScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FeedbackListPage(title: "data"));
  }
}

class FeedbackListPage extends StatefulWidget {
  FeedbackListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FeedbackListPageState createState() => _FeedbackListPageState();
}

class _FeedbackListPageState extends State<FeedbackListPage> {
  List<FeedbackForm> feebackItems = List<FeedbackForm>();

  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feebackItems = feedbackItems;
      });
    });

    FormController().deleteFeedbackList().then((feedbackItems) {
      setState(() {

      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: feebackItems.length,
            padding: EdgeInsets.only(top: 14.0),
            itemBuilder: (context, position) {
              return Column(
                children: <Widget>[
                  Card(

                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30)),
                            ),
                            child: ListTile(
                              title: Text(
                                '${feebackItems[position].name}',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22.0),
                              ),
                              subtitle: Text(
                                'Mobile: ${feebackItems[position].mobile} \nemail:  ${feebackItems[position].email}\nmodelNum:  ${feebackItems[position].modelNum} ',
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 14.0),
                              ),
                              leading: Column(
                                children: <Widget>[
                                  SizedBox(height: 3,),
                                  CircleAvatar(
                                    // backgroundColor: Colors.redAccent,
                                    backgroundColor: Colors.white,
                                    radius: 25.0,
                                    child: Text(
                                      '${position + 1}',
                                      style: TextStyle(
                                          color: Colors.pink[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  ),
                                ],
                              ),

                            ),
                          ),
                        ),

                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black54,
                          ),
//                              onPressed: () => _deleteStudent(
//                                  context, items[position], position)
                          onPressed: (){
                            return showDialog<void>(
                              context: context,
                              barrierDismissible: false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Deleted Item'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('you are near to deleting item  '),
                                        Text('are you sure!!')
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                        child: Text('Approve'),
                                        onPressed: () {

                                          Navigator.of(context).pop();

                                        }
                                    ),
                                    FlatButton(
                                        child: Text('cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }
                                    ),

                                  ],
                                );
                              },
                            );
                          },
                        ),

                      ],
                    ),
                  ),
                  Divider(
                    height: 6.0,
                  ),
                ],
              );
            }),

      )
    );
  }
}
