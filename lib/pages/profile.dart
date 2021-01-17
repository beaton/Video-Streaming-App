import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  // TextField controllers
  final autoplayController = TextEditingController();
  final appLanguageController = TextEditingController();
  final groupWatchController = TextEditingController();
  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final dateController = TextEditingController();
  final usernameController = TextEditingController();

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    dateController.text = getTodaysDate();
    usernameController.text = "jd@home.ca";
    fNameController.text = "John Doe";
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  // Return today's date using metric yyyy-MM-dd.
  String getTodaysDate() {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    return dateFormat.format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(body: Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
        builder: (BuildContext context) {
      return Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: getBody(context));
    }));
  }

  Widget getBody(BuildContext context) {
    return new Container(
        color: Colors.grey[850],
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                new Column(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20),
                    child: new Stack(fit: StackFit.loose, children: <Widget>[
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              width: 140.0,
                              height: 140.0,
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  image: new ExactAssetImage(
                                      'assets/images/as.png'),
                                  fit: BoxFit.cover,
                                ),
                              )),
                        ],
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 90.0, right: 100.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 25.0,
                                child: new Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                    ]),
                  )
                ]),
              ])),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: getForm(),
                ),
              )
            ],
          )
        ]));
  }

  // Build and return the Create Product Form Widget.
  Widget getForm() {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                labelText: 'Username', icon: Icon(Icons.account_box)),
            enabled: false,
            controller: usernameController,
          ),
          TextFormField(
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                labelText: 'Name', icon: Icon(Icons.verified_user)),
            enabled: false,
            controller: fNameController,
          ),
          TextFormField(
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                labelText: 'Language', icon: Icon(Icons.language)),
            enabled: false,
            controller: appLanguageController,
          ),
          TextFormField(
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                labelText: 'Group watch', icon: Icon(Icons.group)),
            enabled: false,
            controller: groupWatchController,
          ),
          TextFormField(
            readOnly: true,
            style: TextStyle(color: Colors.grey),
            decoration: InputDecoration(
                labelText: 'Date',
                icon: Icon(Icons.calendar_today),
                enabled: false),
            controller: dateController,
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
          )
        ]));

    //   Widget _getActionButtons() {
    //     return Padding(
    //       padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
    //       child: new Row(
    //         mainAxisSize: MainAxisSize.max,
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: <Widget>[
    //           Expanded(
    //             child: Padding(
    //               padding: EdgeInsets.only(right: 10.0),
    //               child: Container(
    //                   child: new RaisedButton(
    //                 child: new Text("Save"),
    //                 textColor: Colors.white,
    //                 color: Colors.green,
    //                 onPressed: () {
    //                   setState(() {
    //                     _status = true;
    //                     FocusScope.of(context).requestFocus(new FocusNode());
    //                   });
    //                 },
    //                 shape: new RoundedRectangleBorder(
    //                     borderRadius: new BorderRadius.circular(20.0)),
    //               )),
    //             ),
    //             flex: 2,
    //           ),
    //           Expanded(
    //             child: Padding(
    //               padding: EdgeInsets.only(left: 10.0),
    //               child: Container(
    //                   child: new RaisedButton(
    //                 child: new Text("Cancel"),
    //                 textColor: Colors.white,
    //                 color: Colors.red,
    //                 onPressed: () {
    //                   setState(() {
    //                     _status = true;
    //                     FocusScope.of(context).requestFocus(new FocusNode());
    //                   });
    //                 },
    //                 shape: new RoundedRectangleBorder(
    //                     borderRadius: new BorderRadius.circular(20.0)),
    //               )),
    //             ),
    //             flex: 2,
    //           ),
    //         ],
    //       ),
    //     );
    //   }
    // }
  }
}
