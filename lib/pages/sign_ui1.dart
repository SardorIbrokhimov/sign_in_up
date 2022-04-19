import 'package:flutter/material.dart';
import 'package:sing_in_up/pages/sign_ui2.dart';

class SignUi1 extends StatefulWidget {
  static const String id = "sign_1";

  const SignUi1({Key? key}) : super(key: key);

  @override
  State<SignUi1> createState() => _SignUi1State();
}

class _SignUi1State extends State<SignUi1> {
  late String email, password;

  final userPost = GlobalKey<FormState>();

  _doSignIn() {
    if (userPost.currentState!.validate()) {
      userPost.currentState!.save();

    }
  }

  Icon open = Icon(Icons.visibility);
  Icon close = Icon(Icons.visibility_off);
  bool on = true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: userPost,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        height: 150,
                        child: Image(
                          image: AssetImage("assets/images/window.jpg"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10,),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      validator: (input) => !input!.contains("@")
                          ? "Please enter a valid email"
                          : null,
                       onSaved: (input) => email = input!,
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      validator: (input) => input!.length<8
                          ? "Must be at least 8 character"
                          : null,
                      onSaved: (input) => password = input!,
                      obscureText: on,
                      decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              count++;
                              setState(() {
                                if (count.isEven) {
                                  on = true;
                                } else {
                                  on = false;
                                }
                              });

                              print(count);
                            },
                            icon: count.isOdd ? close : open,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: FlatButton(
                        onPressed: _doSignIn,
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      GestureDetector(
                        child: Text("Sing Up",style: TextStyle(color: Colors.blue),),
                        onTap: (){
                          Navigator.pushReplacementNamed(context, SignUi2.id);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
