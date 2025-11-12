import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Stay extends StatefulWidget {
  const Stay({super.key});

  @override
  _StayState createState() => _StayState();
}

class _StayState extends State<Stay> {
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
              Tab(text: 'Hotels'),
              Tab(text: 'Budget Hotels'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title: const Text("Places To Stay",
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
                  title: 'Kampung Air (Water Chalet)',
                  imageUrl:
                      'assets/img/recommendation/accommodation/Kampung Air (Water Chalet).jpg',
                  location: 'Jalan Bukit Merah, Semanggol, 30000 Taiping',
                  contact: '+605-890 8888',
                ),
                ItemData(
                  title: 'The Haven Resort Hotel',
                  imageUrl:
                      'assets/img/recommendation/accommodation/The Haven Resort Hotel.jpg',
                  location:
                      'Location: Jalan Haven Persiaran Lembah Perpaduan Tambun, 31150 Ipoh, Perak',
                  contact: '+605-540 0000',
                ),
                ItemData(
                  title: 'The Banjaran Hotspring Retreat',
                  imageUrl:
                      'assets/img/recommendation/accommodation/The Banjaran Hotspring Retreat.jpg',
                  location:
                      'Location: 1, Persiaran Lagoon, Sunway 3, 31150 Ipoh, Perak',
                  contact: '+605-210 7777',
                ),
                // Add more top places to stay
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Homestay Bukit Merah Laketown',
                  imageUrl:
                      'assets/img/recommendation/accommodation/Homestay Bukit Merah Laketown.jpg',
                  location:
                      '1-0-3A Lakefront Villa, Jalan LakeTown, Bukit Merah Laketown Resort, 34400 Simpang Empat Semanggol, Perak',
                  contact: '+6019-327 8398',
                ),
                ItemData(
                  title: 'D’Rumah Bonda River View',
                  imageUrl:
                      'assets/img/recommendation/accommodation/D’Rumah Bonda River View.jpg',
                  location:
                      'Lot 1217, Jalan Sementa, Kampung Kuala Kenas, 33800 Kuala Kangsar, Perak',
                  contact: '+6019-222 3060',
                ),
                ItemData(
                  title: 'Homestay Gerik Banding',
                  imageUrl:
                      'assets/img/recommendation/accommodation/Homestay Gerik Banding.jpg',
                  location:
                      'No. 415, Jalan Baiduri 12, Taman Desa Baiduri, 33300 Gerik, Perak',
                  contact: '+6013-537 8990',
                ),
                // Add more hotels
              ],
            ),
           
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
