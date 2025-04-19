import 'package:flutter/material.dart';

import '../Models/MemberModelDTO.dart';
import '../Models/SchoolNewsDTO.dart';
import '../service/NewSchoolService.dart';
import 'LoginSchool.dart';

class RegisterSchoolPage extends StatefulWidget {
  const RegisterSchoolPage({super.key});

  @override
  State<RegisterSchoolPage> createState() => _RegisterSchoolPageState();
}

class _RegisterSchoolPageState extends State<RegisterSchoolPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController schoolNameController = TextEditingController();
  final TextEditingController schoolPhoneController = TextEditingController();
  final TextEditingController schoolEnderecoController =
      TextEditingController();

  final TextEditingController mName = TextEditingController();
  final TextEditingController mEmail = TextEditingController();
  final TextEditingController mPassword = TextEditingController();
  final TextEditingController mImage = TextEditingController();

  String schoolType = 'Public';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        title: const Text('Initial Configuration'),
        backgroundColor: const Color(0xFFC2185B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'School Data',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: schoolNameController,
                decoration: const InputDecoration(
                  labelText: 'Name of School',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome da escola é obrigatório';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: schoolPhoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone of School',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Telefone da escola é obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: schoolEnderecoController,
                decoration: const InputDecoration(
                  labelText: 'Endereco of School',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Endereço da escola é obrigatório';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),
              const Text(
                'Administrator Data',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF212121),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: mName,
                decoration: const InputDecoration(
                  labelText: 'Administrator Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome do administrador é obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: mEmail,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email é obrigatório';
                  }

                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                  ).hasMatch(value)) {
                    return 'Email inválido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: mPassword,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Senha é obrigatória';
                  }
                  if (value.length < 6) {
                    return 'Senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC2185B),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final admin = MemberModeDTO(
                      name: mName.text,
                      email: mEmail.text,
                      passWord: mPassword.text,
                      image: '',
                    );

                    final school = SchoolNewsDTO(
                      schoolName: schoolNameController.text,
                      schoolPhone: schoolPhoneController.text,
                      schoolEndereco: schoolType,
                      memberMode: admin,
                    );

                    print(school.toString());

                    var response = await enviarNoticia(school);

                    if (response != null && response != 'erro') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Loginschool()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Erro ao criar escola. Verifique os dados e tente novamente.',
                          ),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  }
                },

                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void isEmpty(String text) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          ' ${text} esta vazio. ',
          style: TextStyle(color: Color(0xff060708)),
        ),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
