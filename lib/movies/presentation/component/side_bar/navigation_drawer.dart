
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_color.dart';
import 'package:movies_app/movies/presentation/component/side_bar/drawer_item.dart';
import 'package:movies_app/movies/presentation/screens/favorite_screen.dart';


class Navigation extends StatelessWidget {
  Navigation({super.key});
  @override
  Widget build(BuildContext context) {
                return Drawer(
                  backgroundColor: AppColor.vulcan.withOpacity(0.7),
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            color: Colors.white,
                            height: 60,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          DrawerItem(
                            name: ('Favorite Movies'),
                            icon: Icons.favorite,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const FavoriteScreen()));

                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DrawerItem(
                              name: ('FeedBack'),
                              icon: Icons.feedback,
                              onPressed: () {

                              }),
                          const SizedBox(
                            height: 30,
                          ),
                          const Divider(
                            thickness: 1,
                            height: 10,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DrawerItem(
                              name: ('About'),
                              icon: Icons.info,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder:(context) {
                                      return  AlertDialog(
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'Close',
                                                style: TextStyle(color: Colors.white),
                                              )),
                                        ],
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const Text(
                                              'This app is developed By Mennatullah Atef and the data is provided by TMDB',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Image.asset(
                                              'assets/images/tmdb_logo.png',
                                            //  fit: BoxFit.contain,
                                            ),
                                          ],
                                        ),
                                      );

                                    }
                                );

                              }),
                          const SizedBox(
                            height: 30,
                          ),

                        ],
                      ),
                    ),
                  ),
                );



  }



}
