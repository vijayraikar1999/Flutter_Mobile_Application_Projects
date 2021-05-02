import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationExample1 extends StatefulWidget {
  _AnimationExample1State createState() => _AnimationExample1State();
}

class _AnimationExample1State extends State<AnimationExample1>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Animation Example'),
          ),
          body: Transform(
            transform:
                Matrix4.translationValues(animation.value * width, 0.0, 0.0),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'UserName'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Log In'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Don\'t have an account?'),
                    SizedBox(
                      height: 20.0,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: Text('Sign up'),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
