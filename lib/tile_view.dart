import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TileView extends StatelessWidget {
  final String taskName;
  final bool tashComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)?deleteFunction;

  TileView(
      {Key? key,
      required this.taskName,
      required this.tashComplete,
      required this.onChanged,
      required this.deleteFunction,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          color: Colors.yellow,
          child: Row(
            children: [
              Checkbox(
                value: tashComplete,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  taskName,
                  style: TextStyle(
                    decoration: tashComplete
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
