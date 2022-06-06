import 'package:flutter/material.dart';
import 'package:frivia_app_flutter/pages/game_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _difficultyLevel = 0;
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Center(
                child: Text(
                  'Frivia',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                  ),
                ),
              ),
              Text(
                _getDifficultyLevel(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(),
              Slider(
                min: 0,
                max: 2,
                value: _difficultyLevel,
                divisions: 2,
                label: 'difficulty',
                onChanged: (value) {
                  setState(
                    () {
                      _difficultyLevel = value;
                    },
                  );
                },
              ),
              const Spacer(),
              _startGameButton(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  String _getDifficultyLevel() {
    int level = _difficultyLevel.toInt();
    String label = level == 0
        ? 'Easy'
        : level == 1
            ? 'Medium'
            : 'Hard';
    return label;
  }

  Widget _startGameButton() {
    return MaterialButton(
      minWidth: _deviceWidth! * 0.75,
      height: _deviceHeight! * 0.08,
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GamePage(
            difficultyLevel: _getDifficultyLevel().toLowerCase(),
          ),
        ),
      ),
      child: const Text(
        'Start',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
        ),
      ),
      color: Colors.blueAccent,
    );
  }
}
