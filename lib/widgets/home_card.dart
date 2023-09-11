import 'package:flutter/material.dart';

/// Flutter code sample for [Card].

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: const [
            HomeCardDetails(),
            HomeCardDetails(),
            HomeCardDetails(),
            HomeCardDetails(),
            HomeCardDetails(),
            HomeCardDetails(),
            HomeCardDetails(),
            HomeCardDetails()
          ],
        ),
      ),
    );
  }
}

class HomeCardDetails extends StatelessWidget {
  const HomeCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: const SizedBox(
          height: 100,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.auto_graph_rounded),
                title: Text('The Enchanted Nightingale'),
                subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
