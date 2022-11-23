import 'package:flutter/material.dart';
import 'package:project/api/api_admin_login.dart';
import 'package:project/model/model_Admin_login.dart';
import 'package:project/Pages/AdminPage_navbar.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({Key? key}) : super(key: key);
  @override
  _AdminLoginPage createState() => _AdminLoginPage();
}

class _AdminLoginPage extends State<AdminLoginPage> {
  bool isApiCallProcess = false;
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  //APIService apiService = APIService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwardController = TextEditingController();
  String email = "";
  String password = "";
  late LoginRequestModel loginRequestModel;
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
        backgroundColor:Color.fromARGB(255, 251, 75, 137),
          title: Text(
                          "Admin Login",
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
                          const  SizedBox(
                          height: 20,
                        ),
                        
                       const SizedBox(
                          height: 20,
                        ),
                        TextFormField(

                          keyboardType: TextInputType.text,
                          controller: emailController,
                          onSaved: (input) => email=loginRequestModel.password= input.toString(),
                           textAlign: TextAlign.center,
                          decoration: InputDecoration(
                          hintText: "Enter Email",
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
                          controller: passwardController,
                          onSaved: (input) => password=loginRequestModel.password= input.toString(),
                           textAlign: TextAlign.center,
                           obscureText: true,
                          decoration: InputDecoration(
                            
                          hintText: "Enter Password",
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
                               Future.delayed(Duration.zero, () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => AdminPage()),
                              );}
      );}
                           // }
                           ,
                          color: Theme.of(context).accentColor,
                          shape: StadiumBorder(),
                          child: const Text(
                            "Login",
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
