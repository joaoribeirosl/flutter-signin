import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/infra/datasource/signin_datasource.dart';
// import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/auth_store.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final AuthStore authStore;
  final SigninDatasource authDatasource = SigninDatasource();

  @override
  void initState() {
    super.initState();
    authStore = context.read<AuthStore>();
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
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Password',
                helperText:"Password must contain at least 6 characters",
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
                // suffixIcon: IconButton( 
                //       icon: Icon(authStore.showPassword 
                //           ? Icons.visibility 
                //           : Icons.visibility_off), 
                //       onPressed: () { 
                //         setState( 
                //           () { 
                //             showPassword = !showPassword; 
                //           }, 
                //         ); 
                //       }, 
                //     ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // var testUser = User(id: '1', name: 'jo', password: 'pass'); 
                // authDatasource.login(testUser);
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
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
