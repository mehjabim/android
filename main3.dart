 import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormPractice(),
    );
  }
}

class FormPractice extends StatefulWidget {
  @override
  _FormPracticeState createState() => _FormPracticeState();
}

class _FormPracticeState extends State<FormPractice> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController rollController = TextEditingController();
  TextEditingController regNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController aboutMeController = TextEditingController();

  String? selectedBloodGroup;
  String? selectedGender;

  String submittedData = '';

  void _resetForm() {
    nameController.clear();
    rollController.clear();
    regNumberController.clear();
    phoneController.clear();
    aboutMeController.clear();
    setState(() {
      selectedBloodGroup = null;
      selectedGender = null;
      submittedData = '';
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        submittedData = '''
        Name: ${nameController.text}
        Roll: ${rollController.text}
        Registration Number: ${regNumberController.text}
        Blood Group: $selectedBloodGroup
        Gender: $selectedGender
        Phone Number: ${phoneController.text}
        About Me: ${aboutMeController.text}
        ''';
      });
      _resetForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Practice 01")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: rollController,
                        decoration: InputDecoration(labelText: "Roll"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter roll number';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: regNumberController,
                        decoration: InputDecoration(labelText: "Registration Number"),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter registration number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                DropdownButtonFormField<String>(
                  value: selectedBloodGroup,
                  decoration: InputDecoration(labelText: "Blood Group"),
                  items: ['A', 'B', 'O', 'AB'].map((group) {
                    return DropdownMenuItem(
                      value: group,
 child: Text(group),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBloodGroup = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select blood group';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: Text("Male"),
                        leading: Radio<String>(
                          value: "Male",
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text("Female"),
                        leading: Radio<String>(
                          value: "Female",
                          groupValue: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Phone Number"),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: aboutMeController,
                  decoration: InputDecoration(labelText: "About Me"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter something about yourself';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text("Submit"),
                  ),
                ),
                if (submittedData.isNotEmpty) ...[
                  SizedBox(height: 20),
                  Text(
                    "Submitted Data:\n$submittedData",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
