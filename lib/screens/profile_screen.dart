import 'package:flutter/material.dart';
import 'package:news_app_ui/widgets/bottom_navbar.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu,color: Colors.white,),
      ),
      bottomNavigationBar: BottomNavBar(index: 2,),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/faizuddin.jpg'),fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}
