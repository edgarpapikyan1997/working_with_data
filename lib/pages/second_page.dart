import 'package:flutter/material.dart';
import 'package:working_with_data_project/pages/character_page.dart';

import '../models/dio_models/user_models.dart';
import '../networking/http/dio/dio_root.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late final UserDioModel finalModel;
  late final List<UserDioModel> listOfModels;
  bool initialized = false;
  late final String? wholeModelToString;
  String? userName;
  String? name;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    // Wait for the Future to complete before assigning to finalModel
    // finalModel = await getTodo();
    listOfModels = await getListOfUsers();

    setState(() {
      initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: initialized == false
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < listOfModels.length; ++i)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharactersPage(
                                        userId: listOfModels[i].id ?? 0,
                                      )));
                        },
                        child: Container(
                          margin: EdgeInsets.all(15),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${listOfModels[i].name}'),
                                Text('${listOfModels[i].username}'),
                                Text('${listOfModels[i].id}'),
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
    );
  }
}
