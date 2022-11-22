import 'package:flutter/material.dart';


///Counter for adding and removing products
///(- 1 +)
class Counter extends StatelessWidget {
  ///Initilize counter with a value, default is 0
  final int? value;
  final Function(int count) onIncrement, onDecrement;

  Counter({
    Key? key,
    this.value,
    required this.onDecrement,
    required this.onIncrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),

        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
                onTap: () {
                  if (value! > 1) onDecrement(-1);
                },
                child: Icon(Icons.remove)),
          ),
          Text(
            value.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
            child: GestureDetector(onTap: () => onIncrement(1), child: Icon(Icons.add)),
          ),
        ],
      ),
    );
  }
}
