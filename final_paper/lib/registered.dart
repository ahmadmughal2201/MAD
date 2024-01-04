// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class UserListScreen extends StatefulWidget {
//   @override
//   _UserListScreenState createState() => _UserListScreenState();
// }
//
// class _UserListScreenState extends State<UserListScreen> {
//   List<Map<String, dynamic>> userList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // Fetch user data when the screen is initialized
//     fetchUsers();
//   }
//
//   Future<void> fetchUsers() async {
//     final apiUrl = 'http://localhost:3000/api/users'; // Replace with your actual backend URL
//
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//
//       if (response.statusCode == 200) {
//         final List<dynamic> users = jsonDecode(response.body);
//         setState(() {
//           userList = List<Map<String, dynamic>>.from(users);
//         });
//       } else {
//         // Handle error or show a message to the user
//         print("Failed to fetch users: ${response.body}");
//       }
//     } catch (e) {
//       // Handle error or show a message to the user
//       print("Error fetching users: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registered Users'),
//       ),
//       body: userList.isNotEmpty
//           ? ListView.builder(
//         itemCount: userList.length,
//         itemBuilder: (context, index) {
//           final user = userList[index];
//           return ListTile(
//             title: Text(user['username']),
//             subtitle: Text(user['email']),
//             // Add more user details as needed
//           );
//         },
//       )
//           : Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
//
// import 'dart:convert';
// import 'package:classroom/utils/shared_prefrences_utils.dart';
// import 'package:classroom/utils/snackbar_utils.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:classroom/components/drawer.dart';
// import 'package:classroom/components/workTile.dart';
// import 'package:classroom/pages/addAssignment.dart';
//
// class CourseDetailsPage extends StatefulWidget {
//   final String courseName;
//   final String teacherName;
//   final String backgroundImageUrl;
//
//   CourseDetailsPage({
//     required this.courseName,
//     required this.teacherName,
//     required this.backgroundImageUrl,
//   });
//
//   @override
//   _CourseDetailsPageState createState() => _CourseDetailsPageState();
// }
//
// class _CourseDetailsPageState extends State<CourseDetailsPage> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void _openDrawer() {
//     _scaffoldKey.currentState!.openDrawer();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getStream();
//   }
//
//   List<Map<String, dynamic>> streamData = [];
//   bool isLoading = true;
//   bool hasError = false;
//   late String errorMessage;
//
//   Future<void> getStream() async {
//     try {
//       var url = Uri.parse(
//           'http://localhost:3000/assignment/getAssignments/${widget.courseName}');
//       var response =
//       await http.get(url, headers: {'Content-Type': 'application/json'});
//
//       if (response.statusCode == 200) {
//         var jsonData = jsonDecode(response.body);
//
//         // Check if assignments are available
//         if (jsonData['data'] != null && jsonData['data'].isNotEmpty) {
//           setState(() {
//             streamData = List<Map<String, dynamic>>.from(jsonData['data']);
//             isLoading = false;
//           });
//           SnackBarUtils.showSnackBar(
//               context, jsonData['message'], Colors.green);
//         } else {
//           // Handle case when there are no assignments
//           setState(() {
//             isLoading = false;
//             hasError = true;
//           });
//           SnackBarUtils.showSnackBar(context,
//               'No assignments available for this class', Colors.orange);
//         }
//       } else {
//         Map<String, dynamic> responseBody = jsonDecode(response.body);
//         errorMessage = responseBody['message'];
//         SnackBarUtils.showSnackBar(
//             context, 'Stream failed to load: $errorMessage', Colors.red);
//         setState(() {
//           isLoading = false;
//           hasError = true;
//         });
//       }
//     } catch (error) {
//       SnackBarUtils.showSnackBar(context, 'Stream error: $error', Colors.red);
//       setState(() {
//         isLoading = false;
//         hasError = true;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text(widget.courseName),
//         leading: IconButton(
//           icon: Icon(Icons.menu),
//           onPressed: () {
//             _openDrawer();
//           },
//         ),
//       ),
//       drawer: MyDrawer(username: "Your content"),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Hero(
//               tag: 'backgroundImage_${widget.backgroundImageUrl}',
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   height: 150,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                       image: AssetImage(widget.backgroundImageUrl),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   child: Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             widget.courseName,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             widget.teacherName,
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             streamData.isNotEmpty
//                 ? ListView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: streamData.length,
//               itemBuilder: (context, index) {
//                 return WorkTile(
//                   title: streamData[index]['title'],
//                   subtitle: streamData[index]['dueDate'].toString(),
//                   teacherName: widget.teacherName,
//                 );
//               },
//             )
//                 : Text('No assignments available'),
//             if (checkUserType() == 'teacher')
//               FloatingActionButton(
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return ClassOptionsBottomSheet(
//                           courseName: widget.courseName);
//                     },
//                   );
//                 },
//                 tooltip: 'Add',
//                 backgroundColor: Colors.white,
//                 foregroundColor: Colors.blue,
//                 child: Icon(Icons.add),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<String> checkUserType() async {
//     print(widget.teacherName);
//     print('User Name from SH : ${await SharedPrefrencesUtils.getUserName()}');
//     if (widget.teacherName == await SharedPrefrencesUtils.getUserName()) {
//       print('User type : teacher');
//       return 'teacher';
//     } else {
//       print('User type : student');
//       return 'student';
//     }
//   }
// }
//
// class ClassOptionsBottomSheet extends StatelessWidget {
//   final String courseName;
//
//   const ClassOptionsBottomSheet({Key? key, required this.courseName})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
//       child: Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               title: Text('Add Assignment'),
//               // onTap: () {
//               //   Navigator.pop(context);
//               //   Navigator.push(
//               //     context,
//               //     MaterialPageRoute(
//               //       builder: (context) => CreateAssignment(
//               //         className: courseName,
//               //       ),
//               //     ),
//               //   );
//               // },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }