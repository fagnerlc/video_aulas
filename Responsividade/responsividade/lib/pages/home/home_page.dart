import 'package:flutter/material.dart';
import 'package:responsividade/pages/home/widgets/responsive_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: ResponsiveAppBar(), preferredSize: Size(double.infinity, 52)),
    );
  }
}