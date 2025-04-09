import 'package:flutter/material.dart';
import '../models/ad_model.dart';

Widget createAdsenseBanner({required AdModel adModel}) {
  // Stub implementation for non-web platforms
  return SizedBox(
    width: adModel.width.toDouble(),
    height: adModel.height.toDouble(),
    child: Center(
      child: Text("test"),
    ),
  );
}
