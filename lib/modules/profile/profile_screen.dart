// import 'package:flutter/material.dart';
// import 'package:my_first_app/constant.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Profile'),
//           centerTitle: true,
//           backgroundColor: primary,
//           titleTextStyle: const TextStyle(
//             color: Color.fromARGB(255, 0, 0, 0),
//             fontSize: 20,
//           ),
//         ),
//         body: Container(
//           child: Container(
//             margin: const EdgeInsets.only(top: 32.0),
//             child: ListView(
//               padding: const EdgeInsets.all(16.0),
//               children: [
//                 Center(
//                   child: Column(
//                     children: [
//                       //image and gmail
//                       Stack(
//                         alignment: Alignment.bottomRight,
//                         children: [
//                           const CircleAvatar(
//                             radius: 64.0,
//                             backgroundImage:
//                                 AssetImage('assets/images/profile.png'),
//                           ),
//                           InkWell(
//                             onTap: () {},
//                             child: const Icon(Icons.flip_camera_ios_rounded),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 16.0,
//                       ),
//                       const Text(
//                         'Narvasha Adhikari',
//                         style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.email),
//                           SizedBox(
//                             width: 8.0,
//                           ),
//                           Text(
//                             'narvasha@gmail.com',
//                             style: TextStyle(
//                               fontSize: 14.0,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 48.0,
//                       ),
//                       //second container
//                       Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8.0),
//                             color: Color.fromARGB(30, 158, 158, 158)),
//                         child: Column(
//                           children: [
//                             ListTile(
//                               leading: const Icon(Icons.person),
//                               title: const Text('Edit Details'),
//                               onTap: () {},
//                             ),
//                             ListTile(
//                               leading: const Icon(Icons.reviews),
//                               title: const Text('Change profile'),
//                               onTap: () {},
//                             ),
//                             ListTile(
//                               leading: const Icon(Icons.reviews),
//                               title: const Text('Reviews'),
//                               onTap: () {},
//                             ),
//                             ListTile(
//                               leading: const Icon(Icons.logout),
//                               title: const Text('Log Out'),
//                               onTap: () {},
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
