import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final AuthStore authStore;
  // final authDatasource = SigninDatasource();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    authStore = context.read<AuthStore>();

    usernameController.addListener(_usernamePrinter);
    passwordController.addListener(_passwordPrinter);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _usernamePrinter() {
    final text = usernameController.text;
    print('Second text field: $text');
  }

  void _passwordPrinter() {
    final text = passwordController.text;
    print('Second text field: $text');
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
                onChanged: (value) => authStore.toggleEnablePassword(value),
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
            const SizedBox(height: 24),
            Observer(
              builder: (_) => ElevatedButton(
                onPressed: authStore.enableButton
                    ? () async {
                        final newUser = User(
                            id: '',
                            name: usernameController.text,
                            password: passwordController.text);
                        await authStore.login(newUser);

                        Modular.to.navigate('/task_module/');
                      }
                    : null,
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Modular.to.navigate('/signup_page/');
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
