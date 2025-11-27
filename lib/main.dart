import 'package:flutter/material.dart';
import 'package:wisata_candi_natalia/data/candi_data.dart';
import 'package:wisata_candi_natalia/screens/SearchScreen.dart';
import 'package:wisata_candi_natalia/screens/detail_screen.dart';
import 'package:wisata_candi_natalia/screens/ProfileScreen.dart';
import 'package:wisata_candi_natalia/screens/SignInScreen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Candi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: DetailScreen(candi: candiList[0]),
    );
  }

}

class DetailScreen extends StatelessWidget{
  final dynamic candi;

  const DetailScreen({super.key, required this.candi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(candi.name),
      ),
      body: Center(
        child: Text('ID Candi: ${candi.id}'),
      ),
    );
  }
}