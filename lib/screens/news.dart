import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:huys_ter_horst/screens/item.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:huys_ter_horst/widgets/news_item.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() {
    return _NewsState();
  }
}

class _NewsState extends State<News> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        onPressed: scan,
        tooltip: 'Scan a QR code!',
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('news').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final newspost = NewsPost.fromSnapshot(data);
    return Padding(
      key: ValueKey(newspost.title),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(newspost.title),
          subtitle: Text(newspost.subtitle),
          trailing: Icon(Icons.arrow_forward),
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsItem(
                        newspost.title,
                        newspost.subtitle,
                        newspost.content,
                        newspost.images,
                        newspost.date,
                      ),
                ),
              ),
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String code = await BarcodeScanner.scan();
      setState(() => this.code = code);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ItemScreen(this.code)),
      );
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.code = 'No camera permission!';
        });
      } else {
        setState(() => this.code = 'Unknown error: $e');
      }
    } on FormatException {
      setState(() => this.code = 'null (User used the back button!)');
    } catch (e) {
      setState(() => this.code = 'Unknown error: $e');
    }
  }
}

class NewsPost {
  final String title;
  final String subtitle;
  final String content;
  final DateTime date;
  final List<dynamic> images;
  final DocumentReference reference;

  NewsPost.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['title'] != null),
        assert(map['subtitle'] != null),
        assert(map['content'] != null),
        assert(map['date'] != null),
        assert(map['images'] != null),
        title = map['title'],
        subtitle = map['subtitle'],
        content = map['content'],
        date = map['date'],
        images = map['images'];

  NewsPost.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$title:$subtitle:$content:$date:$images>";
}