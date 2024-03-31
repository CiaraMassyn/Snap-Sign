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
  ];

  @override
  Widget build(BuildContext context) {
    List<Document> filteredDocuments = _documents.where((doc) {
      return doc.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Previous Documents'),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search Documents',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
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
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(Icons.description),
          SizedBox(width: 8), 
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
