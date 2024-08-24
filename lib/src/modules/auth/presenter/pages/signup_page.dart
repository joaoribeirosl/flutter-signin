import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';
// import 'package:fluttertoast/fluttertoast.dart';

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
    usernameController.addListener(_usernamePrinter);
    passwordController.addListener(_passwordPrinter);
    confirmPasswordController.addListener(_confirmPasswordPrinter);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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

  void _confirmPasswordPrinter() {
    final text = confirmPasswordController.text;
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
                onChanged: (value) => authStore.toggleEnablePassword(value),
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
            TextField(
              controller: confirmPasswordController,
              obscureText: authStore.showPassword ? false : true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock_outline),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final newUser = User(
                    id: '',
                    name: usernameController.text,
                    password: passwordController.text);
                await authStore.signup(newUser);
                // if (res != null) {
                //   Fluttertoast.showToast(
                //     msg: "congratz, you created your account!",
                //   );
                // }

                Modular.to.navigate('/');
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 16),
            const Text(
              'OR',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.login),
              label: const Text('Sign in with Google'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
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
