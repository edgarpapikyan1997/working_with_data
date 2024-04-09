import 'package:flutter/material.dart';
import 'package:working_with_data_project/pages/second_page.dart';
import 'package:working_with_data_project/pages/third_page.dart';

import '../models/user_model/user_model.dart';
import '../networking/http/repository.dart';
import '../storage_providers/storage_provider_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Future<UserModel> user;
  final controller = TextEditingController();

  // late AnimationController _controller;
  // late Animation<Alignment> _topAnimationAlignment;
  // late Animation<Alignment> _bottomAnimationAlignment;

  @override
  void initState() {
    super.initState();
    // _controller =
    //     AnimationController(vsync: this, duration: const Duration(seconds: 10));
    // _topAnimationAlignment = getSequenceTop();
    // _bottomAnimationAlignment = getSequenceBottom();
    // _controller.repeat();
    user = fetchUserData();
    StorageDataProvider().readFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            //   gradient: LinearGradient(
            // colors: const [Colors.lightBlueAccent, Colors.deepOrange],
            // end: _topAnimationAlignment.value,
            // begin: _bottomAnimationAlignment.value,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row(
              //   children: [
              //     FutureBuilder<UserModel>(
              //       future: user,
              //       builder: (context, snapshot) {
              //         if (snapshot.hasData) {
              //           return Center(
              //               child: Text(
              //             snapshot.data!.toString(),
              //             style: const TextStyle(
              //                 fontSize: 15, color: Colors.white),
              //           ));
              //         } else if (snapshot.hasError) {
              //           return Center(child: Text('${snapshot.error}'));
              //         }
              //         // By default, show a loading spinner.
              //         return const Center(
              //             child: CircularProgressIndicator());
              //       },
              //     ),
              //   ],
              // ),
              TextField(
                controller: controller,
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: 100,
                  child: const Center(
                    child: Text(
                      'push me',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                onTap: () {
                  final text = controller.text;
                  StorageDataProvider().doSome(text);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  width: 100,
                  child: const Center(
                      child: Text(
                    'delete all',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
                ),
                onTap: () {
                  final text = controller.text;
                  StorageDataProvider().delete(text);
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15)),
                  width: 150,
                  height: 50,
                  child: const Center(
                    child: Text('Move to page',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SecondPage()));
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red.shade500,
                      borderRadius: BorderRadius.circular(15)),
                  width: 200,
                  height: 50,
                  child: const Center(
                    child: Text('Move to Socket Page',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// There is code repeating here.
  /// Just wanted to fast wrap them to functions.
  /// Actually it have to be just one fo]unction with params.

  // Animation<Alignment> getSequenceBottom() {
  //   return TweenSequence<Alignment>([
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween<Alignment>(
  //             begin: Alignment.bottomRight, end: Alignment.bottomLeft),
  //         weight: 1),
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween<Alignment>(
  //             begin: Alignment.bottomLeft, end: Alignment.topLeft),
  //         weight: 1),
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween<Alignment>(
  //             begin: Alignment.topLeft, end: Alignment.topRight),
  //         weight: 1),
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween<Alignment>(
  //             begin: Alignment.topRight, end: Alignment.bottomRight),
  //         weight: 1),
  //   ]).animate(_controller);
  // }

  // Animation<Alignment> getSequenceTop() {
  //   return TweenSequence<Alignment>([
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween<Alignment>(
  //             begin: Alignment.topLeft, end: Alignment.topRight),
  //         weight: 1),
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween<Alignment>(
  //             begin: Alignment.topRight, end: Alignment.bottomRight),
  //         weight: 1),
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween<Alignment>(
  //             begin: Alignment.bottomRight, end: Alignment.bottomLeft),
  //         weight: 1),
  //     TweenSequenceItem<Alignment>(
  //         tween: Tween<Alignment>(
  //             begin: Alignment.bottomLeft, end: Alignment.topLeft),
  //         weight: 1),
  //   ]).animate(_controller);
  // }
}
