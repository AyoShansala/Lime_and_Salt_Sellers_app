import 'package:flutter/material.dart';
import 'package:lime_and_salt_sellers_app/mainScreens/items_screen.dart';
import 'package:lime_and_salt_sellers_app/model/items.dart';

class ItemsDesignWidget extends StatefulWidget {
  Items? model;
  BuildContext? context;

  ItemsDesignWidget({
    super.key,
    this.model,
    this.context,
  });

  @override
  State<ItemsDesignWidget> createState() => _InfoDesignWidgetState();
}

class _InfoDesignWidgetState extends State<ItemsDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => ItemsScreen(
        //       model:widget.model
        //     ),
        //   ),
        // );
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SizedBox(
          height: 295,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                widget.model!.title!,
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 18,
                  fontFamily: "Train",
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Image.network(
                widget.model!.thumbnailUrl!,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.model!.shortInfo!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
