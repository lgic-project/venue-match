import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDishTypeWidget extends StatelessWidget {
  final String? title, desc;

  final Color? color;
  const CustomDishTypeWidget({
    super.key,
    this.title,
    this.desc,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.circle,
              color: color,
              size: 6,
            ),
            const SizedBox(width: 5),
            Text(
              title ?? '',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          desc ?? '',
          style: GoogleFonts.poppins(
            fontSize: 13,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
