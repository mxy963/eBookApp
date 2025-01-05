// ignore_for_file: file_names

import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/app_constants.dart';

class MyAccountScreen extends StatefulWidget {
  final String idKey;
  const MyAccountScreen({super.key, required this.idKey});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  final ImagePicker _picker = ImagePicker();
  File? pickedImage;
  String? imageUrl;

  Future<void> fetchImage() async {
    final image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 60);
    if (image == null) {
      return;
    }

    setState(() {
      pickedImage = File(image.path);
      imageUrl = image.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: kProgressIndicator,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextStyle(
              style: GoogleFonts.carterOne(
                fontSize: 45,
                color: Colors.black,
              ),
              child: Transform.translate(
                offset: const Offset(0, -30),
                child: const Column(
                  children: [
                    Text('My'),
                    Text('Profile'),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 75),
                    child: Container(
                      width: 400,
                      height: 300,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kProgressIndicator,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 130, left: 20, right: 20),
                        child: Column(
                          children: [
                            Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: const Icon(FontAwesomeIcons.user),
                                title: Text(
                                  'Sami Mulla Hamid', // Replace with actual user name
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Card(
                              color: Colors.white,
                              child: ListTile(
                                leading: Icon(FontAwesomeIcons.at),
                                title: Text(
                                  'sami.mulla@gmail.com', // Replace with actual email
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: fetchImage,
                    child: imageUrl == null
                        ? CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.red[200],
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey[200],
                                  radius: 90,
                                  child: Icon(
                                    FontAwesomeIcons.user,
                                    size: 70,
                                    color: Colors.red[300],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.cyan[200],
                            child: FutureBuilder(
                              future: Future.delayed(
                                const Duration(seconds: 1),
                              ),
                              builder: (context, snapshot) {
                                return AnimatedOpacity(
                                  duration: const Duration(milliseconds: 200),
                                  opacity: snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? .4
                                      : 1,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(110)),
                                        child: Image.file(
                                          File(imageUrl!),
                                          height: 190,
                                          width: 190,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
