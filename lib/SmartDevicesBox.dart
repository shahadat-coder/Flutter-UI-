import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDevicesBox extends StatefulWidget {
  late String smartDevicesName;
  late String iconPath;
  late bool powerOn;
  void Function(bool)? onChanged;

  SmartDevicesBox({
    Key? key,
    required this.smartDevicesName,
    required this.iconPath,
    required this.powerOn,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SmartDevicesBox> createState() => _SmartDevicesBoxState();
}

class _SmartDevicesBoxState extends State<SmartDevicesBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: widget.powerOn ? Colors.grey[900] : Color.fromARGB(44, 144, 167, 189),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                widget.iconPath,
                height: 65,
                color: widget.powerOn ? Colors.white : Colors.grey.shade700,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Expanded(
                      child: Text(widget.smartDevicesName,
                      style:TextStyle(
                        fontWeight:FontWeight.bold,
                        fontSize: 15,
                        color: widget.powerOn ? Colors.white : Colors.black,
                      ) , ),
                    ),
                  ),
                  Transform.rotate(angle: pi/2,
                    child: CupertinoSwitch(
                      value: widget.powerOn,
                      onChanged: widget.onChanged,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
