import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aplication_noticias/screens/login_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _lastName = '';
  String _name = '';
  String _phone = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadLastName();
  }

  Future<void> _loadLastName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final lastName = prefs.getString('userLastName');
    final name = prefs.getString('userName');
    final phone = prefs.getString('userPhone');
    setState(() {
      _lastName = lastName ?? '';
      _name = name ?? '';
      _phone = phone ?? '';
      _nameController.text = _name;
      _phoneController.text = _phone;
    });
  }

  Future<void> _saveLastName(String lastName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userLastName', lastName);
    setState(() {
      _lastName = lastName;
    });
  }

  Future<void> _saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    setState(() {
      _name = name;
    });
  }

  Future<void> _savePhone(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userPhone', phone);
    setState(() {
      _phone = phone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final prefs = snapshot.data!;
          final email = prefs.getString('userEmail');

          print('Datos recuperados: email=$email, lastName=$_lastName, name=$_name, phone=$_phone');

          if (email != null) {
            return Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        return Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.person),
                              title: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(labelText: 'Nombre'),
                                onChanged: (value) {
                                  setState(() {
                                    _name = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.person_outline),
                              title: TextField(
                                controller: TextEditingController(text: _lastName),
                                decoration: InputDecoration(labelText: 'Apellido'),
                                onChanged: (value) {
                                  setState(() {
                                    _lastName = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone),
                              title: TextField(
                                controller: _phoneController,
                                decoration: InputDecoration(labelText: 'Teléfono'),
                                onChanged: (value) {
                                  setState(() {
                                    _phone = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Correo: $email'),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        await _saveName(_name);
                        await _saveLastName(_lastName);
                        await _savePhone(_phone);
                      },
                      child: Text('Guardar'),
                    ),
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        await prefs.remove('userEmail');
                        await prefs.remove('userLastName');
                        await prefs.remove('userName');
                        await prefs.remove('userPhone');
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text('Cerrar Sesión'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Text('Inicia sesión para ver tu perfil.');
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}