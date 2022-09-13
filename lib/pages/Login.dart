// Login page of the app.
// authenticate user using JWT from backend.
// Needs 2 form fields, username and password.
// User can also press Browse without logging in button to be able to browse everything without logging in.

import 'package:flutter/material.dart';
import 'package:properly_made_nft_market/Decoration/AnimatedGradient.dart';
import "package:properly_made_nft_market/Decoration/LoginDecoration.dart" as decoration;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:properly_made_nft_market/providers/UserProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bool loginLoading = Provider.of<UserProvider>(context).loading;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(child:
                AnimatedGradient(),
                ),
                Positioned(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
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
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: () async {
                            if (!loginLoading) {
                              bool loginSuccess = await context.read<UserProvider>().login(usernameController.text, passwordController.text);
                              if(loginSuccess){
                                Navigator.popAndPushNamed(context, "/MainPage");
                              }
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Wrong credentials.")
                                    )
                                );
                              }
                            }
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              width:  MediaQuery.of(context).size.width * 11/30 ,
                              height: 56,
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
                                child:  !loginLoading ? Text(
                                  "Submit",
                                  style: decoration.loginSubmitButton,
                                ) : const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        //bottom text
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "You can also ",
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
                                  "sign up ",
                                  style:  TextStyle(
                                      color: Colors.pinkAccent,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                              const Text("or ",
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
                                  "browse without signing in",
                                  style:  TextStyle(
                                      color: Colors.pinkAccent,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50,),
                      ],
                    ),
                  ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
