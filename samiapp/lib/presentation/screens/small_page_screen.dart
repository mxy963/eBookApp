// // ignore_for_file: file_names

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:samiapp/zib/consttants.dart';
// import 'package:samiapp/zib/screens_to_call/drawer_screen.dart';
// import 'package:samiapp/zib/see_more.dart';
// import 'package:samiapp/zib/screens_to_call/book_card.dart';
// import 'package:samiapp/zib/screens_to_call/sliver_appbar.dart';

// class SmallHomePage extends StatefulWidget {
//   final String idKey;
//   const SmallHomePage({super.key, required this.idKey});

//   @override
//   State<SmallHomePage> createState() => _SmallHomePageState();
// }

// class _SmallHomePageState extends State<SmallHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         drawer: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topRight: Radius.circular(30),
//             bottomRight: Radius.circular(30),
//           ),
//           child: SizedBox(
//             width: 220,
//             height: double.infinity,
//             child: DrawerScreen(
//               idKey: widget.idKey,
//             ),
//           ),
//         ),
//         body: CustomScrollView(
//           physics: const BouncingScrollPhysics(),
//           slivers: <Widget>[
//             const SliverAppbar(),
//             SliverList(
//               delegate: SliverChildListDelegate([
//                 Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [Colors.white, kProgressIndicator.withOpacity(0.1)],
//                     ),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       _buildSectionHeader("New Arrivals", onTap: () => _navigateToSeeMore(context)),
//                       _buildBookList([0, 1, 2, 3]),
//                       const SizedBox(height: 20),
//                       _buildSectionHeader("Top Trends", onTap: () => _navigateToSeeMore(context)),
//                       _buildBookList([4, 5, 6, 7]),
//                       const SizedBox(height: 20),
//                     ],
//                   ),
//                 )
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionHeader(String title, {required VoidCallback onTap}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               color: kProgressIndicator,
//               fontWeight: FontWeight.bold,
//               fontSize: 22,
//             ),
//           ),
//           GestureDetector(
//             onTap: onTap,
//             child: Text(
//               "See More",
//               style: GoogleFonts.poppins(
//                 color: kLightBlackColor,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBookList(List<int> bookIds) {
//     return SizedBox(
//       height: 220,
//       child: ListView.builder(
//         physics: const BouncingScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         itemCount: bookIds.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: BookCard(
//               idKey: widget.idKey,
//               id: bookIds[index],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   void _navigateToSeeMore(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const SeeMore(),
//       ),
//     );
//   }
// }
