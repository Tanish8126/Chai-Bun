import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/custom_suffix_icon.dart';
import '../../../../utils/default_button2.dart';
import '../../otp/otp_screen.dart';
import '../../sign_in/sign_in_screen.dart';
import 'login_content.dart';

class NewScreen extends StatefulWidget {
  static String routeName = '/newscreen';
  const NewScreen({Key? key}) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Chai Bun, \nLet’s Discover New World!",
      "image": "assets/images/splash_1.png",
    },
    {
      "text": "Order from our app \nand win exiting Rewards",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Flexible(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              Expanded(
                  child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const Text(
                            "Let's get started! Enter your mobile number",
                            style: TextStyle(
                                color: kMainColor3,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style: const TextStyle(color: kMainColor3),
                            maxLength: 10,
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty || value.length < 10) {
                                return 'Please Enter 10 Digit Mobile Number';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF3f2414))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              fillColor: kMainColor3,
                              labelText: "Mobile",
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              prefix: Padding(
                                padding: EdgeInsets.all(4),
                                child: Text('+91'),
                              ),
                              hintText: "Enter your Mobile",
                              suffixIcon: CustomSurffixIcon(
                                  svgIcon: "assets/icons/Phone.svg"),
                              hintStyle: TextStyle(color: kMainColor3),
                              labelStyle:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, SignInScreen.routeName);
                            },
                            child: const Text(
                              "Trouble Login?",
                              style: TextStyle(
                                  color: kMainColor3,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultButton2(
                              text: "Get Otp",
                              press: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          OtpScreen(_controller.text)));
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
