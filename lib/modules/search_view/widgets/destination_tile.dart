import 'package:flutter/material.dart';
import 'package:my_first_app/data/model/destination.dart';

class DestinationTile extends StatelessWidget {
  Destination destination;

  DestinationTile({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),

      // height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(
          color: Color.fromARGB(255, 129, 119, 119),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              destination.image,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Text(
            destination.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 18,
              ),
              const Text(
                "Pokhara",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            destination.rupess,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
