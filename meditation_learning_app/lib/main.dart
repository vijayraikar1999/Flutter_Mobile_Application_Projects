import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_learning_app/constants.dart';
import 'package:meditation_learning_app/widgets/bottom_nav_bar.dart';
import 'package:meditation_learning_app/widgets/category_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 52.0,
                      width: 52.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  Text(
                    'Good Morning \nShishir',
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(29.5),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: SvgPicture.asset('assets/icons/search.svg'),
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0,
                      children: [
                        CategoryCard(
                          title: 'Diet Recommendation',
                          svgSrc: 'assets/icons/Hamburger.svg',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Kagel Exercises',
                          svgSrc: 'assets/icons/Excrecises.svg',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Meditation',
                          svgSrc: 'assets/icons/Meditation.svg',
                          press: () {},
                        ),
                        CategoryCard(
                          title: 'Yoga',
                          svgSrc: 'assets/icons/yoga.svg',
                          press: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
