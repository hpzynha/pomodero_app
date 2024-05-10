import 'package:flutter/material.dart';

import '../style/colors.dart';

Widget loadingIndicator() {
  return Center(
    child: CircularProgressIndicator(
      color: springGreen,
    ),
  );
}
