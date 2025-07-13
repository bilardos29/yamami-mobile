import 'package:app/component/main_button.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class PinPointPage extends StatefulWidget {
  const PinPointPage({super.key});

  @override
  State<PinPointPage> createState() => _PinPointPageState();
}

class _PinPointPageState extends State<PinPointPage> {
  // late GoogleMapController mapController;
  // final LatLng _initialPosition = const LatLng(-6.914744, 107.609810); // Bandung

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Google Map
          // GoogleMap(
          //   initialCameraPosition: CameraPosition(
          //     target: _initialPosition,
          //     zoom: 16,
          //   ),
          //   onMapCreated: (GoogleMapController controller) {
          //     mapController = controller;
          //   },
          //   myLocationEnabled: true,
          //   myLocationButtonEnabled: true,
          //   zoomControlsEnabled: false,
          // ),
          Container(color: Colors.grey),
          /// Search Field
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12,
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => popPage(context),
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cari alamat',
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Pin icon at center
          Center(
            child: Icon(Icons.location_on, size: 36, color: Colors.orange[800]),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xffF1F1F1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Rumah - Jalan Supratman No 31, RT 23 RW 23, Kel.Cibeunying, Kec Cimenyan, Bandung, Jawa Barat',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 16),
                  MainButton(text: 'Simpan', onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
