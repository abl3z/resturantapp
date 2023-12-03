import 'package:flutter/material.dart';
import 'edit_password.dart';

void main() {
  runApp(MaterialApp(home: editProfile()));
}

int _selectedGender = 0;

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(255, 247, 233, 1),
        appBar: AppBar(
          toolbarHeight: 65,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(255, 247, 233, 1),
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Color.fromRGBO(23, 70, 162, 1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.person,
                size: 38,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Edit Profile Account",
                style: TextStyle(
                    color: Color.fromRGBO(255, 247, 233, 1),
                    fontFamily: 'Pacifico',
                    fontSize: 30),
              ),
            ],
          ),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                package(
                  "FullName",
                  "Enter Your Full Name",
                  fullNameController,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Full Name";
                    }
                    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                      return 'Only Alphabetical Characters Allowed';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Gender : ",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    DropdownButton<int>(
                      value: _selectedGender,
                      onChanged: (newGender) {
                        setState(() {
                          if (newGender == 0) {
                            _selectedGender = 0;
                          } else {
                            _selectedGender = 1;
                          }
                        });
                      },
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            'Male',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            'Female',
                            style: TextStyle(color: Colors.pinkAccent),
                          ),
                          value: 1,
                        ),
                      ],
                    )
                  ],
                ),
                package(
                  "Enter Your Email",
                  "example@gmail.com",
                  emailController,
                  (value) {
                    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value!)) {
                      return 'Please Enter a Valid Email Address';
                    }
                    return null;
                  },
                ),
                package(
                  "Enter Phone Number",
                  "+962",
                  phoneController,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Phone Number";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Only Numeric Characters Allowed';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => editPass(),
                            ),
                          );
                        },
                        child: Text(
                          "Edit password",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget package(String txt, String conTxt, TextEditingController controller,
    String? Function(String?)? validator) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        // height: 50,
        // width: 350,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: txt,
            hintText: conTxt,
            //TODO Change name
            errorStyle: TextStyle(color: Colors.red),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromRGBO(23, 70, 162, 1), width: 1),
              // borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    ],
  );
}
