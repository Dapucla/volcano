// custom_box_decoration.dart
import 'package:volcano/data/styles.dart';
import 'package:flutter/material.dart';

// Define your custom BoxDecoration
const BoxDecoration kBoxDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(
      color: kBorderColor,
      width: 2.0,
    ),
    right: BorderSide(
      color: kBorderColor,
      width: 2.0,
    ),
    left: BorderSide(
      color: kBorderColor,
      width: 2.0,
    ),
  ),
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(20.0),
    topRight: Radius.circular(20.0),
  ),
);
