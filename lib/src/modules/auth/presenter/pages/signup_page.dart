import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final AuthStore authStore;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authStore = context.read<AuthStore>();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp),
            tooltip: 'back',
            onPressed: () {
              authStore.agreeTermsCheckboxValue = false;
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Create your account',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) => TextField(
                controller: passwordController,
                obscureText: authStore.showPassword ? false : true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: 'Password',
                  helperText: "Password must contain at least 6 characters",
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(authStore.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      authStore.toggleShowPassword();
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Observer(
              builder: (_) => TextField(
                controller: confirmPasswordController,
                obscureText: authStore.showPassword ? false : true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Observer(
                  builder: (_) => Checkbox(
                    value: authStore.agreeTermsCheckboxValue,
                    onChanged: (value) =>
                        authStore.agreeTermsCheckboxValue = value ?? false,
                  ),
                ),
                const Expanded(
                  child: Text(
                    'I Agree with terms of Service and Privacy Policy',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: authStore.agreeTermsCheckboxValue
                    ? () async {
                        if (await authStore.signup(
                            usernameController.text,
                            passwordController.text,
                            confirmPasswordController.text)) {
                          ScaffoldMessenger.of(_).showSnackBar(const SnackBar(
                              content: Text('User created successfully!')));
                          authStore.agreeTermsCheckboxValue = false;
                          Modular.to.navigate('/');
                        }
                      }
                    : null,
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey[400],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'or',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.login),
              label: const Text('Sign up with Google'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                authStore.agreeTermsCheckboxValue = false;
                Modular.to.navigate('/');
              },
              child: const Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
