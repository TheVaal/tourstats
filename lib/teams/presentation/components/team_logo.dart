import 'package:flutter/material.dart';

class TeamLogoWidget extends StatelessWidget {
  final String logoUrl;
  const TeamLogoWidget({
    super.key,
    required this.logoUrl,});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black45, // Background color
        borderRadius: BorderRadius.circular(12),
      ),
      child: 
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            logoUrl,
            width: 150,
            height: 100,
            fit: BoxFit.fitHeight,
          ),
        ) 
    );
  }
}