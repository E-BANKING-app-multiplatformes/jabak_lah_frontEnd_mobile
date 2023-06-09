import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Données Bancaires'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 223, 221, 221),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0 ,vertical: 12.0) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First name : John ',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Last name : Doe',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Phone number : 0625986532',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Birth Date : 05/02/1960',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Email : email@gmail.com',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Numéro de compte : 1453699854212',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Solde : 1000 \$',
                style: TextStyle(fontSize: 20),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}