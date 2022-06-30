import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/models/flags.dart';
import 'package:wedding/ui/decorations/decorations.dart';
import '../../models/constants.dart';
import '../../providers/providers.dart';



//to create a dependent field use set state in all the form and save values in another class
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: secondColor,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  '¿Nos Acompañas?',
                  style: GoogleFonts.sacramento(
                      fontSize: 80, fontWeight: FontWeight.bold),
                ),
                RegisterForm(),
              ],
            ),
          ),
        ));
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool visible = true;
  String selectedValue = "Si";
  String selectedValue2 = "Todo";

  displayParteEvento() {
    if (Flags.conf == 'Si') {
      setState(() {
        visible = false;
      });
    } else {
      setState(() {
        visible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final invitadosForm = InvitadosProvider();
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(90),
            child: Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: 'Sr/Sra./...', labelText: 'Nombre'),
                  onChanged: (value) => invitadosForm.nombre = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa algún dato';
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '+52....',
                    labelText: 'Número celular',
                  ),
                  onChanged: (value) => invitadosForm.telefono = value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa algún dato';
                    }
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text('¿Confirmas tu asistencia?'),
                ),
                const DropDownCustom(
                    options: ['Si', 'No'], variable: 'confirmacion'),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.topLeft,
                  child: const Text('¿En que momento nos acompañas?'),
                ),
                const DropDownCustom(
                        options: ['Todo', 'Misa', 'Comida', 'Baile', 'After'],
                        variable: 'evento'),
                const SizedBox(height: 10),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: '',
                    labelText: 'Notas',
                  ),
                  onChanged: (value) => invitadosForm.notas = value,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await invitadosForm.postData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Enviando datos, gracias',
                              style: TextStyle(color: Colors.black)),
                          backgroundColor: primaryColor,
                        ),
                      );
                    }
                  },
                  child: Text(invitadosForm.isLoading ? 'ESPERE' : 'CONFIRMAR',
                      style: const TextStyle(color: Colors.black)),
                ),
                /*MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    disabledColor: Colors.red,
                    elevation: 0,
                    color: Colors.black,
                    onPressed: invitadosForm.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();
                            if (!_formKey.currentState!.validate()) return;
                            //await invitadosForm.postData();
                          },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
                        child: Text(
                          invitadosForm.isLoading ? 'ESPERE' : 'CONFIRMAR',
                          style: const TextStyle(color: Colors.white),
                        )))*/
              ],
            ),
          ),
        ));
  }

  IconData getIcon(bool _isObscure) {
    return _isObscure ? Icons.visibility_off : Icons.visibility;
  }
}

class DropDownCustom extends StatefulWidget {
  final List<String> options;
  final String variable;

  const DropDownCustom(
      {super.key, required this.options, required this.variable});
  @override
  _DropDownCustom createState() => _DropDownCustom();
}

class _DropDownCustom extends State<DropDownCustom> {
  String? selectedValue;
  bool enabled = true;
  final invitadosForm = InvitadosProvider();
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: _createList(),
      disabledHint: const Text(''),
      hint: const Text("Elige una opción"),
      value: selectedValue,
      isExpanded: true,
      onChanged: enabled
          ? (String? value) => setState(() {
                selectedValue = value ?? "";
                if (widget.variable == 'confirmacion') {
                  Flags.conf = selectedValue!;
                  if (selectedValue == 'No') {
                    enabled == false;
                  }
                } else {
                  Flags.parteEv = selectedValue!;
                }
              })
          : null,
    );
  }

  List<DropdownMenuItem<String>> _createList() {
    return widget.options
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }
}
