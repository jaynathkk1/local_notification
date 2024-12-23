import 'package:alarm_clock/notification/another_page.dart';
import 'package:alarm_clock/notification/local_notification.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    listenToNotification();
    super.initState();
  }

  //listen to any notification to on Clicked or not
  listenToNotification() {
    print('Listening notification...');
    LocalNotification.onClickNotification.stream.listen(
      (event) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnotherPage(payload: event),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Notification"),),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.notification_add_outlined,
                ),
                onPressed: () {
                  LocalNotification.showSimpleNotification(
                      title: "Simple Notification",
                      body: "This is Sample Notification",
                      payload: "This is simple Notification data");
                },
                label: const Text('Simple Notification'),
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.timer_outlined,
                ),
                onPressed: () {
                  LocalNotification.showPeriodicNotification(
                      title: "Periodic Notification",
                      body: "This is Periodic Notification",
                      payload: "This is Periodic Notification data");
                },
                label: const Text('Periodic Notification'),
              ),
              ElevatedButton.icon(
                icon: const Icon(
                  Icons.timer_outlined,
                ),
                onPressed: () {
                  LocalNotification.showScheduleNotification(
                      title: "Schedule Notification",
                      body: "This is Schedule Notifcation",
                      payload: "This is Schedule Notification data");
                },
                label: const Text('Schedule Notification'),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.delete_outline),
                label: const Text(
                  "Close periodic notification",
                ),
                onPressed: () {
                  LocalNotification.cancelAll();
                },
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.delete_forever_outlined),
                label: const Text(
                  "Close All notification",
                ),
                onPressed: () {
                  LocalNotification.cancel(2);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
