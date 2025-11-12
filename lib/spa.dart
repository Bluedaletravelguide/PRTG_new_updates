import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Worship extends StatefulWidget {
  const Worship({super.key});

  @override
  _WorshipState createState() => _WorshipState();
}

class _WorshipState extends State<Worship> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Mosque'),
              Tab(text: 'Buddhist'),
              Tab(text: 'Hindu'),
              Tab(text: 'Others'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title: const Text("Places of Worship",
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 0, 71, 133),
          actions: const <Widget>[
            AppBarMore(),
          ],
        ),
        body: TabBarView(
          children: [
            MyList2(
              items: [
                ItemData(
                  title: 'Ubudiah Mosque Kuala Kangsar',
                  imageUrl: 'assets/img/recommendation/pts/mosque/Ubudiah.jpg',
                  location: 'Jalan Istana, 33000 Kuala Kangsar, Perak',
                  contact: '+6011-1769 6364',
                ),
                ItemData(
                  title: 'Panglima Kinta Mosque',
                  imageUrl:
                      'assets/img/recommendation/pts/mosque/Panglima.jpeg',
                  location:
                      'Masjid Panglima Kinta 15, 3, Jalan Masjid, Taman Jubilee, 30300 Ipoh, Perak',
                  contact: '',
                ),
                ItemData(
                  title: 'Muhammadiah Mosque',
                  imageUrl:
                      'assets/img/recommendation/pts/mosque/Muhammadiah_Mosque.jpg',
                  location:
                      'Tingkat Tasek Jaya 2, Taman Tasek Jaya, 31400 Ipoh, Perak',
                  contact: '+6011-1236 4188',
                ),
                // Add more top places to stay
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Sam Poh Tong Temple',
                  imageUrl:
                      'assets/img/recommendation/pts/buddhist/Sam_Poh_Tong.jpeg',
                  location: 'Kampung Gunung Rapat, 31350 Ipoh, Perak',
                  contact: '+6012-533 4993',
                ),
                ItemData(
                  title: 'Kek Lok Tong Temple',
                  imageUrl:
                      'assets/img/recommendation/pts/buddhist/Kek_Lok_Tong.jpeg',
                  location:
                      'Persiaran Sepakat 3, Tmn Endah Jaya, 31350 Ipoh, Perak',
                  contact: '+605-312 8112',
                ),
                ItemData(
                  title: 'Perak Cave Temple',
                  imageUrl:
                      'assets/img/recommendation/pts/buddhist/Perak_Cave_Temple.jpg',
                  location:
                      'Jln. Kuala Kangsar, Kawasan Perindustrian Tasek, 31400 Ipoh, Perak',
                  contact: '+6011-2358 4126',
                ),
                // Add more hotels
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Sri Maha Mariamman Temple, Buntong',
                  imageUrl:
                      'assets/img/recommendation/pts/hindu/SriMahaMariammam.jpg',
                  location: 'Buntong, 30100 Ipoh, Perak',
                  contact: '+605-254 0291',
                ),
                ItemData(
                  title: 'Arulmegu Maha Mariamman Kovil Devastanam',
                  imageUrl:
                      'assets/img/recommendation/pts/hindu/ArulmeguMaha.jpg',
                  location:
                      'Jalan Lumut, Taman Sitiawan Maju 2, 32000 Sitiawan, Perak',
                  contact: '+6016-513 7832',
                ),
                ItemData(
                  title: 'Kallumalai Arulmigu Subramaniyar Temple',
                  imageUrl:
                      'assets/img/recommendation/pts/hindu/KallumalaiArulmigu.jpg',
                  location: '140, Jalan Raja Musa Aziz, 30300 Ipoh, Perak',
                  contact: '',
                ),
                // Add more hotels
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'St. Michael’s Church',
                  imageUrl: 'assets/img/recommendation/pts/other/StMichael.jpg',
                  location: '24, Jalan Gereja, 31650 Ipoh, Perak',
                  contact: '+605-242 8077',
                ),
                ItemData(
                  title: 'Church of Our Lady of Lourdes',
                  imageUrl:
                      'assets/img/recommendation/pts/other/ChurchOfOurLady.jpg',
                  location:
                      ' 45, Jalan Silibin, Taman Lim, 30100 Ipoh, Perak',
                  contact: '+605-527 9349',
                ),
                ItemData(
                  title: 'Catholic Church of Our Mother of Perpetual Help',
                  imageUrl:
                      'assets/img/recommendation/pts/other/CatholicChurch.jpg',
                  location:
                      'Church of Our Mother of Perpetual Help 1, Jalan Serindik, Taman Ipoh, 31400 Ipoh, Perak',
                  contact: '',
                ),
                // Add more hotels
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<ItemData> items;

  MyList2({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3.0,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const SizedBox(height: 8.0),
                    Text(
                      'location: ${items[index].location}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'contact: ${items[index].contact}',
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ItemData {
  final String title;
  final String imageUrl;
  final String location;
  final String contact;

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.contact,
  });
}
