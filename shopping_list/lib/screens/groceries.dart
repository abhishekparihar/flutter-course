import 'package:flutter/material.dart';
import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  void _addItem() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        centerTitle: false,
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: GroceryListItem(groceryItem: groceryItems[index]),
          ),
        ),
      ),
    );
  }
}
