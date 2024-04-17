import 'package:flutter/material.dart';
import 'package:opening_hour_display_widget/opening_hour_display_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Open Hour Display Widget Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home:
          const MyHomePage(title: 'Open Hour Display Widget Example Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Find out if the store is open or closed',
            ),
            SizedBox(
              width: 220,
              child: OpeningHourDisplayWidget(
                boxWidth: 210,
                openTitle: "Open",
                closeTitle: "Closed",
                openDescription: "We'll be closed on 6:00 PM",
                closeDescription: "We'll be open on 9:00 AM",
                openHour: 9,
                closeHour: 18,
                iconSize: 20,
                openColor: Colors.green,
                closeColor: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
