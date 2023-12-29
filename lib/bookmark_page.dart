import 'package:flutter/material.dart';
import 'profile.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  int _currentIndex = 1; // Indeks untuk menentukan halaman aktif

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text('TRENDING', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20), // Mengatur radius melengkung
            ),
          ),
          backgroundColor: Colors.blue[900],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BookmarkListWidget(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex =
                  index; // Update indeks saat pengguna mengetuk menu
            });
            if (index == 0) {
              // Navigate to Home page
              Navigator.popUntil(context, (route) => route.isFirst);
            } else if (index == 1) {
              //
            } else if (index == 2) {
              // Navigate to Profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilePage(),
                ),
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Trending',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Profile',
            ),
          ],
          backgroundColor: Colors.blue.shade900,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 111, 209, 255),
        ));
  }
}

class BookmarkListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> books = [
      "1. Nightbooks",
      "2. What Moves the Dead",
      "3. Soul Lanterns",
      "4. Ottilie Colter and the Narroway Hunt",
      "5. The Bewitching of Aveline Jones",
      "6. Nobody Knows But You",
      "7. Her Radiant Curse (Legends of Lor'yan)",
      "8. The Outsider",
      "9. Thorn",
      "10. XOXO",
      "11. The Mermaid, the Witch, and the Sea",
      "12. Peter Pan in Wonderland",
      "13. Dead Voices",
      "14. The Strange Case",
      "15. The Truth Lies Here",
      "16. Spookily Yours",
      "17. Frankenstein"
    ];

    final List<String> penulis = [
      "Jennys never had much time for boys, K-pop, or really anything besides her dream of being a professional cellist.... \n By AXIE OH",
      "Channi was not born a monster. But when her own father offers her in sacrifice to the Demon Witch, she is forever changed.\nBy Elizabeth Lim",
      "In a world divided by colonialism and threaded with magic, a desperate orphan turned pirate and a rebellious imperial lady find a connection on the high seas.\nBy Meggie Tokuda-Hall",
      "My cat is a demon.\n No, thats not a joke. An actual, real life demon. And he needs my help to break a curse.But what happens when that turns into more? \nBy Anica Mrose Rissi",
      "A boy is imprisoned by a witch and must tell her a new scary story each night to stay alive. This thrilling contemporary fantasy from J. A. White...\nBy J.A. White",
      "At a local amusement park called Wonderland, Peter has a chance encounter with his fencing rival, Jillian Hook. ......\nBy Jeni Conrad",
      "Twelve-year-old Nozomi lives in the Japanese city of Hiroshima. She wasn't even born when the bombing of Hiroshima took place. ....\nBy Shaw Kuzki",
      "Hunted meets The Wrath and the Dawn in this bold fairytale retelling—where court intrigue, false identities, and dark secrets will thrill fans of classic and contemporary fantasy alike.....\nBy Intisar Khanani",
      "Based on some of literatures horror and science fiction classics, this “tour de force of reclaiming the narrative, executed with impressive wit and insight......\nBy Theodora Goss",
      "In small town Michigan, Penny Hardjoy, an aspiring journalist, teams up with the nerdy boy next door and the towns star.......\nBy Lindsey Klingele",
      "Few creatures of horror have seized readers' imaginations and held them for so long as the anguished monster of Mary Shelley's Frankenstein. ....\nBy Mary Shelley",
      "An unspeakable crime. A confounding investigation. At a time when the King brand has never been stronger, he has delivered one of his most unsettling and compulsively listenable stories. ... \nBy Stephen King",
      "What they find there is a nightmare of fungal growths and possessed wildlife, surrounding a dark, pulsing lake. Madeline sleepwalks and speaks in strange voices at night .... \nBy T. Kingfisher",
      "Aveline Jones loves all things spooky, so is delighted when her mother rents a holiday cottage that overlooks an ancient stone circle, known locally as the Witch Stones. ......\nBy Phil Hickes",
      "Ottilie Colter and her brother, Gully, have always fended for themselves. So when Gully goes missing one night, Ottilie sets out to find him—and soon makes a horrible discovery. ...\nBy Rhiannon Williams",
      "New York Times bestselling author Katherine Arden returns with another creepy, spine-tingling adventure in the critically acclaimed Small Spaces Quartet. Now in paperback...\nBy Katherine Arden",
      "For fans of Amulet and middle grade readers who love sweeping worlds like Star Wars, the first book of the Lightfall series introduces Bea and Cad, two unlikely friends who get ... \nBy Tim Pobert",
    ];

    // final List<String> image = [
    //   'lib/image/xoxo.jpg',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    //   'lib/image/paw.png',
    // ];

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: books.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 9.0),
                padding: EdgeInsets.all(5.0),
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Center(
                    child: Text(
                      books[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
