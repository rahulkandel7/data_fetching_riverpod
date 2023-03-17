import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_app/features/home/presentation/controllers/user_controller.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data from API'),
      ),
      body: ref.watch(userControllerProvider).when(
            data: (data) {
              return ListView.separated(
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      data[i].name.characters.first,
                    ),
                  ),
                  title: Text(data[i].name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data[i].email),
                      Text(data[i].phone),
                    ],
                  ),
                ),
                itemCount: data.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              );
            },
            error: (e, s) => Text(e.toString()),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
