import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> _openUrl(String url) async {
    final isLaunchable = await canLaunch(url);
    if (isLaunchable) {
      launch(url);
    }
  }

  Widget _header() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_pic.jpg'),
              radius: 100.0,
            ),
            SizedBox(height: 24.0),
            Text(
              'Hello World, I am Vijay.',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w400,
                color: kDarkGrey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              'A Software Engineer passionate about building web and mobile applications.',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                color: kDarkGrey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              alignment: WrapAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _openUrl('https://www.linkedin.com'),
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: kBlueColor,
                  ),
                ),
                IconButton(
                  onPressed: () =>
                      _openUrl('https://github.com/vijayraikar1999'),
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    color: kBlueColor,
                  ),
                ),
                IconButton(
                  onPressed: () => _openUrl('https://www.instagram.com'),
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: kBlueColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _badges() {
    const technologies = [
      'flutter',
      'dart',
      'python',
      'tensorflow',
      'git',
      'bash',
      'firebase',
      'html',
      'css',
      'javascript'
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: technologies
            .map(
              (tech) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/badges/$tech.png',
                        width: 48.0,
                      ),
                      Text(tech),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  _renderProjectCard({
    required String imageUrl,
    required String title,
    required String description,
    String? visitLink,
  }) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: 200.0,
            width: 350.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: kDarkGrey,
              fontWeight: FontWeight.w800,
              fontSize: 20.0,
            ),
          ),
          Text(
            description,
          ),
        ],
      ),
    );
  }

  Widget _projects() {
    return Container(
      color: kLightGrey,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 52.0, horizontal: 16.0),
      child: Column(
        children: [
          Text(
            'Projects',
            style: TextStyle(
              color: kDarkGrey,
              fontSize: 28.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              _renderProjectCard(
                imageUrl: 'assets/projects/pokedox.png',
                title: 'Pokedex',
                description: 'Pokemon explorer build with flutter',
                visitLink: 'https://pokedexweb.surge.sh',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FiraCode-Regular',
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'Vijay Raikar',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 24.0),
              _badges(),
              const SizedBox(height: 32.0),
              _projects(),
              const SizedBox(height: 300.0),
              _footer(),
            ],
          ),
        ),
      ),
    );
  }
}
