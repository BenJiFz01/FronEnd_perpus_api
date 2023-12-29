import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import 'profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class Book {
  final int id;
  final String judul;
  final String deskripsi;
  final String penulis;
  final String tema;

  Book(
      {required this.id,
      required this.judul,
      required this.deskripsi,
      required this.penulis,
      required this.tema});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      penulis: json['penulis'],
      tema: json['tema'],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('BOOKS FOR YOU', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Mengatur radius melengkung
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GenreListWidget(),
          Expanded(
            child: BookmarkListWidget(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 0) {
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookmarkPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        backgroundColor:
            Colors.blue.shade900, // Mengatur warna latar belakang menu bawah
        selectedItemColor:
            Colors.white, // Mengatur warna ikon dan teks item yang aktif
        unselectedItemColor: const Color.fromARGB(255, 111, 209, 255),
        // Mengatur warna ikon dan teks item yang tidak aktif
      ),
    );
  }
}

class GenreListWidget extends StatefulWidget {
  @override
  _GenreListWidgetState createState() => _GenreListWidgetState();
}

class _GenreListWidgetState extends State<GenreListWidget> {
  final ScrollController _genreScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      "Fiction",
      "Science Fiction",
      "Mystery",
      "Fiction",
      "Science Fiction",
      "Mystery"
    ];

    return Container(
      height: 50,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: _genreScrollController,
        physics: BouncingScrollPhysics(), // Tambahkan physics di sini
        child: Row(
          children: [
            for (int index = 0; index < genres.length; index++)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add logic to filter books based on genre
                  },
                  child: Text(genres[index]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BookmarkListWidget extends StatefulWidget {
  const BookmarkListWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BookmarkListWidgetState createState() => _BookmarkListWidgetState();
}

class _BookmarkListWidgetState extends State {
  List<Book> books = [];

  Future<void> fetchBooks() async {
    const url = 'https://perpusapi.my.id/buku';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      },
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        books = jsonData.map((item) => Book.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to fetch books');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> image = [
      'lib/image/xoxo.jpg',
      'lib/image/her_radiant.jpg',
      'lib/image/mermaid.jpeg',
      'lib/image/spookly.jpg',
      'lib/image/nobody.jpeg',
      'lib/image/nightbook.jpeg',
      'lib/image/peter.jpeg',
      'lib/image/soul.jpeg',
      'lib/image/thorn.jpeg',
      'lib/image/strange.jpeg',
      'lib/image/truth.jpeg',
      'lib/image/franken.jpeg',
      'lib/image/outsiders.jpeg',
      'lib/image/moves.jpeg',
      'lib/image/bewi.jpeg',
      'lib/image/otti.jpeg',
      'lib/image/dead.jpeg',
    ];

    return ListView.builder(
      itemCount: books.length -1,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 9.0),
          padding: EdgeInsets.all(8.0),
          width: 100, // Sesuaikan lebar sesuai kebutuhan
          height: 200, // Sesuaikan tinggi sesuai kebutuhan (tinggi widget teks)
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            leading: Container(
              width: 50, // Sesuaikan lebar gambar agar lebih besar
              height: 150, // Tinggi gambar memenuhi seluruh tinggi container
              child: Image.asset(
                image[index], // Gunakan path gambar lokal dari daftar
                fit: BoxFit.contain,
              ),
            ),
            title: Text(
              books[index].judul,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
             Text ('${books[index].penulis}\n${books[index].deskripsi}'),
            trailing: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Peminjaman Buku'),
                      content: Text('Anda telah meminjam ${books[index]}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Add'),
            ),
          ),
        );
      },
    );
  }
}
