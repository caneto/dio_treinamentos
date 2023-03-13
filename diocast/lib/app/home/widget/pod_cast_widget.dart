import 'package:flutter/material.dart';


class PodcastWidget extends StatelessWidget {
  const PodcastWidget({
    super.key,
    required this.img,
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
    required this.click,
  });

  final String img;
  final String title;
  final String description;
  final Color color;
  final Icon icon;
  final VoidCallback click;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.cover)),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 15),
                ),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            )
          ],
        ),
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: click,
            child: icon,
          ),
        ),
      ],
    );
  }
}