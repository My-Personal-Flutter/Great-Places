import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:great_places/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => GreatPlacesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          canvasColor: Colors.grey[100],
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.lightBlue,
          ).copyWith(
            secondary: Colors.amber,
            onSecondary: Colors.black,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => const PlacesListScreen(),
          AddPlaceScreen.routName: (ctx) => const AddPlaceScreen(),
        },
      ),
    );
  }
}
