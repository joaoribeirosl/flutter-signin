import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final AuthStore authStore;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authStore = context.read<AuthStore>();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter your credentials to login',
              style: TextStyle(fontSize: 15),
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
                onChanged: (value) => authStore.toggleEnableSignin(value),
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(authStore.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () => authStore.toggleShowPassword(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: authStore.enableSigninButton
                    ? () async {
                        authStore.state.clearError();
                        bool success = await authStore.login(
                            usernameController.text, passwordController.text);

                        if (success) {
                          authStore.enableSigninButton = false;
                          Modular.to.navigate('/user_module/',
                              arguments: authStore.actualUser);
                        } else {
                          authStore.state.setError('User not found!');
                        }
                      }
                    : null,
                child: const Text('Login'),
              ),
            ),
            Observer(
              builder: (_) {
                if (authStore.state.errorState != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text(
                          authStore.state.errorState!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  });
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Modular.to.pushNamed('/forgot_password_page/');
              },
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                usernameController.text = '';
                passwordController.text = '';
                Modular.to.pushNamed('/signup_page/');
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
