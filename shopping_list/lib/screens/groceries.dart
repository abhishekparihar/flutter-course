import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_list_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));
    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeGrocery(GroceryItem groceryItem) {
    final itemIndex = _groceryItems.indexOf(groceryItem);
    setState(() {
      _groceryItems.remove(groceryItem);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        content: Text('Item "${groceryItem.name}" removed.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _groceryItems.insert(itemIndex, groceryItem);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = ListView.builder(
      itemCount: _groceryItems.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(_groceryItems[index].id),
        background: Container(
          color: Theme.of(context).colorScheme.error.withValues(alpha: .40),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          _removeGrocery(_groceryItems[index]);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: GroceryListItem(groceryItem: _groceryItems[index]),
        ),
      ),
    );

    if (_groceryItems.isEmpty) {
      widget = Center(
        child: Text(
          'No items added yet!',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        centerTitle: false,
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: widget,
      ),
    );
  }
}
