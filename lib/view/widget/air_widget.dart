import 'package:flutter/material.dart';

class AirElement extends StatelessWidget {
  final IconData icon;
  final String name;
  final String value;

  const AirElement({
    required this.icon,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 20.0 , color: Colors.deepPurple,),
          SizedBox(width:8.0),
          Column(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 15.0 , color: Colors.grey),
              ),
              Text(
                value,
                style: TextStyle(fontSize: 14.0),
              ),
            ],
          ),

        ],
      ),
    );
  }
}