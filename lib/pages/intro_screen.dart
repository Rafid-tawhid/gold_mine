import 'package:flutter/material.dart';
import 'package:gold_mine/helper_functions/constants.dart';

class AbsoluteZeroProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Absolute Zero IT"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo and Title Section
            Center(
              child: Column(
                children: [
                  Image.network(
                    'https://i1.sndcdn.com/artworks-000624321037-0amb7b-t500x500.jpg', // Placeholder for logo
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Absolute Zero IT",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Your Trusted Digital Growth Partner",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Services Section
            const Text(
              "Our Services",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ServiceCard(
              title: "Web Development",
              description:
              "High-quality web solutions to grow your business.",
              icon: Icons.web,
            ),
            ServiceCard(
              title: "UI/UX Design",
              description: "Creating intuitive and engaging user experiences.",
              icon: Icons.design_services,
            ),
            ServiceCard(
              title: "E-Commerce Solutions",
              description:
              "End-to-end solutions for your online business needs.",
              icon: Icons.shopping_cart,
            ),
            ServiceCard(
              title: "Digital Marketing",
              description: "Boost your digital presence and reach new customers.",
              icon: Icons.mark_email_read,
            ),
            SizedBox(height: 20),

            // Contact Section
            Text(
              "Contact Us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContactButton(icon: Icons.email, label: "Email"),
                ContactButton(icon: Icons.phone, label: "Call"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  ServiceCard({required this.title, required this.description, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, size: 40, color: myColor.primary),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;

  ContactButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(

      onPressed: () {},
      icon: Icon(icon),
      label: Text(label,),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
    );
  }
}
