import 'package:flutter/material.dart';
import 'package:project/api/api_diversity.dart';
import 'package:project/model/diversityModel.dart';

class Welcome extends StatefulWidget {
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  APIService apiService = APIService();
  List<DiversityModel> cmpList = [];
  String dtotalplants="";
  String dspeices="";
    List<DiversityModel> planDetails = [];

  @override
  void initState() {
    super.initState();
    apiService.DisplayRequest().then((List<DiversityModel> List) {
      print("Login API service");
      print(List[0].dtotalplants);
      print(List[0].dspeices);
      setState(() {
        isApiCallProcess = false;
        //cmpList = List;
        print(" List");
        print(cmpList);
        dtotalplants = List[0].dtotalplants.toString();
        dspeices = List[0].dspeices.toString();

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 75, 137),
        title: Text(
          'Welcome To Botanical Garden  Module',
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
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            '\nList of Diversity ',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Plants Count : ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 10, 129)
                                            .withOpacity(1.0),
                                        fontSize: 20),
                                  ),
                                  Text(dtotalplants),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Spieces Count : ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 44, 10, 129)
                                            .withOpacity(1.0),
                                        fontSize: 20),
                                  ),
                                  Text(dspeices),
                                ],
                              ),
                      ],
                    ),
                  ),
                  ],),
                  ),
        ), 
          ],
        ),
          ]
      ),
    )
    );
  }
}
