import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';

class CustomVenueInfoWidget extends StatelessWidget {
  final String? title, svgIcon;
  final Color? iconColor, titleColor;
  final IconData? icon;
  final bool? isSvg;
  const CustomVenueInfoWidget({
    super.key,
    this.title,
    this.svgIcon,
    this.icon,
    this.iconColor,
    this.titleColor,
    this.isSvg = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isSvg == true
            ? SvgPicture.asset(
                svgIcon ?? '',
                width: 22,
                height: 22,
                colorFilter: iconColor != null
                    ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                    : null,
              )
            : Icon(
                icon,
                color: iconColor ?? primaryColor,
                size: 22,
              ),
        Text(
          "$title",
          style: TextStyle(
            fontSize: 12,
            color: titleColor ?? Colors.grey,
          ),
        ),
      ],
    );
  }
}
