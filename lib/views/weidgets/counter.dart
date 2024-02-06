import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (count > 1) count--;
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.remove),
          ),
        ),
        Text(count.toString()),
        InkWell(
          onTap: () {
            setState(() {
              count++;
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.add),
          ),
        )
      ],
    );
  }
}
