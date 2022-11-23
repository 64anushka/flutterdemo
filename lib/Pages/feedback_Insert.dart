import 'package:flutter/material.dart';
import 'package:project/api/api_feedbackinsert.dart';
import 'package:project/model/feedbackInsert.dart';

class FeedbackInsertPage extends StatefulWidget {
  const FeedbackInsertPage({Key? key}) : super(key: key);
  @override
  _FeedbackInsertPageState createState() => _FeedbackInsertPageState();
}

class _FeedbackInsertPageState extends State<FeedbackInsertPage> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  APIService apiService = APIService();
  TextEditingController cdateController = TextEditingController();
  TextEditingController clocationController = TextEditingController();
  var res; 
  late FeedbackRequestModel insertRequestModel;
  @override
  void initState() {
    super.initState();
  }

  bool validateAndSave() {
    return false;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 75, 137),
        title: Text(
          "Insert Feedback Details",
        ),
      ),
      key: ScaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cdateController,
                          onSaved: (input) =>
                              insertRequestModel.fname = input.toString(),
                          decoration: InputDecoration(
                            hintText: "Enter Name",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: clocationController,
                          onSaved: (input) =>
                              insertRequestModel.feedback = input.toString(),
                          decoration: InputDecoration(
                            hintText: "Enter Feedback",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 30),
                        FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            setState(() {
                              isApiCallProcess = true;
                            });
                            apiService
                                .insertFeedbackPostRequest(
                                    cdateController.text,
                                    clocationController.text,)
                                .then((value) {
                                  res = value.statusCode;
                              print("Login API service");
                              print(value);
                              setState(() {
                                isApiCallProcess = false;
                              });
                            });
                          },
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 15),
                        
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
