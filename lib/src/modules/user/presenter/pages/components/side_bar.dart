// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_signin/src/modules/user/presenter/store/user_store.dart';
// // import 'package:flutter_svg/flutter_svg.dart';

// class SideMenu extends StatelessWidget {
//   final UserStore userStore;
//   const SideMenu({super.key, required this.userStore});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Material(
//       child: Container(
//         color: theme.colorScheme.primaryContainer,
//         width: 75,
//         alignment: Alignment.topCenter,
//         padding: const EdgeInsets.symmetric(vertical: 32),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8.0, right: 4.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 24),
//               ExcludeSemantics(
//                 child: SizedBox(
//                   height: 80,
//                   child: Column(
//                     children: [
//                       // SvgPicture.asset(
//                       //   'assets/icons/logo/logo.svg', // URSO
//                       //   width: 50,
//                       //   height: 50,
//                       //   semanticsLabel: 'Logo',
//                       //   excludeFromSemantics: true,
//                       //   colorFilter: ColorFilter.mode(
//                       //     theme.colorScheme.primary,
//                       //     BlendMode.srcIn,
//                       //   ),
//                       // ),
//                       Text(
//                         "Menu",
//                         style: TextStyle(color: theme.colorScheme.primary),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     InkWell(
//                       borderRadius: BorderRadius.circular(15),
//                       onTap: () {
//                         // userStore.changeRoute('Devices', 'device_module'); // navigator
//                       },
//                       child: Observer(builder: (_) {
//                         return Tooltip(
//                           preferBelow: false,
//                           message: userStore.stateRunning
//                               ? "Running Test Suite"
//                               : "",
//                           child: MenuItem(
//                             notify: userStore.stateRunning,
//                             theme: theme,
//                             iconData: Icons.phone_android,
//                             title: userStore.title,
//                             isExpanded: userStore.title == 'Devices',
//                           ),
//                         );
//                       }),
//                     ),
//                     InkWell(
//                       borderRadius: BorderRadius.circular(15),
//                       onTap: () {
//                         userStore.changeRoute('Suites', 'suite_module');
//                       },
//                       child: Observer(builder: (_) {
//                         return MenuItem(
//                           theme: theme,
//                           iconData: Icons.table_chart,
//                           title: userStore.title,
//                           isExpanded: userStore.title == 'Suites',
//                         );
//                       }),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
