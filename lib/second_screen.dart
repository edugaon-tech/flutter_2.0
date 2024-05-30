import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

void main() {
  // runApp(MyApp());

  var b = B();

}


mixin class B{
  String? g;

  a(){}
}



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Marvel Comics App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ComicsPage(),
//     );
//   }
// }
//
// class ComicsPage extends StatefulWidget {
//   @override
//   _ComicsPageState createState() => _ComicsPageState();
// }
//
// class _ComicsPageState extends State<ComicsPage> {
//   late Future<Map<String, dynamic>> futureComics;
//
//   @override
//   void initState() {
//     super.initState();
//     futureComics = fetchMarvelComics();
//   }
//
//   String generateMd5(String input) {
//     return md5.convert(utf8.encode(input)).toString();
//   }
//
//   Future<Map<String, dynamic>> fetchMarvelComics() async {
//     final String publicKey = '903d0f10c79d8293540d12fc09b4f04d';
//     final String privateKey = '956c02a0f3cb7266886f1c23a93402022afb04b9';
//     final String ts = DateTime.now().millisecondsSinceEpoch.toString();
//     final String hash = generateMd5(ts + privateKey + publicKey);
//
//     final String url = 'https://gateway.marvel.com/v1/public/comics?'
//         'apikey=$publicKey&ts=$ts&hash=$hash';
//
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       return json.decode(response.body);
//     } else {
//       throw Exception('Failed to load comics');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Marvel Comics'),
//       ),
//       body: FutureBuilder<Map<String, dynamic>>(
//         future: futureComics,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             final List<dynamic> comics = snapshot.data!['data']['results'];
//             return ListView.builder(
//               itemCount: comics.length,
//               itemBuilder: (context, index) {
//                 final comic = comics[index];
//                 return ListTile(
//                   title: Text(comic['title']),
//                   subtitle: Text(comic['description'] ?? 'No description available'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
