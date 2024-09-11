import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ResetPasswordPage> {
  final usernameController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: const Icon(Icons.arrow_back_ios_sharp),
        //     tooltip: 'back',
        //     onPressed: () => Navigator.pop(context),
        //   ),
        // ),
        // body: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     children: [
        //       const Text(
        //         'Forgot Password?',
        //         style: TextStyle(
        //           fontSize: 24,
        //           fontWeight: FontWeight.bold,
        //         ),
        //         textAlign: TextAlign.center,
        //       ),
        //       const SizedBox(height: 8),
        //       const Text(
        //         'No worries, we\'ll send you reset instructions',
        //         style: TextStyle(fontSize: 15),
        //         textAlign: TextAlign.center,
        //       ),
        //       const SizedBox(height: 32),
        //       TextField(
        //         controller: usernameController,
        //         decoration: const InputDecoration(
        //           labelText: 'Username',
        //           helperText: 'Inform your username to reset your password',
        //           prefixIcon: Icon(Icons.person),
        //           border: OutlineInputBorder(),
        //         ),
        //       ),
        //       const SizedBox(height: 32),
        //       Observer(
        //         builder: (_) => TextField(
        //           controller: newPasswordController,
        //           obscureText: authStore.showPassword ? false : true,
        //           decoration: InputDecoration(
        //             labelText: 'Password',
        //             helperText: "Password must contain at least 6 characters",
        //             prefixIcon: const Icon(Icons.lock),
        //             border: const OutlineInputBorder(),
        //             suffixIcon: IconButton(
        //               icon: Icon(authStore.showPassword
        //                   ? Icons.visibility
        //                   : Icons.visibility_off),
        //               onPressed: () {
        //                 authStore.toggleShowPassword();
        //               },
        //             ),
        //           ),
        //         ),
        //       ),
        //       const SizedBox(height: 16),
        //       TextField(
        //         controller: confirmNewPasswordController,
        //         obscureText: authStore.showPassword ? false : true,
        //         decoration: const InputDecoration(
        //           labelText: 'Confirm Password',
        //           prefixIcon: Icon(Icons.lock_outline),
        //           border: OutlineInputBorder(),
        //         ),
        //       ),
        //       const SizedBox(height: 32),
        //       ElevatedButton(
        //           onPressed: () {}, child: const Text('Reset Password'))
        //     ],
        //   ),
        // ),
        );
  }
}
