import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ContactPage(),
    );
  }
}

class ContactPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      phoneNumber: '+1 (555) 987-6543',
      label: 'Home',
      status: 'Added 2mo ago',
      isVerified: true,
    ),
    Contact(
      phoneNumber: '+44 20 7123 4567',
      label: 'Work',
      status: 'Unverified',
      isVerified: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Secondary Numbers'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ContactCard(contact: contact);
        },
      ),
    );
  }
}

class Contact {
  final String phoneNumber;
  final String label;
  final String status;
  final bool isVerified;

  Contact({
    required this.phoneNumber,
    required this.label,
    required this.status,
    required this.isVerified,
  });
}

class ContactCard extends StatelessWidget {
  final Contact contact;

  ContactCard({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          contact.phoneNumber,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Text(
              '${contact.label} • ${contact.status}',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {},
            ),
          ],
        ),
        trailing: Icon(
          contact.isVerified ? Icons.check_circle : Icons.error,
          color: contact.isVerified ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
