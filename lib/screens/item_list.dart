import 'package:flutter/material.dart';
import 'package:item_insight_mobile/widgets/left_drawer.dart';
import 'package:item_insight_mobile/screens/item_form.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Item'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.pink.shade50,
              border: Border.all(
                color: Colors.pink.shade300,
                width: 2.0, // Adjust the width as needed
              ),
              borderRadius: BorderRadius.circular(8.0), // Optional: Add border radius
            ),
            child: ListTile(
              title: Text(
                item.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category: ${item.category}"),
                  Text("Price: IDR ${item.price}"),
                  Text("Amount: ${item.amount}"),
                ],
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: const Icon(Icons.info_outline, color: Colors.pink),
                onPressed: () {
                  // Ketika click icon detail, akan memunculkan data lengkap item
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(item.name),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text("Category: ${item.category}"),
                              Text("Amount: ${item.amount}"),
                              Text("Price: IDR ${item.price} "),
                              Text("Description: ${item.description}"),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
