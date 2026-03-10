import 'package:baby_eduction/views/notification/provider/notification_provider.dart';
import 'package:baby_eduction/widget/news_details_screen.dart';
import 'package:baby_eduction/widget/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(notificationProvider).getNotification();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(notificationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Notification")),

      body: notificationState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: notificationState.notificationModel?.data?.length ?? 0,
              itemBuilder: (context, index) {
                final notification =
                    notificationState.notificationModel?.data?[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),

                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: notification?.file?.path != null
                          ? NetworkImage(notification!.file!.path!)
                          : null,
                      child: notification?.file?.path == null
                          ? const Icon(Icons.notifications)
                          : null,
                    ),

                    title: Text(
                      notification?.title ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: SizedBox(
                      height: 40,
                      child: HtmlWidget(notification?.description ?? ""),
                    ),

                    trailing: Text(
                      formatDate(notification?.createdAt),
                      style: const TextStyle(fontSize: 12),
                    ),

                    onTap: () {
                      if (notification?.url != null &&
                          notification!.url.toString().isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                WebViewScreen(url: notification.url),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsScreen(
                              des: notification?.description,
                              title: notification?.title,
                              image: notification?.file?.path,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
    );
  }

  /// SIMPLE DATE FORMATTER
  String formatDate(List? dateList) {
    if (dateList == null || dateList.length < 3) return "";
    return "${dateList[0]}-${dateList[1]}-${dateList[2]}";
  }
}
