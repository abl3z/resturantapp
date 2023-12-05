import 'package:flutter/material.dart';
import 'edit_password.dart';
import 'package:resturantapp/information.dart';

User userInfo = User();

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
                color: Colors.amber,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Edit Profile Acc",
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
                  1,
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
                      value: userInfo.checkGender(User.getGender()),
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
                  2,
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
                  3,
                  "Enter Phone Number",
                  "+962",
                  phoneController,
                  (value) {
                    if (value!.isEmpty || value.length < 10) {
                      return "Please Enter Your Phone Number";
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Only Numbers';
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
                            setState(
                              () {
                                Navigator.pop(
                                  context,
                                  {
                                    User.setFullName(textController1.text),
                                    User.setGender(_selectedGender),
                                    User.setEmail(textController2.text),
                                    User.setPhoneNumber(textController3.text)
                                  },
                                );
                              },
                            );
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

TextEditingController textController1 =
    TextEditingController(text: User.getFullName());
TextEditingController textController2 =
    TextEditingController(text: User.getEmail());
TextEditingController textController3 =
    TextEditingController(text: User.getPhoneNumber());

Widget package(int num, String txt, String conTxt,
    TextEditingController controller, String? Function(String?)? validator) {
  if (num == 1) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            controller: textController1,
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
  if (num == 2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextFormField(
            controller: textController2,
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

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: TextFormField(
          controller: textController3,
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
