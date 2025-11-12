import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peraktheguide/main.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';

class AboutPerak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("About Perak", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://www.klangvalley4locals.com.my/assets/img/highlights/about_kv2.jpg',
            ),
            SizedBox(height: 16),
            Text(
              'About Perak',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Perak, before independence, was thriving with tin mines and later rubber plantations. The state was the first to receive a British Resident. Historians say that Perak is a state that has gone through the Metal Age, the Neolithic Age and the Hoabinhian Age as relevant ancient artefacts seem to prove. And then, it encountered the Buddha/Hindu era, which is believed to have occurred at the same time as the rest of Malaya. The second-largest state in Peninsular Malaysia attracts many tourists regardless internally or internationally for its sandy beaches and extreme sports. With all that’s said, Perak’s one true crowning glory is its limestone hills which sets it apart from all the other states.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Perak is the second-largest state in Peninsular Malaysia in terms of land area. It is bounded to the north by Thai Yala Province and Kedah, to the east by Pahang and Kelantan, to the northwest by Penang, to the west by the Malacca Strait, and to the north by Selangor. Ipoh is the administrative capital of Perak and has a long history of excellence in tin mining. This lasted until the price of tin fell, which severely harmed the state's economy. That being said, Kuala Kangsar is still the royal capital, and the Palace of the Sultan of Perak is located here.",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class GetAround extends StatefulWidget {
  const GetAround({super.key});

  @override
  State<GetAround> createState() => _GetAroundState();
}

class _GetAroundState extends State<GetAround> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Getting Around Perak",
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList(), // This is where the images and text will be displayed.
    );
  }
}

class MyList extends StatelessWidget {
  final List<ItemData> items = [
    ItemData(
      'Mass Rapid Transit (MRT)',
      'assets/img/essentials/getaround/3.-ktm-komuter.png',
      'Just as how it is accessible from other states, travelling between the districts is possible by Malaysia’s train service, KTM.',
    ),
    ItemData(
      'Taxi',
      'assets/img/essentials/getaround/10.-taxi.png',
      'Taxis are ever available around the public areas such as malls, hotels, shops, and bus stations. Ask for an agreed fare or ensure it is a metered taxi before getting on o',
    ),
    ItemData(
      'E-hailing apps',
      'assets/img/essentials/getaround/e-hailing.png',
      'There is an increase of access to E-hailing transportations now in the major cities as well as the more rural areas. The most common will be Grab.',
    ),
  ];

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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      items[index].content,
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
}

class ItemData {
  final String text;
  final String imageUrl;
  final String content;

  ItemData(this.text, this.imageUrl, this.content);
}

class ItemData2 {
  final String text;
  final String imageUrl;
  final String content;
  final String goto;

  ItemData2(this.text, this.imageUrl, this.content, this.goto);
}

class TravelTips extends StatefulWidget {
  const TravelTips({super.key});

  @override
  State<TravelTips> createState() => _TravelTipsState();
}

class _TravelTipsState extends State<TravelTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text("Travel Tips", style: TextStyle(color: Colors.white)),
        // foregroundColor: const Color.fromARGB(255, 0, 71, 133),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList2(),
    );
  }
}

