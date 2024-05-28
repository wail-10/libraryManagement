import 'package:flutter/material.dart';
import 'package:library_manager/book_details.dart';

class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
  });
}

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Book> books = [
    Book(
        title: 'The Alchemist',
        author: 'Paulo Coelho',
        imageUrl:
            'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1654371463i/18144590.jpg',
        description:
            'The Alchemist is a story of following one s dreams to find one s purpose in life. The main character, Santiago, is a Spanish'),
    Book(
        title: 'The Da Vinci Code',
        author: 'Dan Brown',
        imageUrl:
            'https://m.media-amazon.com/images/I/815WORuYMML._AC_UF1000,1000_QL80_.jpg',
        description:
            'The Da Vinci Code is a mystery thriller novel by Dan Brown. It follows symbologist Robert Langdon and cryptologist Sophie Neveu')
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void addToList() {
    setState(() {
      books.add(
        Book(
          title: titleController.text,
          author: authorController.text,
          imageUrl: imageUrlController.text,
          description: descriptionController.text,
        ),
      );
    });
    titleController.clear();
    authorController.clear();
    imageUrlController.clear();
    descriptionController.clear();
  }

  void removeFromList(index) {
    setState(() {
      books.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Books Page',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsPage(),
                ),
              );
            },
            leading: Image.network(
              books[index].imageUrl,
              width: 100,
              height: 100,
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                removeFromList(index);
              },
            ),
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
          );
        },
      ),
      // body: Column(
      //   children: [

      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Ajouter un livre'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(labelText: 'Titre'),
                      ),
                      TextField(
                        controller: authorController,
                        decoration: InputDecoration(labelText: 'Auteur'),
                      ),
                      TextField(
                        controller: imageUrlController,
                        decoration:
                            InputDecoration(labelText: 'URL de l\'image'),
                      ),
                      TextField(
                        controller: descriptionController,
                        decoration: InputDecoration(labelText: 'Description'),
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Annuler'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addToList();
                      Navigator.pop(context);
                    },
                    child: Text('Ajouter'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
