import 'package:flutter/material.dart';
import 'package:project/api/api_campaigninsert.dart';
import 'package:project/model/campaignModelInsert.dart';

class CampaignInsertPage extends StatefulWidget {
  const CampaignInsertPage({Key? key}) : super(key: key);
  @override
  _CampaignInsertPageState createState() => _CampaignInsertPageState();
}

class _CampaignInsertPageState extends State<CampaignInsertPage> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  APIService apiService = APIService();
  TextEditingController cdateController = TextEditingController();
  TextEditingController clocationController = TextEditingController();
  TextEditingController ctypeController = TextEditingController();
  String cdate="";
  String clocation="";
  String ctype="";
  var res; 
  late CampaignRequestModel insertRequestModel;
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
          "Insert Campaign Details",
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
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: cdateController,
                          onSaved: (input) =>
                              insertRequestModel.cdate = input.toString(),
                          decoration: InputDecoration(
                            hintText: "Enter Date(yyyy-mm-dd)",
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
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: clocationController,
                          onSaved: (input) =>
                              insertRequestModel.clocation = input.toString(),
                          decoration: InputDecoration(
                            hintText: "Enter Venue",
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
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: ctypeController,
                          onSaved: (input) =>
                              insertRequestModel.clocation = input.toString(),
                          decoration: InputDecoration(
                            hintText: "Enter Campaign Type",
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
                                .insertCampaignPostRequest(
                                    cdateController.text,
                                    clocationController.text,
                                    ctypeController.text)
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
