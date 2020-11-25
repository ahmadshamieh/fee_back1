
import 'package:fee_back/list.dart';
import 'package:flutter/material.dart';
import 'controller/form_controller.dart';
import 'model/form.dart';

class Menu extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController modelNumController = TextEditingController();
  TextEditingController purchaseDateController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void _submitForm() {

    if (_formKey.currentState.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          mobileController.text,
          modelNumController.text,
          purchaseDateController.text,
          emailController.text
      );

      FormController formController = FormController();

      _showSnackbar("Submitting ");

      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {

          _showSnackbar("Feedback Submitted");
        } else {

          _showSnackbar("Error Occurred!");
        }
      });
    }
  }



  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,

      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20,right: 20),
        child: Container(


          child: ListView(

            children: <Widget>[
              Form(

                  key: _formKey,
                  child:
                  Padding(padding: EdgeInsets.all(16),
                    child: Column(

                      children: <Widget>[
                        TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Name'
                          ),
                        ),


                        TextFormField(
                          controller: mobileController,
                          validator: (value) {
                            if (value.trim().length != 10) {
                              return 'Enter 10 Digit Mobile Number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                          ),
                        ),
                        TextFormField(
                          controller:   modelNumController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'modelNum'
                          ),
                        ),
                        TextFormField(
                          controller:   purchaseDateController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Valid Number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'purchaseDate'
                          ),
                        ),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (!value.contains("@")) {
                              return 'Enter Valid Email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email'
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              RaisedButton(
                color: Colors.black12,
                textColor: Colors.white,
                onPressed:_submitForm,
                child: Text('Submit '),
              ),
              RaisedButton(
                color: Colors.black12,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackListScreen(),
                      ));
                },
                child: Text('show data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

