import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:lime_and_salt_sellers_app/global/global.dart';
import 'package:lime_and_salt_sellers_app/model/items.dart';
import 'package:lime_and_salt_sellers_app/model/menus.dart';
import 'package:lime_and_salt_sellers_app/uploadScreens/items_upload_screen.dart';
import 'package:lime_and_salt_sellers_app/widgets/items_design.dart';
import 'package:lime_and_salt_sellers_app/widgets/my_drawer.dart';
import 'package:lime_and_salt_sellers_app/widgets/progress_bar.dart';
import 'package:lime_and_salt_sellers_app/widgets/text_widget.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key, required this.model});
  final Menus? model;
  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Text(sharedPreferences!.getString("name")!),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemUploadScreen(
                    model: widget.model,
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.library_add,
            ),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: TextWidgetHeader(
                title: "My ${widget.model!.menuTitle} 's Items"),
            pinned: true,
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("sellers")
                .doc(sharedPreferences!.getString("uid"))
                .collection("menus")
                .doc(widget.model!.menuID)
                .collection("items")
                .orderBy("publishedDate", descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: circularProgress(),
                      ),
                    )
                  : SliverStaggeredGrid.countBuilder(
                      crossAxisCount: 1,
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1),
                      itemBuilder: (context, index) {
                        Items model = Items.fromJson(
                          snapshot.data!.docs[index].data()
                              as Map<String, dynamic>,
                        );
                        return ItemsDesignWidget(
                          model: model,
                          context: context,
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                    );
            },
          )
        ],
      ),
    );
  }
}
