import 'package:flutter/material.dart';
import 'package:untitled1/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class Halamandetail extends StatefulWidget {
  final DataBuku judul;
  final Uri_url = Uri.parse('https://flutter.dev');

  Halamandetail({Key? key, required this.judul}) : super(key: key);

  @override
  _HalamandetailState createState() => _HalamandetailState();
}

class _HalamandetailState extends State<Halamandetail> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          widget.judul.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _toggleBookmark,
            icon: Icon(_isBookmarked ? Icons.bookmark : Icons.bookmark_border),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.bisnis.com/posts/2018/08/29/832692/sakura.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 200.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          widget.judul.imageLink,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Deskripsi',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          widget.judul.title,
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget.judul.author,
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget.judul.country,
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          widget.judul.language,
                          style: TextStyle(fontSize: 16.0),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchUrl(widget.judul.link);
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  void _toggleBookmark() {
    setState(() {
      _isBookmarked = !_isBookmarked;
    });

    final SnackBar snackBar = SnackBar(
      content: _isBookmarked
          ? Text('Bookmark ditambahkan')
          : Text('Bookmark dihapus'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<bool> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    } else {
      return false;
    }
  }
}
