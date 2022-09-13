import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newcbapp/utils/constants.dart';
import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class GooglePlacesApiScreen extends StatefulWidget {
  static String routeName = "/googleplaces";
  GooglePlacesApiScreen({Key? key}) : super(key: key);

  @override
  State<GooglePlacesApiScreen> createState() => _GooglePlacesApiScreenState();
}

class _GooglePlacesApiScreenState extends State<GooglePlacesApiScreen> {
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = '12345';
  List<dynamic> _placesList = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      onChange();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }
    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    String kPLACES_API_KEY = "AIzaSyB-fELcWVsf0EzJ_uMSWZZL79skUFRhUNo";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';

    var response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString())['predictions'];
      });
    } else
      throw Exception('Failed to load data');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        title: Text(
          'Set Delivery Location',
          style: TextStyle(color: kPrimaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              style: TextStyle(color: kPrimaryLightColor),
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kTextColor)),
                  hintText: "Search For Area",
                  fillColor: kTextColor,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  prefixIcon: Icon(
                    Icons.map,
                    color: kPrimaryColor,
                  ),
                  hintStyle: TextStyle(color: kPrimaryLightColor)),
            ),
            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _placesList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {},
                    child: ListTile(
                      title: Text(
                        _placesList[index]['description'],
                        style: TextStyle(color: kPrimaryLightColor),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}
