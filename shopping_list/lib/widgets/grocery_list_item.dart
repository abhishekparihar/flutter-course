import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryListItem extends StatelessWidget {
  const GroceryListItem({super.key, required this.groceryItem});

  final GroceryItem groceryItem;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(width: 20, height: 20, color: groceryItem.category.color),
          SizedBox(width: 16),
          Text(groceryItem.name),
          SizedBox(width: 16),
          Spacer(),
          SizedBox(width: 16),
          Text('${groceryItem.quantity}'),
        ],
      ),
    );
  }
}
