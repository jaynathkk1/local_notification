import 'package:alarm_clock/notification/local_notification.dart';
import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  final String payload;
  const AnotherPage({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("This is Another Page"),
      ),
      body: Column(
        children: [
          Center(child: Text(payload)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            TextButton(onPressed: (){}, child: const Text("Snooze")),
              TextButton(onPressed: (){
                LocalNotification.cancelAll();
                Navigator.pop(context);
              }, child: const Text("Stop"))
          ],)
        ],
      ),
    );
  }
}
