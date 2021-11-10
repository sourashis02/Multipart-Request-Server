import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  TasksTile({
    required this.taskTitle,
    required this.onPress,
    required this.size,
  });
  final String taskTitle;
  final String size;
  final GestureLongPressCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1.0),
      ),
      margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox(
            //   width: 15.0,
            // ),
            // Text(taskTitle),
            // Column(
            //   children: [Text(taskTitle), Text(size)],
            // ),
            // SizedBox(height: 150,),
            Row(
              children: [
                const Icon(Icons.image),
                SizedBox(
                  width: 20.0,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(taskTitle),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(size),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(onPressed: onPress, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
