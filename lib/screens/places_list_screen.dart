import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places_provider.dart';
import 'package:great_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routName);
            },
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlacesProvider>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (ctx, snapshotData) => snapshotData.connectionState ==
                ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlacesProvider>(
                builder: (ctx, greatPlacesData, ch) => greatPlacesData
                        .items.isEmpty
                    ? ch!
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          itemCount: greatPlacesData.items.length,
                          itemBuilder: (ct, index) => Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  greatPlacesData.items[index].image!,
                                ),
                              ),
                              title: Text(greatPlacesData.items[index].title!),
                              subtitle: Text(greatPlacesData
                                  .items[index].location!.address!),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                child: const Center(
                    child: Text("Got no places yet, start adding some!")),
              ),
      ),
    );
  }
}
