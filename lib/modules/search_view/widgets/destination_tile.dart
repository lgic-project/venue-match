import 'package:flutter/material.dart';
import 'package:my_first_app/constant.dart';
import 'package:my_first_app/data/model/destination.dart';

class DestinationTile extends StatelessWidget {
  Destination destination;

  DestinationTile({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),

      // height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color.fromARGB(255, 129, 119, 119),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              destination.image,
              fit: BoxFit.cover,
              height: 150,
              width: appWidth,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            destination.label,
          ),
          Row(
            children: const [
              Icon(
                Icons.location_on_outlined,
                size: 12,
              ),
              Text(
                "Pokhara",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Text(
            destination.rupess,
          ),
        ],
      ),
    );
  }
}
