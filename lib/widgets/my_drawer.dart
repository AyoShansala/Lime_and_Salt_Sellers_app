import 'package:flutter/material.dart';
import 'package:lime_and_salt_sellers_app/authentication/auth_screen.dart';
import 'package:lime_and_salt_sellers_app/global/global.dart';
import 'package:lime_and_salt_sellers_app/mainScreens/home_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 10),
            child: Column(
              children: [
                //header drawer
                Material(
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: SizedBox(
                      height: 140,
                      width: 140,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            sharedPreferences!.getString("photoUrl")!),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  sharedPreferences!.getString("name")!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Train",
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                //body of drawer
                Container(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Column(
                    children: [
                      const Divider(
                        height: 6,
                        color: Colors.grey,
                        thickness: 2,
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Home",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => const HomeScreen(),
                            ),
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.monetization_on,
                          color: Colors.black,
                        ),
                        title: const Text(
                          "My Earings",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.reorder,
                          color: Colors.black,
                        ),
                        title: const Text(
                          "New orders",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.local_shipping,
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Hostory - Orders",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {},
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.exit_to_app,
                          color: Colors.black,
                        ),
                        title: const Text(
                          "Sign out",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
                          firebaseAuth.signOut().then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => const AuthScreen(),
                              ),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
