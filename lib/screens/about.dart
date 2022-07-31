import "package:flutter/material.dart";

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height:20),
            Image.asset('assets/logo.png', width:80, height:80),
            const SizedBox(height:10),
            const Text("Kapaas",style: TextStyle(fontSize:32, fontWeight: FontWeight.bold)),
            // const Text("A BOUTIQUE DATABASE MANAGEMENT SYSYEM", style: TextStyle(fontSize:6),),
            const SizedBox(height:20),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: const Text(
                "Kapaas is a database management system designed for boutiques. Boutique personnel can keep record of all the customers, measurements, orders, employees, payments and so on. The app can also be used to keep track of the deadlines of  current orders. \nThis is a project for the subject Database Management System (DBMS) [CT XYZ].", 
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.justify,
              ),
            ),

            const SizedBox(height:20),
            const Text(" Project Members",
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
            ),
            const SizedBox(height:10),
            const Text(" Akanksha Giri (PUL076BEI004)",style: TextStyle(fontSize: 12)),const SizedBox(height:5),
            const Text("Ashmit Rajaure (PUL076BEI008)",style: TextStyle(fontSize: 12)),const SizedBox(height:5),
            const Text(" Bibek Pariyar (PUL076BEI012)",style: TextStyle(fontSize: 12)),const SizedBox(height:5),
            const Text("  Jeevan Koiri (PUL076BEI016)",style: TextStyle(fontSize: 12)),const SizedBox(height:5),
          ],
        ),
      ),
    );
  }
}