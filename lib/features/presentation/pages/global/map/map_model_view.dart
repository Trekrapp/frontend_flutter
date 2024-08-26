import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart' as img;

class MapModelView {
  GoogleMapController? mapController;
  bool isOpen = false;
  final LatLng center = const LatLng(51.5, -0.09);
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final List<Map<String, dynamic>> users = [
    {
      "name": "Benjamin",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
      "lat": 51.5,
      "lng": -0.09,
    },
    {
      "name": "Farita",
      "image": "https://randomuser.me/api/portraits/women/1.jpg",
      "lat": 51.515,
      "lng": -0.1,
    },
    {
      "name": "Marie",
      "image": "https://randomuser.me/api/portraits/women/2.jpg",
      "lat": 51.52,
      "lng": -0.08,
    },
    {
      "name": "Me",
      "image": "https://randomuser.me/api/portraits/women/3.jpg",
      "lat": 51.525,
      "lng": -0.07,
    },
  ];

  final Set<Marker> markers = {};

  Future<Uint8List> getBytesFromAsset(String url, int width) async {
    try {
      final File file = await DefaultCacheManager().getSingleFile(url);
      final Uint8List bytes = await file.readAsBytes();
      final img.Image? image = img.decodeImage(bytes);

      final img.Image resized = img.copyResize(image!, width: width);
      final img.Image circularImage = _createCircularImage(resized);

      final ui.Codec codec = await ui.instantiateImageCodec(
          Uint8List.fromList(img.encodePng(circularImage)));
      final ui.FrameInfo fi = await codec.getNextFrame();

      final ByteData? byteData =
          await fi.image.toByteData(format: ui.ImageByteFormat.png);
      return byteData!.buffer.asUint8List();
    } catch (e) {
      print("Error loading image: $e");
      return Uint8List(0);
    }
  }

  img.Image _createCircularImage(img.Image src) {
    final int diameter = src.width;
    final img.Image mask = img.Image(diameter, diameter);
    final int radius = diameter ~/ 3;

    for (int y = 0; y < diameter; y++) {
      for (int x = 0; x < diameter; x++) {
        final int dx = radius - x;
        final int dy = radius - y;
        final int distance = (dx * dx + dy * dy);

        if (distance <= radius * radius) {
          mask.setPixel(x, y, src.getPixel(x, y));
        }
      }
    }

    return mask;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final List<Map<String, String>> categories = [
    {
      'name': 'All',
    },
    {'name': 'À côté'},
    {'name': 'Suggestions'},
    {'name': 'Mêmes Nationalités'},
  ];

  String selectedCategory = 'All';
}
