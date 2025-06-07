import 'package:flutter/material.dart';
import 'booking_screen.dart';

class EventDetailsScreen extends StatelessWidget {
  final Map<String, String> event;

  EventDetailsScreen({required this.event});

  String getElaborateDescription(String? name) {
    switch (name) {
      case 'Symphony Night':
        return "Symphony Night is a premium orchestral event where classical and contemporary compositions come alive. "
            "Attendees will witness live performances by accomplished musicians, featuring violins, cellos, and grand pianos. "
            "It's a sophisticated evening designed for those who appreciate the harmony of instrumental brilliance.";
      case 'Rhythm Revival':
        return "Rhythm Revival focuses on energetic percussion and dynamic rhythm-based performances. "
            "The event features live drummers, fusion bands, and upbeat acts that celebrate both traditional and modern rhythms. "
            "It's ideal for audiences who enjoy lively, pulse-pounding musical experiences.";
      case 'Echoes of Harmony':
        return "Echoes of Harmony brings together a blend of vocal ensembles and instrumental groups in perfect coordination. "
            "Expect to hear soul-stirring choral performances, acoustic harmonies, and synchronized melodies. "
            "This event is curated for those who value balance, melody, and the beauty of synchronized sound.";
      case 'Twilight Tunes':
        return "Twilight Tunes is an open-air, evening music event that transitions beautifully from sunset into night. "
            "Audiences will enjoy smooth acoustic sets, soft jazz, and light indie music under ambient lighting. "
            "This is the perfect choice for a calm and relaxing musical experience in a scenic setting.";
      case 'Moonlight Medleys':
        return "Moonlight Medleys offers a curated lineup of nostalgic hits and romantic tunes performed under the stars. "
            "Attendees can enjoy soft vocals, live instruments, and a mellow ambiance suited for a peaceful night out. "
            "Ideal for couples and groups looking to enjoy a laid-back musical journey.";
      case 'Vibe Voyage':
        return "Vibe Voyage is a multi-genre music fest that takes audiences through a global sound experience. "
            "From electronic beats to world music and pop-fusion, the event features high-energy acts and immersive lighting. "
            "Perfect for young audiences looking for variety, interaction, and a party atmosphere.";
      default:
        return "This event promises a well-curated musical experience tailored to entertain and engage all kinds of audiences.";
    }
  }

  Map<String, Map<String, String>> getEventDetails() {
    return {
      'Symphony Night': {
        'date': 'June 6, 2025',
        'time': '6:00 PM',
        'venue': 'NCPA, Mumbai',
      },
      'Rhythm Revival': {
        'date': 'June 9, 2025',
        'time': '7:00 PM',
        'venue': 'Siri Fort Auditorium, Delhi',
      },
      'Echoes of Harmony': {
        'date': 'June 13, 2025',
        'time': '8:00 PM',
        'venue': 'Chowdiah Memorial Hall, Bengaluru',
      },
      'Twilight Tunes': {
        'date': 'June 16, 2025',
        'time': '6:30 PM',
        'venue': 'Phoenix Marketcity, Chennai',
      },
      'Moonlight Medleys': {
        'date': 'June 21, 2025',
        'time': '7:00 PM',
        'venue': 'Shilpakala Vedika, Hyderabad',
      },
      'Vibe Voyage': {
        'date': 'June 26, 2025',
        'time': '7:00 PM',
        'venue': 'Rabindra Sadan, Kolkata',
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    String eventName = event['name'] ?? 'Event';
    final details = getEventDetails()[eventName];

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bXVzaWMlMjBuaWdodHxlbnwwfHwwfHx8MA%3D%3D',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40, bottom: 10),
                width: double.infinity,
                color: Colors.transparent,
                alignment: Alignment.center,
                child: Text(
                  eventName,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          event['image'] ?? '',
                          height: 250,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          getElaborateDescription(eventName),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      if (details != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, color: Colors.white70),
                                  SizedBox(width: 10),
                                  Text('Date: ${details['date']}',
                                      style: TextStyle(fontSize: 15, color: Colors.white)),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: Colors.white70),
                                  SizedBox(width: 10),
                                  Text('Time: ${details['time']}',
                                      style: TextStyle(fontSize: 15, color: Colors.white)),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.location_on, color: Colors.white70),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text('Venue: ${details['venue']}',
                                        style: TextStyle(fontSize: 15, color: Colors.white)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => BookingScreen()),
                            ),
                            child: Text("Book Ticket", style: TextStyle(color: Colors.black)),
                          ),
                          SizedBox(width: 20),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white),
                            ),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.white,
                                  content: Text("Added to Calendar!", style: TextStyle(color: Colors.black)),
                                ),
                              );
                            },
                            child: Text("Add to Calendar", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Back", style: TextStyle(color: Colors.white)),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
