// Login page of the app.
// authenticate user using JWT from backend.
// Needs 2 form fields, username and password.
// User can also press Browse without logging in button to be able to browse everything without logging in.


import 'package:flutter/material.dart';
import "package:properly_made_nft_market/Decoration/LoginDecoration.dart" as decoration;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:properly_made_nft_market/models/User.dart';
import 'package:properly_made_nft_market/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final User? user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(child:
            AnimatedGradient(),
            ),
            Positioned(child:
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding:EdgeInsets.only(top: 100),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                        ),
                        items: decoration.imageList.map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(e,
                                width: 1050,
                                height: 350,
                                fit: BoxFit.cover,)
                            ],
                          ) ,
                        )).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "Login",
                        style: decoration.mainTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Welcome to SU NFT, to purchase items, you must log in.",
                        style: decoration.descriptionTextStyle,
                      ),
                    ),

                    //form
                    Container(
                      margin: const EdgeInsets.only(bottom: 25,left:25,right: 25,top: 50),
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: decoration.loginFormField,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        controller: usernameController,
                        cursorColor: Colors.black87,
                        decoration: decoration.loginUsernameFieldInputDecoration,

                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 25,left:25,right: 25),
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: decoration.loginFormField,
                      child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          cursorColor: Colors.black87,
                          controller: passwordController,
                          decoration: decoration.loginPasswordFieldInputDecoration
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await context.read<UserProvider>().login(usernameController.text, passwordController.text);
                        if(user != null){
                          Navigator.popAndPushNamed(context, "/MainPage");
                        }
                        else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                            content: Text("Wrong credentials.")
                          )
                        );
                        }

                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          width:  MediaQuery.of(context).size.width * 1/2 ,
                          height: 50,

                          alignment: Alignment.bottomRight,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF596EED),
                                  Color(0xFFED5CAB),
                                  //Color(0xFF42A5F5),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight
                            ),
                          ),
                          child: Center(
                            child:  Text(
                              "Submit",
                              style: decoration.loginSubmitButton,
                            ),
                          ),
                        ),





                      ),
                    ),

                    //bottom text
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "You can also,",
                            style:  TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                          GestureDetector(
                            onTap: ()=>{
                              Navigator.popAndPushNamed(context, "/Register"),
                            },
                            child:const Text(
                              "Sign Up ",
                              style:  TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 15
                              ),
                            ),
                          ),
                          const Text("Or ",
                            style:TextStyle(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          ),
                          GestureDetector(
                            onTap: ()=>{
                              Navigator.popAndPushNamed(context, "/MainPage"),
                            },
                            child:const Text(
                              "Browse without signing in",
                              style:  TextStyle(
                                  color: Colors.pinkAccent,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          ],

        ),
      ),



    );
  }
}



class AnimatedGradient extends StatefulWidget {
  @override
  _AnimatedGradientState createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient> {
  List<Color> colorList = [
    Colors.cyan.shade900,
    Colors.deepPurple.shade900,
    Colors.pink.shade900,
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Colors.pink.shade900;
  Color topColor = Colors.cyan.shade900;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        bottomColor = Colors.deepPurple.shade900;
      });
    });
    return Scaffold(
        body: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 5),
              onEnd: () {
                setState(() {
                  index = index + 1;
                  // animate the color
                  bottomColor = colorList[index % colorList.length];
                  topColor = colorList[(index + 1) % colorList.length];

                  //// animate the alignment
                  // begin = alignmentList[index % alignmentList.length];
                  // end = alignmentList[(index + 2) % alignmentList.length];
                });
              },
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: begin, end: end, colors: [bottomColor, topColor])),
            ),
          ],
        ));
  }
}
