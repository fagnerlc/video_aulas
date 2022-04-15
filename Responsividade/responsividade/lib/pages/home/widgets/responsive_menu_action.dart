import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ResponsiveMenuAction extends StatelessWidget {
  const ResponsiveMenuAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ResponsiveVisibility(
          visible: false,
          visibleWhen: const [Condition.smallerThan(name: TABLET)],
          child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ),
        const SizedBox(width: 4),
        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        const SizedBox(width: 4),
        IconButton(onPressed: () {}, icon: Icon(Icons.send)),
        const SizedBox(width: 4),
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        const SizedBox(width: 4),
        const CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbBViAQ2ORxVCs-M6uFZUlHNg_Yl5qDfhCkqudc5K-_bIeEAgIP3iFKMQyzUmC8rspkZ4&usqp=CAU'),
        )
      ],
    );
  }
}
