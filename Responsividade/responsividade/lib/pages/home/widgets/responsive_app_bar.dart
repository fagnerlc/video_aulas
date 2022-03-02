import 'package:flutter/material.dart';

class ResponsiveAppBar extends StatelessWidget {
  //const ResponsiveAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 1,
      title: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Row(
          children: [
            const MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                'Flutter',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 4),
              width: 200,
              height: 30,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.white,
              )),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(width: 4),
                  Expanded(
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
