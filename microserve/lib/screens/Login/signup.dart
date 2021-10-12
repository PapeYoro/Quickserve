import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';

class Signup extends StatefulWidget {
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String phoneNumber;
  String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }

  onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      visible = true;
      confirmedNumber = internationalizedPhoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 200,
                  /*decoration : BoxDecoration(
                    color: color.red,
                    borderRadius : BorderRadius.circular(50.0   )
                  ),*/
                  child: Image.asset('assets/logo.png'),
                ),
              ),
            ),

            // Name Imput field
            Padding(
              //padding: const EdgeInsets.symmetric(horizontal: 15),
              padding:
                  const EdgeInsets.only(left: 20, right: 15, top: 0, bottom: 0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Full Name',
                    hintText: 'give your full name',
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    )),
              ),
            ),

            SizedBox(height: 10.0, width: 10),

            InternationalPhoneInput(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onPhoneNumberChange: onPhoneNumberChange,
              initialPhoneNumber: phoneNumber,
              initialSelection: phoneIsoCode,
              enabledCountries: ['+233', '+1'],
              showCountryCodes: false,
              showCountryFlags: true,
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 15, top: 20, bottom: 0),
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Signup()));
                  },
                  child: Text(
                    'Save and Proceed',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 15, top: 100, bottom: 0),
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.black),
                )),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 15, top: 30, bottom: 0),
              child: Text(
                  'By Signing up you have agreed to our Terms of use & Privacy Policy',
                  style: TextStyle(color: Colors.black26)),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 15, top: 10, bottom: 0),
              child: Text('Terms of use & Privacy Policy',
                  style: TextStyle(color: Colors.black87)),
            ),
          ],
        ),
      ),
    );
  }
}
