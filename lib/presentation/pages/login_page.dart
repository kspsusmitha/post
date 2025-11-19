import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/login_provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),

            const SizedBox(height: 20),

            provider.loading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () {
                      provider.login(
                        usernameController.text.trim(),
                        passwordController.text.trim(),
                      );
                    },
                    child: const Text("Login"),
                  ),

            const SizedBox(height: 20),

            if (provider.errorMessage != null)
              Text(
                provider.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),

            if (provider.user != null)
              Text(
                "WELCOME ${provider.user!.username}",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
