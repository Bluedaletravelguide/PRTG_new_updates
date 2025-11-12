import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';

class Eat extends StatefulWidget {
  const Eat({super.key});

  @override
  _EatState createState() => _EatState();
}

class _EatState extends State<Eat> {
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
              Tab(text: 'Malay'),
              Tab(text: 'Chinese'),
              Tab(text: 'Indian'),
              Tab(text: 'Cafe'),
            ],
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontWeight: FontWeight.w800),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
          ),
          title: const Text("Places To Eat",
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
                  title: 'Restoran Tasik Raban, Lenggong',
                  imageUrl:
                      'assets/img/explore/kualakangsar/kualakangsar/Restoran Tasik Raban.jpg',
                  location: 'Location: 33400 Lenggong, Perak',
                  hours: '9.00am - 5.00pm (Daily)',
                  contact: '+6019-521 5657',
                ),
                ItemData(
                  title: 'Warung Nasi Talam, Lenggong',
                  imageUrl:
                      'assets/img/recommendation/pte/malay/NasiTalam.jpeg',
                  location: 'Kampung Batu Berdinding, 33400 Lenggong, Perak',
                  hours: '11.30am - 3.30pm (Sat-Thurs)/Closed on Friday',
                  contact: '+6017-567 4329',
                ),
                ItemData(
                  title: 'Castella Cafe, Gerik',
                  imageUrl:
                      'assets/img/recommendation/pte/malay/CastellaCafe.jpeg',
                  location: 'Kampung padang stang, 33310 Gerik, Perak',
                  hours: '10.00am - 5.00pm (Wed-Sun)/Closed on Monday',
                  contact: '+6011-2050 3454',
                ),
                // Add more top places to stay
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Ayam Garam Aun Kheng Lim',
                  imageUrl:
                      'assets/img/recommendation/pte/chinese/AyamGaram.jpeg',
                  location:
                      '75, Laluan Tasek Perdana, Medan Tasek Perdana, 30010 Ipoh, Perak',
                  hours: '11.00am - 5.30pm (Daily)',
                  contact: '+6012-533 4993',
                ),
                ItemData(
                  title: 'Restaurant Ayam Taugeh',
                  imageUrl:
                      'assets/img/recommendation/pte/chinese/AyamTaugeh.jpeg',
                  location: '849, Jalan Guntong, Guntong, 30100 Ipoh, Perak',
                  hours:
                      '5.00pm - 9.00am (Wed-Sun)/Closed on Monday and Tuesday',
                  contact: '+605-255 7469',
                ),
                ItemData(
                  title: 'Tong Sui Kai',
                  imageUrl:
                      'assets/img/recommendation/pte/chinese/TongSuiKai.jpeg',
                  location: 'Jalan Carey, Taman Jubilee, 30300 Ipoh, Perak',
                  hours: '6.00pm - 2.00am (Daily)',
                  contact: '',
                ),
                // Add more hotels
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Restoran Nasi Ganja (Yon Suan)',
                  imageUrl:
                      'assets/img/recommendation/pte/indian/YongSuan.jpeg',
                  location:
                      '2, Jalan Yang Kalsom, Taman Jubilee, 30300 Ipoh, Perak',
                  hours: '9.30am - 6.00pm (Daily)',
                  contact: '+605-254 4314',
                ),
                ItemData(
                  title: 'Restoran Samy',
                  imageUrl: 'assets/img/recommendation/pte/indian/Samy.jpeg',
                  location: '70, Jln Besar, 31200 Chemor, Perak',
                  hours: '7.00 am -7.00 pm (Daily)',
                  contact: '+605-201 4066',
                ),
                ItemData(
                  title: 'Sri Ananda Bahwan Restaurant',
                  imageUrl:
                      'assets/img/recommendation/pte/indian/SriAnandaBahwan.jpeg',
                  location: '7, Persiaran Bandar Timah, 31650 Ipoh, Perak',
                  hours: '7.00 am - 11.30 pm (Daily)',
                  contact: '+605-253 9798',
                ),
                // Add more hotels
              ],
            ),
            MyList2(
              items: [
                ItemData(
                  title: 'Little Ipoh Cafe',
                  imageUrl:
                      'assets/img/recommendation/pte/cafe/LittleIpoh.jpeg',
                  location:
                      '21, Jalan PP 1, Bandar Universiti Lakeville, 32610 Seri Iskandar, Perak',
                  hours: '7.00am - 5.00pm (Daily)',
                  contact: '+605-373 1478',
                ),
                ItemData(
                  title: 'Asow Eatery Canteen',
                  imageUrl:
                      'assets/img/recommendation/pte/cafe/AsowEatery.jpeg',
                  location:
                      '187a, Jalan Sultan Iskandar, Taman Jubilee, 31650 Ipoh, Perakk',
                  hours: '10.00am - 10.00pm (Daily)',
                  contact: '+6016-277 3755',
                ),
                ItemData(
                  title: 'Konda Kondi Cafe & Bistro',
                  imageUrl:
                      'assets/img/recommendation/pte/cafe/KondaKondi.jpeg',
                  location:
                      '183, Jalan Sultan Idris Shah, Taman Jubilee, 30000 Ipoh, Perak',
                  hours:
                      '5.00pm - 12.00am (Mon, Wed, Thurs)/5.00pm - 12.30am (Fri)/1.00pm - 12.30am (Sat-Sun)/Closed on Tuesday',
                  contact: '+6016-492 9660',
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
                      'Operating Hours: ${items[index].hours}',
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
  final String hours;
  final String contact;

  ItemData({
    required this.title,
    required this.imageUrl,
    required this.location,
    required this.hours,
    required this.contact,
  });
}
