import 'package:flutter/material.dart';

class AuthorizationScreen extends StatelessWidget {
  const AuthorizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: "Willkommen,\nSpiel mit uns",
        // theme: ThemeData(
        //   // colorScheme: ColorScheme.fromSeed(
        //   //     seedColor: const Color.fromARGB(255, 170, 2, 61)),
        //   useMaterial3: false,
        // ),
        home: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background2.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body: Container(
          width: 430,
          height: 900,
          //color: const Color.fromARGB(0, 163, 25, 25),
          padding:
              const EdgeInsets.only(top: 130, bottom: 0, left: 0, right: 0),
          //
          child: Stack(
            textDirection: TextDirection.ltr,
            children: <Widget>[
              ///

              Positioned(
                  top: 215,
                  left: 65,
                  child: Transform.scale(
                      scale: 1.0,
                      child: Image.asset("assets/images/playwithme.png"))),
              //_________________________________________

              ///
              const Positioned(
                  top: 400,
                  left: 60,
                  child: SizedBox(
                    width: 300,
                    height: 500,
                    child: Column(
                      children: [
                        Text(
                          "Input login",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 14.0),
                            // counter: Container(),
                            counterText: '',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                            hintText: 'Login',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 6, 65, 99)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Input Password",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 14.0),
                            // counter: Container(),
                            counterText: '',
                            hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 18),
                            hintText: 'Password',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: 76),
                        Text(
                          "      Einlogen",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(174, 66, 66, 66)),
                        ),
                        SizedBox(height: 40),
                        Text(
                          "Registrieren",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  )),

              //_________________________________________
            ],
          ),
        ),
      ),
    ));
  }
}
