import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Colors.green[200]],
          begin: const FractionalOffset(0.0, 1.0),
          end: const FractionalOffset(0.0, 1.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.repeated,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 40,
          ),
          child: Column(
            children: [
              Text(
                "BlogApp",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              Text(
                "Great Story For Great Person",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 38,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              boxContainer("assets/1.png", "Sign up with Google"),
              boxContainer("assets/emaillogo.png", "Sign up with Email"),
              boxContainer("assets/facebooklogo.jpg", "Sign up with Google"),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have an Account?",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "SignIn",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget boxContainer(String path, String text) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 140,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Image.asset(
                path,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 40,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              )
            ],
          ),
        ),
      ),
    );
  }
}
