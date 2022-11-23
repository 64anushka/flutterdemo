import 'package:flutter/material.dart';
import 'package:project/api/api_searchbyname.dart';
import 'package:project/model/plantModel.dart';

// ignore: use_key_in_widget_constructors
class SearchbyNamePage extends StatefulWidget {
  _SearchbyNamePageState createState() => _SearchbyNamePageState();
}

class _SearchbyNamePageState extends State<SearchbyNamePage> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  APIService apiService = APIService();
  TextEditingController searchController = TextEditingController();
  TextEditingController uiController = TextEditingController();

  String uid = "";
  String localName = "";
  String scName = "";

  @override
  void initState() {
    super.initState();
  }

  bool validateAndSave() {
    return false;
  }
List<PlantModel> planDetails = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 75, 137),
        title: Text(
          "Search  By  Name",
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
                          controller: searchController,
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

                        const SizedBox(height: 30),
                        FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                          onPressed: () {
                            setState(() {
                              isApiCallProcess = true;
                            });
                            apiService
                                .searchbyNamePostRequest(searchController.text)
                                .then((List<PlantModel> PlantList) {
                              print("Login API service");
                              if(PlantList.length !=0){
                              setState(() {

                                print("Plant List");
                                planDetails = PlantList;
                                print(planDetails.length);
                                isApiCallProcess = false;
                                uid = PlantList[0].uid.toString();
                                localName = PlantList[0].local_name.toString();
                                scName =
                                    PlantList[0].scientific_name.toString();
                              });
                              }
                              else{
                                 planDetails = [];
                              }
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
                       planDetails.isEmpty ? Center(child: Text("No Records Found")) : Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 10, 129)
                                            .withOpacity(1.0),
                                        fontSize: 20),
                                  ),
                                  Text(uid),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Local Name",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 10, 129)
                                            .withOpacity(1.0),
                                        fontSize: 20),
                                  ),
                                  Text(localName),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Scientific Name",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 10, 129)
                                            .withOpacity(1.0),
                                        fontSize: 20),
                                  ),
                                  Text(scName),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // TextFormField(
                        //       readOnly: true,
                        //       keyboardType: TextInputType.text,
                        //       controller: uiController,
                        //        decoration: InputDecoration(

                        //         hintText: "UID",
                        //         enabledBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: Theme.of(context)
                        //                 .primaryColor
                        //                 .withOpacity(0.2),
                        //           ),
                        //         ),
                        //         focusedBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: Theme.of(context).colorScheme.secondary,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 20,),
                        //    TextFormField(
                        //     readOnly: true,
                        //       controller: localNameController,
                        //       decoration: InputDecoration(
                        //         hintText: "Local Name",
                        //         enabledBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: Theme.of(context)
                        //                 .primaryColor
                        //                 .withOpacity(0.2),
                        //           ),
                        //         ),
                        //         focusedBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: Theme.of(context).accentColor,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     TextFormField(
                        //       readOnly: true,
                        //       controller: scNameController,
                        //       decoration:  InputDecoration(
                        //         hintText: "Scientific Name",
                        //         enabledBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: Theme.of(context)
                        //                 .primaryColor
                        //                 .withOpacity(0.2),
                        //           ),
                        //         ),
                        //         focusedBorder: UnderlineInputBorder(
                        //           borderSide: BorderSide(
                        //             color: Theme.of(context).colorScheme.secondary,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
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
