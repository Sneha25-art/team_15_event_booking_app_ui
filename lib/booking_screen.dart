import 'package:flutter/material.dart';
import 'dart:math';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  String? _selectedTickets;
  final List<String> _ticketOptions = ['1', '2', '3', '4', '5'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _showConfirmationDialog();
    }
  }

  void _showConfirmationDialog() {
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
    String name = _nameController.text.trim();
    String contact = _contactController.text.trim();
    String tickets = _selectedTickets!;
    String age = _ageController.text.trim();

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
            Text("🎂 Age: $age"),
            Text("🎟️ Number of Tickets: $tickets"),
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
        title: Text(
          "🔥🔥 It's Booking Time 🔥🔥",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1524368535928-5b5e00ddc76b?fm=jpg&q=60&w=3000',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.black)],
                  ),
                  child: Form(
                    key: _formKey,
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
                        TextFormField(
                          controller: _nameController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Enter Your Name',
                            icon: Icon(Icons.person),
                            iconColor: Colors.black,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your name';
                            }
                            if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
                              return 'Name can contain letters only';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Enter Your Age',
                            icon: Icon(Icons.cake),
                            iconColor: Colors.black,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your age';
                            }
                            int? age = int.tryParse(value);
                            if (age != null && age <= 18) {
                              return 'Please enter a valid age';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Icon(Icons.list, color: Colors.black),
                            SizedBox(width: 30),
                            Text(
                              "No. of Tickets ",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(width: 30),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black, width: 1.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: DropdownButton<String>(
                                value: _selectedTickets,
                                hint: Text("Select", style: TextStyle(color: Colors.grey)),
                                underline: SizedBox(),
                                items: _ticketOptions
                                    .map(
                                      (ticket) => DropdownMenuItem<String>(
                                        value: ticket,
                                        child: Text(
                                          ticket,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedTickets = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        if (_selectedTickets == null)
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "⚠️ Please select number of tickets",
                                style: TextStyle(color: Colors.red, fontSize: 12),
                              ),
                            ),
                          ),
                        SizedBox(height: 15),
                        TextFormField(
                          controller: _contactController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Enter Contact Number',
                            icon: Icon(Icons.call),
                            iconColor: Colors.black,
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your contact number';
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Enter a valid 10-digit number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_selectedTickets == null) {
                                setState(() {}); // Rebuild to show red warning
                              }
                              _submitForm();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            ),
                            child: Text(
                              "Book Now!",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
