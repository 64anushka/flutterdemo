
import 'package:flutter/material.dart';
import 'package:project/Pages/Admin_login.dart';
import 'package:project/Pages/SearchbyName.dart';
import 'package:project/Pages/BotanicalGarden.dart';
import 'package:project/Pages/SearchbyID.dart';
import 'package:project/Nav_drawer/my_drawer_header.dart';
import 'package:project/Pages/History.dart';
import 'package:project/Pages/campaigndetailsuser.dart';
import 'package:project/Pages/feedback_Insert.dart';
void main() {
  runApp(const MyApp());
}
enum DrawerSections {
  home,
  welcome,
  history,
  campaigndetailsuser,
  SearchbyIDPage,
  SearchbyName,
  feedback_Insert
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FC App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.redAccent,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.redAccent),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.redAccent,
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.blueAccent,
          ),
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentPage;

  @override
  Widget build(BuildContext context) {
    if (currentPage == DrawerSections.home) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      });
    } else if (currentPage == DrawerSections.welcome) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Welcome()),
        );
      });
    } else if (currentPage == DrawerSections.history) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => History()),
        );
      });
    } else if (currentPage == DrawerSections.campaigndetailsuser) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CampaignDetailsPage()),
        );
      });
      }else if (currentPage == DrawerSections.SearchbyIDPage) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SearchbyIdPage()),
        );
      });
    } else if (currentPage == DrawerSections.SearchbyName) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SearchbyNamePage()),
        );
      });
    } else if (currentPage == DrawerSections.feedback_Insert) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => FeedbackInsertPage()),
        );
      });
    } 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 251, 75, 137),
        title: Text("Fergusson College Smart Application"),
      ),
      body: Container(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fc.jpg'),
            fit: BoxFit.cover,
          ),
        ),
                 width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  
                      child: Column(
                        children: <Widget>[
                       const SizedBox(
                          height: 20,
                        ),
                       const SizedBox(height: 30),
                        FlatButton(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 80),
                                        onPressed: () {
                                          Future.delayed(Duration.zero, () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context) => AdminLoginPage()),
                                            );
                                          });
                            },
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                          child: const Text(
                            "Admin Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Container(
          child: Column(
            children: [
              MyHeaderDrawer(),
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
          menuItem("Home", 1, Icons.home, currentPage = DrawerSections.home),
          Divider(),
          menuItem("Botanical garden Module", 2, Icons.favorite_border,
              currentPage = DrawerSections.welcome),
          menuItem("History", 3, Icons.history,
              currentPage = DrawerSections.history),    
          Divider(),
          menuItem("Campaign Details Users", 4, Icons.history,
              currentPage = DrawerSections.campaigndetailsuser),
          menuItem("Search By ID", 5, Icons.search,
              currentPage = DrawerSections.SearchbyIDPage),
          menuItem("Search By Name",6, Icons.search,
              currentPage = DrawerSections.SearchbyName),
          menuItem("Feedback",7, Icons.feedback,
              currentPage = DrawerSections.feedback_Insert),    
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
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.welcome;
            } else if (id == 3) {
              currentPage = DrawerSections.history;
            } else if (id == 4) {
              currentPage = DrawerSections.campaigndetailsuser;
            }else if (id == 5) {
              currentPage = DrawerSections.SearchbyIDPage;
            } else if (id == 6) {
              currentPage = DrawerSections.SearchbyName;
            } else if (id == 7) {
              currentPage = DrawerSections.feedback_Insert;
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


