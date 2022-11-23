import 'package:flutter/material.dart';
import 'package:project/api/api_campaigndetailsuser.dart';
import 'package:project/model/campaignModel.dart';

// ignore: use_key_in_widget_constructors
class CampaignDetailsPage extends StatefulWidget {
  _CampaignDetailsPageState createState() => _CampaignDetailsPageState();
}

class _CampaignDetailsPageState extends State<CampaignDetailsPage> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  APIService apiService = APIService();
  TextEditingController displayController = TextEditingController();

  String cdate = "";
  String clocation = "";
  List<CampaignModel> cmpList = [];

  @override
  void initState() {
    super.initState();
    apiService.DisplayRequest().then((List<CampaignModel> CampaignList) {
      print("Login API service");
      print(CampaignList[0].cdate);
      print(CampaignList[0].clocation);
      setState(() {
        isApiCallProcess = false;
        cmpList = CampaignList;
        print("Camp List");
        print(cmpList);
      });
    });
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
          "Campaign Details",
        ),
      ),
      key: ScaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          // Text("Body"),
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
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Upcoming Campaign Date"),
                          Text("Venue"),
                          Text("\n\n")
                        ],
                      ),
                      SizedBox(
                        height: 250,
                        child: ListView.builder(
                            itemCount: cmpList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(cmpList[index].cdate.toString()),
                                  Text(cmpList[index].clocation.toString()),
                                  Text("\n\n"),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
