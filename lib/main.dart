import 'package:flutter/material.dart';
import 'event_details.dart'; 
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: EventsScreen(),
  ));
}

class EventsScreen extends StatefulWidget {
  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final List<Map<String, String>> events = [
    {
      "name": "Symphony Night",
      "date": "June 6, 2025",
      "location": "Mumbai",
      "image": "https://images.unsplash.com/photo-1590377894621-65093facaef0?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8b3JjaGVzdHJhfGVufDB8fDB8fHww",
      "description": "Let the strings speak as melodies rain on your soul."
    },
    {
      "name": "Rhythm Revival",
      "date": "June 9, 2025",
      "location": "Delhi",
      "image": "https://images.unsplash.com/photo-1507676184212-d03ab07a01bf?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fG11c2ljJTIwZXZlbnR8ZW58MHx8MHx8fDA%3D",
      "description": "Beat drops, heart stops — rhythm resurrects the night."
    },
    {
      "name": "Echoes of Harmony",
      "date": "June 13, 2025",
      "location": "Bengaluru",
      "image": "https://plus.unsplash.com/premium_photo-1664303108327-24d2b03b2134?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y29uY2VydHN8ZW58MHx8MHx8fDA%3D",
      "description": "A journey through waves of soothing symphonies."
    },
    {
      "name": "Twilight Tunes",
      "date": "June 16, 2025",
      "location": "Chennai",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjVTnhhHMPEteuYKOuxGAej8WA0duYYosI4w&s",
      "description": "As the sun sets, the music begins to rise."
    },
    {
      "name": "Moonlight Medleys",
      "date": "June 21, 2025",
      "location": "Hyderabad",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTc7pt1Cx_uuSuNOJJxKZi6sW1GroLpjo4mA&s",
      "description": "Under moonlight, each note finds a heartbeat."
    },
    {
      "name": "Vibe Voyage",
      "date": "June 26, 2025",
      "location": "Kolkata",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs7ZalDOGWN_o4Yv4wl1vnw2FU8IX0_GPIbQ&s",
      "description": "A musical odyssey to where dreams dance."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("🎵Where Words Fail, Music Speaks🎵"),
        centerTitle: true,
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://images.unsplash.com/photo-1499364615650-ec38552f4f34?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fG11c2ljJTIwY29uY2VydHxlbnwwfHwwfHx8MA%3D%3D',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, delightful user !!!\nWelcome to MelodyFest !!\n\nExperience the perfect blend of serenity and excitement, here 👇🏾.\n",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(" ♫♫ Dive into the rhythm of twilight...\nLet the night sing to your soul ♫♫ ",
                    style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic,color: Colors.amberAccent)),
                SizedBox(height: 20),
                Text("Upcoming Events",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600,color: Colors.white)),
                SizedBox(height: 12),
                Column(
                  children: events.map((event) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EventDetailsScreen(event: event),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.grey.shade900,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.network(
                                  event['image']!,
                                  height: 180,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(event['name']!,
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.grey)),
                                    SizedBox(height: 4),
                                    Text(
                                      "${event['date']} | 6:00 PM - 10:00 PM",
                                      style: TextStyle(color: Colors.grey[400]),
                                    ),
                                    Text(event['location']!,
                                        style: TextStyle(color: Colors.grey[400])),
                                    SizedBox(height: 6),
                                    Text(event['description']!,
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
