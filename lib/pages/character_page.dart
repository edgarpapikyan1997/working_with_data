import 'dart:math';

import 'package:flutter/material.dart';
import 'package:working_with_data_project/models/image_models/pexels_image_model.dart';

import '../networking/http/dio/dio_image.dart';



class CharactersPage extends StatefulWidget {
  final int userId;

  const CharactersPage({super.key, required this.userId});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  late final PexelsImageModel? pexelsPic;
  late final List<PexelsImageModel> listOfPexelsImages;
  bool initialized = false;
  int? length;
  int randomNum = 0;

  @override
  void initState() {
    super.initState();
    randomNum = getRandomInt(0, 29999);
    initializeData();
  }

  Future<void> initializeData() async {
    // Wait for the Future to complete before assigning to finalModel
    // finalModel = await getTodo();
    // listOfPexelsImages = await getListOfImages();

    pexelsPic = await getRandomImage(randomNum: 2880507);
    print(pexelsPic);
      setState(() {
        initialized = true;
      });
  }

  int getRandomInt(int min, int max) {
    final random = Random();
    int number = min + random.nextInt(max - min + 1);
    setState(() {
      randomNum = number;
    });
    return number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: initialized == false
              ? CircularProgressIndicator()
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                        margin: EdgeInsets.all(15),
                        width: 150,
                        height: 150,
                        child: pexelsPic != null
                            ? Image.network(
                              '${pexelsPic!.imageSource.original}',
                                // Assuming large size URL is available
                                fit: BoxFit.cover,
                              )
                            : const Text('Image not available'),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
