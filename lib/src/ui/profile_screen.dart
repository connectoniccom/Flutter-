import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: StreamBuilder<User?>(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final user = snapshot.data;
            if (user == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You are not signed in.', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => authService.signInAnonymously(),
                    child: const Text('Sign In Anonymously'),
                  ),
                ],
              );
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome!', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 10),
                Text('User ID: ${user.uid}', style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => authService.signOut(),
                  child: const Text('Sign Out'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
