
//register page,
//when register button is pressed get data and send user to web application with these data
//to get their ethereum address from their metamask account
//need to have form with username and password, maybe profile picture

import 'package:carousel_slider/carousel_slider.dart';
import "package:properly_made_nft_market/Decoration//RegisterDecoration.dart" as decoration;
import 'package:flutter/material.dart';

import '../Decoration/AnimatedGradient.dart';
class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: decoration.registerBackground,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
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
                        padding: EdgeInsets.only(top: 100),
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


                      const SizedBox(
                        height: 30,
                      ),

                      //top text
                      Text(
                        "Register",
                        style: decoration.mainRegisterText,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "You will be taken to metamask browser in order to complete your registration",
                        style: decoration.descriptionText,
                        textAlign: TextAlign.center,

                      ),

                      //form
                      Container(
                        margin: const EdgeInsets.only(bottom: 25,left:25,right: 25,top: 50),
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: decoration.registerFormField,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: usernameController,
                          cursorColor: Colors.black87,
                          decoration: decoration.registerUsernameFieldInputDecoration,

                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 25,left:25,right: 25),
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: decoration.registerFormField,
                        child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            obscureText: true,
                            cursorColor: Colors.black87,
                            controller: passwordController,
                            decoration: decoration.registerPasswordFieldInputDecoration
                        ),
                      ),
                      SizedBox(height: 20,),
                      //submit button
                      GestureDetector(
                        onTap: ()=>{
                          //@TODO take values and pass them to website.
                          print(usernameController.text),
                          print(passwordController.text),
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
                                  child:const Center(
                                    child:  Text(
                                      "Submit",
                                      style: decoration.registerSubmitButton,
                                    ),
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
                              "You can also,",
                              style:  TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                            ),
                            GestureDetector(
                              onTap: ()=>{
                                Navigator.popAndPushNamed(context, "/Login"),
                              },
                              child:const Text(
                                "Sign in ",
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
                                //@TODO take values and pass them to website.
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
