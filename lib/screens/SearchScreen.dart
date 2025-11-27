import 'package:flutter/material.dart';
import '../models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //TODO: 1. Deklarasikan variabel yang dibutuhkan
  List<Candi> _filteredCandi = [];
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2.Buat appbar dengan judul pencarian candi
      appBar: AppBar(title: Text('Wisata Candi')),
      //TODO: 3. Buat body berupa Column
      body: Column(
        children: [
          //TODO: 4. Buat TextField pencarian sebagai anak dari Column
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                controller: _searchController,
                //TODO: 6. Implementasi Fitur Pencarian
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Mencari Candi...',
                  prefixIcon: Icon(Icons.search),
                  //TODO : 7. Implementasi pengosongan input
                  border: InputBorder.none,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          //TODO: 5. Buat ListView hasil pencarian sebagai anak dari Column
          ListView.builder(
            itemCount: _filteredCandi.length,
            itemBuilder: (context, index) {
              final candi = _filteredCandi[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(candi.imageAsset, fit: BoxFit.cover),
                      ),
                    ),

                    //Kolom Teks
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            candi.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(candi.location),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
