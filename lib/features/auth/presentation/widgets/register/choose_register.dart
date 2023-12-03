import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContainerChoose extends StatelessWidget {
  const ContainerChoose({
    super.key,
    required this.image,
    this.color,
    this.onTap,
  });

  final String image;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width * 0.26,
        height: height * 0.07,
        decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 3, color: Colors.grey),
              left: BorderSide(width: 3, color: Colors.grey),
              right: BorderSide(width: 3, color: Colors.grey),
              bottom: BorderSide(width: 3, color: Colors.grey),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
            ),
          ],
        ),
      ),
    );
  }
}
