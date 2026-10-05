import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  String gender = 'Male';
  String civilStatus = 'Single';
  String education = 'College';

  bool isSaving = false;

  // SAVE TO FIREBASE
  Future<void> saveBiodata() async {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your full name.'),
        ),
      );
      return;
    }

    setState(() {
      isSaving = true;
    });

    try {
      await FirebaseFirestore.instance.collection('students').add({
        'name': nameController.text.trim(),
        'birthday': birthdayController.text.trim(),
        'age': ageController.text.trim(),
        'gender': gender,
        'civilStatus': civilStatus,
        'occupation': occupationController.text.trim(),
        'address': addressController.text.trim(),
        'phone': phoneController.text.trim(),
        'email': emailController.text.trim(),
        'education': education,
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;

      setState(() {
        isSaving = false;
      });

      // SUCCESS MESSAGE
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text(
              'Biodata successfully saved to Firebase!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      // CLEAR FORM
      nameController.clear();
      birthdayController.clear();
      ageController.clear();
      addressController.clear();
      phoneController.clear();
      emailController.clear();
      occupationController.clear();

      setState(() {
        gender = 'Male';
        civilStatus = 'Single';
        education = 'College';
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isSaving = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save data: $e'),
        ),
      );
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    birthdayController.dispose();
    ageController.dispose();
    addressController.dispose();
    phoneController.dispose();
    emailController.dispose();
    occupationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Text(
                'PERSONAL INFORMATION',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // FULL NAME
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            // BIRTHDAY
            TextField(
              controller: birthdayController,
              decoration: const InputDecoration(
                labelText: 'Birthday',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cake),
                hintText: 'MM/DD/YYYY',
              ),
            ),

            const SizedBox(height: 15),

            // AGE
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Age',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),

            const SizedBox(height: 15),

            // GENDER
            const Text(
              'Gender',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Table(
              border: TableBorder.all(
                color: Colors.grey,
              ),
              children: [
                TableRow(
                  children: [

                    // MALE
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'Male';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        color: gender == 'Male'
                            ? Colors.blue.shade100
                            : Colors.white,
                        child: const Center(
                          child: Text(
                            'MALE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // FEMALE
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          gender = 'Female';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        color: gender == 'Female'
                            ? Colors.blue.shade100
                            : Colors.white,
                        child: const Center(
                          child: Text(
                            'FEMALE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 15),

            // CIVIL STATUS
            DropdownButtonFormField<String>(
              value: civilStatus,
              decoration: const InputDecoration(
                labelText: 'Civil Status',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.people),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Single',
                  child: Text('Single'),
                ),
                DropdownMenuItem(
                  value: 'Married',
                  child: Text('Married'),
                ),
                DropdownMenuItem(
                  value: 'Widowed',
                  child: Text('Widowed'),
                ),
                DropdownMenuItem(
                  value: 'Separated',
                  child: Text('Separated'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  civilStatus = value!;
                });
              },
            ),

            const SizedBox(height: 15),

            // OCCUPATION
            TextField(
              controller: occupationController,
              decoration: const InputDecoration(
                labelText: 'Occupation',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
              ),
            ),

            const SizedBox(height: 15),

            // ADDRESS
            TextField(
              controller: addressController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.home),
              ),
            ),

            const SizedBox(height: 15),

            // PHONE
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),

            const SizedBox(height: 15),

            // EMAIL
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 15),

            // EDUCATION
            DropdownButtonFormField<String>(
              value: education,
              decoration: const InputDecoration(
                labelText: 'Educational Attainment',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.school),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Elementary',
                  child: Text('Elementary'),
                ),
                DropdownMenuItem(
                  value: 'High School',
                  child: Text('High School'),
                ),
                DropdownMenuItem(
                  value: 'Senior High School',
                  child: Text('Senior High School'),
                ),
                DropdownMenuItem(
                  value: 'College',
                  child: Text('College'),
                ),
                DropdownMenuItem(
                  value: 'Postgraduate',
                  child: Text('Postgraduate'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  education = value!;
                });
              },
            ),

            const SizedBox(height: 25),

            // SUBMIT BUTTON
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isSaving ? null : saveBiodata,
                child: isSaving
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'SUBMIT BIODATA',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}