import 'package:flutter/material.dart';
import 'package:untitled1/halaman_detail.dart';
import 'package:untitled1/data_buku.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  // Membuat fungsi untuk menghitung tinggi gambar dengan lebar yang diinginkan
  double _getImageHeight(BuildContext context) {
    return MediaQuery.of(context).size.width / 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 182, 187, 255),
                Color.fromARGB(255, 153, 102, 255)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Data Buku',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku judul = listBuku[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Halamandetail(
                    judul: judul,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Menggunakan SizedBox untuk membuat box gambar
                  SizedBox(
                    height: _getImageHeight(context),
                    width: MediaQuery.of(context).size.width /
                        2.2, // ubah nilai lebar box
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.network(
                        judul.imageLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          judul.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          judul.author,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
