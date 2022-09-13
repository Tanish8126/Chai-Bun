import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';

class container extends StatefulWidget {
  const container({
    Key? key,
  }) : super(key: key);

  @override
  State<container> createState() => _containerState();
}

class _containerState extends State<container> {
  CollectionReference _referenceProductList =
      FirebaseFirestore.instance.collection('product_list');
  late Stream<QuerySnapshot> _streamProductItems;

  initState() {
    super.initState();
    _streamProductItems = _referenceProductList.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    _referenceProductList.get();
    _referenceProductList.snapshots();
    return StreamBuilder<QuerySnapshot>(
        stream: _streamProductItems,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.active) {
            QuerySnapshot querySnapshot = snapshot.data;
          }
          //return Center(child: CircularProgressIndicator());
          return Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(22)),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: kMainColor,
                        borderRadius: BorderRadius.circular(22)),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 30, right: 185),
                    width: 100,
                    child: Image.asset(
                      "assets/images/product.png",
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 28,
                    width: 80,
                    margin: EdgeInsets.only(bottom: 38, left: 200),
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      Container(
                        child: Icon(
                          Icons.remove,
                          color: kPrimaryColor,
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 30,
                        color: kPrimaryColor,
                        child: Center(
                            child: FittedBox(
                          child: Text(
                            '1',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                      ),
                      Container(
                        child: Icon(
                          Icons.add,
                          color: kPrimaryColor,
                        ),
                      ),
                    ]),
                  ),
                ),
                Positioned(
                    child: SizedBox(
                  height: 130,
                  width: 220,
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 33, left: 60),
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(color: kPrimaryColor),
                          children: [
                            TextSpan(
                                text: "Regular Chai\n",
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(20),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: "Size- 80ml \nServes- 1",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 9, left: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(22)),
                      child: Text(
                        "\₹ 15",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
                )),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          );
        });
  }
}
