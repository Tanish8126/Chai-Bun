import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/enums.dart';

class DeliveryOptions extends StatefulWidget {
  const DeliveryOptions({Key? key}) : super(key: key);

  @override
  State<DeliveryOptions> createState() => _DeliveryOptionsState();
}

class _DeliveryOptionsState extends State<DeliveryOptions> {
  ProducType? _producType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Row(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kPrimaryColor),
                child: Row(
                  children: [
                    Radio<ProducType>(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: ProducType.dinein,
                        groupValue: _producType,
                        activeColor: kPrimaryLightColor,
                        onChanged: (value) {
                          setState(() {
                            _producType = value;
                          });
                        }),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text("Dine In"),
                    ),
                    Radio<ProducType>(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: ProducType.takeaway,
                        groupValue: _producType,
                        activeColor: kPrimaryLightColor,
                        onChanged: (value) {
                          setState(() {
                            _producType = value;
                          });
                        }),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text("Take Away"),
                    ),
                    Radio<ProducType>(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: ProducType.delivery,
                        groupValue: _producType,
                        activeColor: kPrimaryLightColor,
                        onChanged: (value) {
                          setState(() {
                            _producType = value;
                          });
                        }),
                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text("Delivery"),
                    )
                  ],
                ),
              ),
              // SizedBox(width: 20),
              // Container(
              //   height: 50,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       color: kPrimaryColor),
              //   child: Row(
              //     children: [Text("Outlet "), Text("CB001")],
              //   ),
              //)
            ],
          ),
        ),
      ],
    );
  }
}