class MyList2 extends StatelessWidget {
  final List<ItemData2> items = [
    ItemData2(
      'Weather',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/weather.png',
      'The climate in Perak is quite humid all year-round. Anyone travelling to Perak must always be ready for rains at any time of the year. Regardless, the best time to visit Perak is from May-July or December-February.\nThe weather can be pretty hot between March - April. Due to the forest fires from Sumatera which typically happens between June - August, the dust particles may cast a haze over KL thus making it not an ideal time to visit the city.',
      'https://www.ventusky.com/',
    ),
    ItemData2(
      'Time Zone',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/timezone.png',
      'Standard Malaysian time is 8 hours ahead of GMT (GMT +8).Standard Malaysian time is 8 hours ahead of GMT (GMT +8).',
      'https://www.timeanddate.com/',
    ),
    ItemData2(
      'Currency',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/currency-code.png',
      'Malaysia’s currency unit is divided into two. The term Ringgit Malaysia (RM) is used to refer to paper money. The denominations are RM1, RM5, RM10, RM 20, RM 50 and RM100. Whereas the coins are referred to as sen (cents). The denominations are 5 sen, 10 sen, 20 sen and 50 sen.\n',
      'https://www.xe.com/',
    ),
    ItemData2(
      'Visa and Passport',
      'https://www.kltheguide.com.my/assets/img/highlights/traveltips/visa-and-passports.png',
      'Passports must be valid for at least 6 months at the time of entry. Visa requirements vary from time to time, so it is best to check with the Malaysian embassy or consulate or the Immigration Department website.',
      'https://www.imi.gov.my/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => _launchURL(items[index].goto),
          child: Card(
            elevation: 3.0, // Adjust the elevation as needed
            margin: const EdgeInsets.all(16.0), // Adjust the margin as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    items[index].imageUrl,
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                      16.0), // Adjust the padding as needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].text,
                        style: const TextStyle(
                          fontSize: 20.0, // Adjust the font size as needed
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                          height: 8.0), // Add spacing between title and content
                      Text(
                        items[index].content,
                        style: const TextStyle(
                            fontSize: 16.0), // Adjust the font size as needed
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PerakIcon extends StatefulWidget {
  const PerakIcon({super.key});

  @override
  State<PerakIcon> createState() => _PerakIconState();
}

class _PerakIconState extends State<PerakIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("11 Icons of Perak",
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList5(), // This is where the images and text will be displayed.
    );
  }
}

class MyList5 extends StatelessWidget {
  final List<ItemData5> items = [
    ItemData5(
      'Pangkor Island',
      'assets/img/essentials/iconsofperak/pulau pangkor.jpg',
      'A thriving small island in Perak, Pangkor Island is ever ready to welcome you with her crystal clear beaches. This pretty island is studded with many fishing villages. Though small, her town is always bustling and she will not fail to leave an impression on you with her international standard hotels. If you’re looking for a laid-back holiday, Pangkor Island has so much to offer.',
    ),
    ItemData5(
      'Royal Belum',
      'assets/img/essentials/iconsofperak/royal belum.jpg',
      'This may not be known to many people, but the Belum Temengor forest is one of the oldest rainforests in the world. It is estimated to be 130 million years old which makes it older than the Amazon and Congo forests. The forest is preserved and conserved as a State Park. The forest home to three species of Rafflesia, ten types of hornbills and endangered animals such as Malayan tigers and Tapirs.',
    ),
    ItemData5(
      'Ipoh',
      'assets/img/essentials/iconsofperak/ipoh.jpg',
      'When you drive up north, you will know immediately when you are about to reach Ipoh. How? Apart from the huge signage that screams ‘IPOH’, beautiful limestone hills will welcome you on both sides of the highway. These hills are one of the WOW-factors of Ipoh as you can find many cave temples in Ipoh. Famous temples are Kek Look Tong, Sam Poh Tong, and the Perak Tong. Adventure junkies often visit this town to indulge in to take part in extreme sports like rock climbing, boating and caving.',
    ),
    ItemData5(
      'The Royal Town of Kuala Kangsar',
      'assets/img/essentials/iconsofperak/kuala kangsar.jpg',
      'Heritage enthusiasts will fall in love with the Royal Town of Kuala Kangsar is nestled strategically at the crook of Perak River. This old town has a serene ambience and the well-preserved old places add to its charm. Attractions that are worth the mention include; The Royal Museum (Istana Kenangan), Galeri Sultan Azlan Shah, Ubudiah Mosque, Mariwasa Kraftangan (The ASEAN House).',
    ),
    ItemData5(
      'Tempurung Cave @ Gua Tempurung',
      'assets/img/essentials/iconsofperak/tempurung cave.jpg',
      'You may not be able to find another cave that’s so intricately designed by nature in Peninsular Malaysia like the Tempurung Cave. This 400 million-year-old cave has an expansive multidimensional honeycombed cave system which has a magnificent collection of stalactites and stalagmites. Other speleological wonders that can be spotted in this cave are the astounding rock formations which can only be found in this part of the world. Caving here isn’t trouble at all as guides are always available.',
    ),
    ItemData5(
      'Lenggong Valley UNESCO World Heritage Site',
      'assets/img/essentials/iconsofperak/Lenggong Valley.jpg',
      'The discovery of the oldest human, Perak Man in 2001 shows that civilisation began in Peninsular Malaysia more than 11,000 years ago. The discovery has landed Lenggong Valley on the global map, especially among history enthusiasts. On 30 June 2012, Lenggong Valley was recognised as a World Heritage Site by UNESCO.',
    ),
    ItemData5(
      'Taiping Zoo & Night Safari',
      'assets/img/essentials/iconsofperak/taiping zoo.jpg',
      'Located in the lushness of the Taiping Lake Gardens and adjacent to Larut Hill (Maxwell Hill), the Taiping Zoo and Night Safari is home to about 180 animal species. It is notable that the Taiping Zoo is the oldest zoo in Malaysia and the Night Safari is the first of its kind.',
    ),
    ItemData5(
      'Orang Utan Island, Bukit Merah',
      'assets/img/essentials/iconsofperak/orang utan island.jpg',
      'The Orang Utan Island is a research institution and sanctuary dedicated to the preservation and research of the Orang Utan. Situated within the Bukit Merah Laketown Resort enables visitors to interact closely with other animals. The sanctuary also has an 11-acre water park for those who love amusement parks.',
    ),
    ItemData5(
      'Matang Mangrove Forest Reserve',
      'assets/img/essentials/iconsofperak/matang mangrove forest.jpg',
      'If you love nature and don’t want to take in the world’s most sustainable mangrove ecosystem - you should pay a visit to Matang Mangrove park when you’re in Perak. Covering an area of more than 40,000 hectares it is also used as an eco-education centre. The park also features a unique boardwalk and you will also be able to chance upon the charcoal stove factories along the river of Kuala Sepetang.',
    ),
    ItemData5(
      'Sungai Klah Hot Springs',
      'assets/img/essentials/iconsofperak/Sungai Klah Hot Springs.jpg',
      'Located 200 meters above sea level at the foothills of the Titiwangsa Range, Sungai Klah Hot Spring is considered to be one of the best managed hot springs in Malaysia. Once you arrive here, you\'ll be astounded by the lush greenery, hills, streams and rivers that abound in the vicinity. The spring is another alternative to modern-day spa centres. Many believed that natural springs have healing properties that will help to heal and detoxify your body\'s toxic properties.',
    ),
    ItemData5(
      '7 Lata',
      'assets/img/essentials/iconsofperak/7lata.jpg',
      'The state of Perak is broken down into six district clusters. Each district cluster has its very own attraction points. Lata Buluh (Kampung Sungai Simpul), Lata Damak (Sungai Bayar), Lata Rambong (Teluk Mas), Lata Tebing Tinggi (Rantau Panjang), Lata Titi Dua (Jalan Sumpitan, Ijok), Lata Puteh (Ijok), and Lata Panggung (Ijok).',
    ),
  ];

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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      items[index].content,
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
}

class ItemData5 {
  final String text;
  final String imageUrl;
  final String content;

  ItemData5(this.text, this.imageUrl, this.content);
}

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Must Try Foods in Perak",
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 0, 71, 133),
        actions: const <Widget>[
          AppBarMore(),
        ],
      ),
      body: MyList6(), // This is where the images and text will be displayed.
    );
  }
}

