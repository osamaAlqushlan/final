import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/views/scound_page.dart';
import 'package:untitled3/views/student_Data.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();


  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.blue[10],
        primarySwatch: Colors.blue,

      ),
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(

                    height: 300,
                    width: 300,
                    padding: EdgeInsetsDirectional.all(10),
                    child: Image(
                      image:NetworkImage("https://logowik.com/content/uploads/images/flutter5786.jpg")

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller:emailController ,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)
                      ),
                      validator: (value){
                        if (value!.contains("@")){
                          return null ;
                        }
                        else{
                          return "Email should contain '@' ";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value){
                        if (value!.length>7){
                          return null ;
                        }
                        else{
                          return "the password be longer than 7 characters!";
                        }
                      },
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock)
                      ),
                    ),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 30,
                      end: 30,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 350.0,


                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color:  Theme.of(context).colorScheme.secondary,
                    ) ,
                    child: TextButton(
                        onPressed: () async {
                           if (  _formKey.currentState!.validate()){
                            bool authResult = await authintcation(emailController.text, passwordController.text);
                            if(authResult==true){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => StudentData()),
                              );
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login faild")));

                            }
                          }else {
                            emailController.clear();
                          }
                          },
                        child: Text(
                            "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    


                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forget Password ?",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        TextButton(onPressed: (){}, child: Text(
                            "Tap me",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue
                          ),

                        )
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 30,
                      end: 30,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 350.0,
                    decoration:BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30.0),
                    ) ,
                    child: TextButton(
                      onPressed: () {  },
                      child: Text(
                        "No Accounts ? Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),


                  ),



                ],
              ),
            ),
          ),

        ),
      ),
    );
  }


  savedEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

    Future<bool> authintcation(String email, String password) async {
    bool result=false;
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      if(user!=null){
      print (user?.uid);
      savedEmail(user!.email!);
    }
      return result=true;
    }
        catch(e){
      return result;
        }
  }
}


