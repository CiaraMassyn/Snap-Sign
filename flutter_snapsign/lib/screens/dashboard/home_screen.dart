import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearchOpen = false;
  String _searchQuery = '';
  List<Document> _documents = [
    Document(title: 'Document 1', date: 'March 25, 2024'),
    Document(title: 'Document 2', date: 'March 24, 2024'),
    Document(title: 'Document 3', date: 'March 23, 2024'),
    Document(title: 'Document 4', date: 'March 22, 2024'),
    Document(title: 'Document 5', date: 'March 21, 2024'),
  ];

  @override
  Widget build(BuildContext context) {
    List<Document> filteredDocuments = _documents.where((doc) {
      return doc.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: _isSearchOpen
            ? TextField(
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search Documents',
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white70),
                ),
                style: TextStyle(color: Colors.white),
              )
            : Text('Previous Documents'),
        actions: [
          IconButton(
            icon: _isSearchOpen ? Icon(Icons.close) : Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isSearchOpen = !_isSearchOpen;
                if (!_isSearchOpen) _searchQuery = ''; // Clear search query when closing search
              });
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recent Documents',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredDocuments.length,
              itemBuilder: (context, index) {
                return DocumentItem(
                  title: filteredDocuments[index].title,
                  date: filteredDocuments[index].date,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DocumentItem extends StatelessWidget {
  final String title;
  final String date;

  DocumentItem({
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.description, color: Colors.blue),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Document {
  final String title;
  final String date;

  Document({
    required this.title,
    required this.date,
  });
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
