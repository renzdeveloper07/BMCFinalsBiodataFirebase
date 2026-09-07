import 'package:flutter/material.dart';

void main() {
  runApp(MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// FIRST PAGE
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Portfolio"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Benablo, Renz Boy M.",
              style: TextStyle(
                fontSize: 99,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("BSIT"),
            Text("Global Reciprocal Colleges"),
            SizedBox(height: 70),
            ElevatedButton(
              child: Text("About Me"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AboutPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Me"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "About Me",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Hello I am a student on GRc who enjoys learning "
              "about technology and programming. "
              "I am interested in creating systems and "
              "improving my skills in Information Technology.",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text("My Skills"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SkillsPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class SkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Skills"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Skills",
              style: TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            Text("Skill 1: Front End Dev"),
            SizedBox(height: 35),
            Text("Skill 2: Hardware Dev"),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text("My Project"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ProjectPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class ProjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Project"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text(
                "My Project in SysArch",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25),
              Text(
                "TITLE",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Tondo Hospital Room patient management system",
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 25),
              Text(
                "ABSTRACT",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "The Tondo Hospital Room Patient Management System is a computerized system developed to improve the efficiency" 
                  "accuracy, and organization of patient and hospital room management. Manual processes in recording patient"
                  "information, assigning hospital rooms, monitoring room availability, and managing patient admissions"
                  "and discharges can be time-consuming and may lead to errors, misplaced records, and delays in accessing"
                  "important information. To address these challenges, the proposed system provides a centralized platform ",
            
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 60),
              ElevatedButton(
                child: Text("Contact Me"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ContactPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// FIFTH PAGE
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Me"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Contact Me",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 55),
            Text("Renz Marania"),
            SizedBox(height: 50),
            Text("Instagram: @Renz Marania"),
            SizedBox(height: 45),
            Text("Email: renzbenablogmail.com"),
            SizedBox(height: 40),
            ElevatedButton(
              child: Text("Back to Home"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}