import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SilverAppBarWithAnimation(),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle admin button press
                    },
                    child: Text('Admin'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle faculty button press
                    },
                    child: Text('Faculty'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle student button press
                    },
                    child: Text('Student'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SilverAppBarWithAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: AnimatedTextKit(
        animatedTexts: [
          TyperAnimatedText(
            'NRIIT Institute of Technology',
            textStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            speed: Duration(milliseconds: 100),
          ),
        ],
        repeatForever: true,
      ),
      floating: true,
      expandedHeight: 200.0, // Adjust as needed
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://example.com/your_background_image_url.jpg',
          fit: BoxFit.cover,
        ),
      ),
      // Other SliverAppBar properties like actions, etc.
    );
  }
}
