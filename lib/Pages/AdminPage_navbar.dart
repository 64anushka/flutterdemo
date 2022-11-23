import 'package:flutter/material.dart';
import 'package:project/Pages/Insert_page.dart';
import 'package:project/Pages/campaigndetailsadmin.dart';
import 'package:project/Pages/campaign_insert.dart';
import 'package:project/Pages/feedbackdetailsadmin.dart';
import'package:project/main.dart';
void main() {
  runApp(const MyApp1());
}
enum DrawerSections {
 
  campaigndetailsadmin,
  campaign_insert,
  InsertPage,
  FeedbackDetailsPage,
  MyApp
}
class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  var currentPage;

  @override
  Widget build(BuildContext context) {
     if (currentPage == DrawerSections.campaign_insert) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CampaignInsertPage()),
        );
      });
    }
    else if (currentPage == DrawerSections.InsertPage) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => InsertPage()),
        );
      });
    }else if (currentPage == DrawerSections.campaigndetailsadmin) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CampaignDetailsAdminPage()),
        );
      });
      }else if (currentPage == DrawerSections.MyApp) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyApp()),
        );
      });
      }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 75, 137),
        title: Text("Admin Page"),
      ),
      body:Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/FC1.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              MyDrawerList(),
            ],
          ),
        )),
      ),
    );
  
  }
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        children: [
          menuItem("Insert Campaign Details", 7, Icons.insert_invitation,
              currentPage = DrawerSections.campaign_insert),   
          menuItem("Insert Plant Data", 8, Icons.insert_chart,
              currentPage = DrawerSections.InsertPage),
          Divider(),    
          menuItem("Display Campaign Record", 9, Icons.smart_display,
              currentPage = DrawerSections.InsertPage),
          menuItem("Display Feedback Record", 10, Icons.feedback,
              currentPage = DrawerSections.FeedbackDetailsPage), 
          menuItem("Logout", 11, Icons.logout,
              currentPage = DrawerSections.MyApp),           
        ],
      ),
    );
  }

  Widget menuItem(String title, int id, IconData icon, bool) {
    return Material(
      color: Colors.grey[300], // : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
             if (id == 7) {
              currentPage = DrawerSections.campaign_insert;
            }else if (id == 8) {
              currentPage = DrawerSections.InsertPage;
            }else if (id == 9) {
              currentPage = DrawerSections.campaigndetailsadmin;
            }else if (id == 10) {
              currentPage = DrawerSections.FeedbackDetailsPage;
            }else if (id == 11) {
              currentPage = DrawerSections.MyApp;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
              SizedBox(width: 30),
              Flexible(
                  child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}



