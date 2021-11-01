import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routName = "/add-place";

  const AddPlaceScreen({Key? key}) : super(key: key);

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Add New Place"),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: "Title",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const ImageInput(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(26.0),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text("Add Place"),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
