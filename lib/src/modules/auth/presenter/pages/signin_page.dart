import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/auth/presenter/pages/components/auth_toast_manager.dart';
import 'package:flutter_signin/src/modules/auth/presenter/store/signin_store.dart';
import 'package:mobx/mobx.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final SigninStore signinStore;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    signinStore = context.read<SigninStore>();
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
        child: ReactionBuilder(
          builder: (context) => reaction(
            (p0) => signinStore.state.errorState,
            (p0) {
              if (p0 != null) {
                AuthToastManager.showToast(p0, context, true);
              }
            },
          ),
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
                  obscureText: signinStore.showPassword ? false : true,
                  enableSuggestions: false,
                  autocorrect: false,
                  onChanged: (value) => signinStore.toggleEnableSignin(value),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(signinStore.showPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => signinStore.toggleShowPassword(),
                    ),
                  ),
                  // onSubmitted: (value) => signinStore.enableSigninButton  // press enter to login
                  //     ? signinStore.login(
                  //         usernameController.text, passwordController.text)
                  //     : null,
                ),
              ),
              const SizedBox(height: 24),
              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: signinStore.enableSigninButton
                      ? () async {
                          signinStore.state.clearError();
                          bool success = await signinStore.login(
                              usernameController.text, passwordController.text);

                          if (success) {
                            signinStore.sendTaskIo(signinStore.actualUser.id);
                            signinStore.showPassword = false;
                            signinStore.enableSigninButton = false;
                            Modular.to.navigate('/user_module/', arguments: {
                              'user': signinStore.actualUser,
                              'taskCount': '${signinStore.getTaskCount()}',
                            });
                          } else {
                            signinStore.state
                                .setError('Incorrect username or password!');
                          }
                        }
                      : null,
                  child: const Text('Login'),
                ),
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
      ),
    );
  }
}