class MyList6 extends StatelessWidget {
  final List<ItemData6> items = [
    ItemData6(
      'CHICKEN RICE AND BEAN SPROUTS',
      'assets/img/essentials/food/chicken rice.jpg',
      'If you haven’t heard of it yet, Perak produces one of the best bean sprouts in Malaysia. The bean sprouts are often thick and have a crunch to them. While the star is usually the chicken rice; in Perak, the bean sprouts steal the show.',
    ),
    ItemData6(
      'DIM SUM',
      'assets/img/essentials/food/dim sum.jpg',
      'Dim sum is a traditional Chinese meal consisting of small plates of dumplings and other snack dishes that are usually served with tea. The dim sum is usually filled with minced pork, chicken or prawns, and are steamed on bamboo baskets. You’ll also be served oyster and chilli sauce on the side to dip your dim sum in.',
    ),
    ItemData6(
      'KAYA PUFFS',
      'assets/img/essentials/food/puff.jpg',
      'Kaya puffs are a type of traditional Chinese pastry made with lard or shortening. They are made with two different doughs: an oil dough and a water dough. The flakiness of the puffs is achieved by laminating both doughs together.',
    ),
    ItemData6(
      'CHEE CHEONG FUN',
      'assets/img/essentials/food/chee cheong fun.jpg',
      'Believe it or not, This dish is famous in Perak. Ipoh’s chee cheong fun is more akin to Hong Kong style, with sauces and condiments drenched on top. Sweet sauce, onion oil, fried shallots, chilli paste, and sesame seeds are a few of the ingredients. The silky smooth and thin chee cheong fun has to be the highlight.',
    ),
    ItemData6(
      'NASI KANDAR AYAM MERAH',
      'assets/img/essentials/food/nasi kandar.jpg',
      'This nasi kandar stall is tucked away in Yong Suan coffee shop and frequently visited by locals and travellers. One of the highlights is the wide variety of dishes available at relatively low prices. Ask for “kuah campur banjir” for an extra kick; their gravy is what sets them apart from the competition. It’s truly addictive, and it’s unquestionably one of the best things to eat in Ipoh.',
    ),
  ];

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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index].text,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      items[index].content,
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
}

class ItemData6 {
  final String text;
  final String imageUrl;
  final String content;

  ItemData6(this.text, this.imageUrl, this.content);
}

class ApiData {
  final String title;
  final String content;
  final String image;
  final String location;

  ApiData({
    required this.location,
    required this.title,
    required this.content,
    required this.image,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      image: json['image'] ?? '',
      location: json['location'] ?? '',
    );
  }
}

class CardListWidget extends StatelessWidget {
  final List<ApiData> data;

  const CardListWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        final item = data[index];

        return GestureDetector(
          onTap: () {
            // print(item.location);
            if (item.location != '') {
              _launchURL(item.location);
            }
          },
          child: Card(
            elevation: 4.0,
            margin: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: item.image,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (item.title),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(item.content.replaceAll('\\n', '\n')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  final String image;
  final int index;

  const CardItem(
      {super.key,
      required this.name,
      required this.image,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover, // Make the image cover the entire card
              ),
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black
                    .withOpacity(0.5), // Adjust the opacity as needed
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _launchURL(url) async {
  var url2 = Uri.parse(url);
  if (await canLaunchUrl(url2)) {
    await launchUrl(url2, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
