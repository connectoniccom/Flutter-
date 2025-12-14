import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/firestore_service.dart';
import '../data/item_model.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Data')),
      body: StreamBuilder<List<Item>>(
        stream: firestoreService.getItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final items = snapshot.data ?? [];
          if (items.isEmpty) {
            return const Center(child: Text('No items found.'));
          }
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(item.name, style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(item.description, style: Theme.of(context).textTheme.bodyMedium),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
