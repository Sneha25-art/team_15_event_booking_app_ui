import 'package:flutter/material.dart';
import 'dart:math';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  String _selectedTickets = '1';
  final List<String> _ticketOptions = ['1', '2', '3', '4', '5'];

  void _submitForm() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "✨Booking Confirmed!✨",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          "Your journey to the unforgettable event has just begun. "
          "Get ready for magic, memories, and more!",
        ),
        actions: [
          TextButton(
            onPressed: _showDetails,
            child: Text(
              "See Details",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDetails() {
    String name = _nameController.text;
    String contact = _contactController.text;
    String tickets = _selectedTickets;
    int bookingId = Random().nextInt(900000) + 100000;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Your Booking Details"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("🆔 Booking ID: $bookingId"),
            Text("👤 Name: $name"),
            Text("🎟️ Number of people : $tickets"),
            Text("📞 Phone: $contact"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              
              child: Text(
                "🔥🔥 It's Booking Time 🔥🔥",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(width: 8),
            
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bXVzaWMlMjBwYXJ0eXxlbnwwfHwwfHx8MA%3D%3D',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black)],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "🎭 Step into the spotlight! Enter your details below to book your grand experience 🎭",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            controller: _nameController,
                             style: TextStyle(
                              color: Colors.black,),
                              
                              decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              floatingLabelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              labelText: 'Enter Your Name',
                              icon: Icon(Icons.person_2_rounded),
                              iconColor: Colors.black,
                              border: OutlineInputBorder(),
                            ),
                          ),

                          SizedBox(height: 15),

                          Row(
                            children: [
                              IconTheme(
                                data: IconThemeData(color: Colors.black),
                                child: Icon(Icons.list_rounded),
                              ),
                              SizedBox(width: 30),
                              Text(
                                "No. of Tickets ",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(width: 30),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: DropdownButton<String>(
                                  value: _selectedTickets,
                                  underline: SizedBox(),
                                  items: _ticketOptions
                                      .map(
                                        (ticket) => DropdownMenuItem<String>(
                                          value: ticket,
                                          child: Text(
                                            ticket,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedTickets = value!;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          TextField(
                            controller: _contactController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              color: Colors.black,
                            ), 
                            decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              icon: Icon(Icons.call),
                              iconColor: Colors.black,
                              labelText: 'Enter Contact Number',
                              prefixStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(),
                            ),
                          ),

                          SizedBox(height: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 15,
                                ),
                              ),
                              child: Text(
                                "Book Now!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
