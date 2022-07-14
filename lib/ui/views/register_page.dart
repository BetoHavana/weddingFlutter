import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/models/flags.dart';
import 'package:wedding/ui/decorations/decorations.dart';
import 'package:wedding/ui/widgets/widgets.dart';
import 'package:wedding/ui/widgets/wp_button.dart';
import '../../models/constants.dart';
import '../../providers/providers.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        color: secondColor,
        child: Column(
          children: [
            SizedBox(height: 50),
            FittedBox(
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '¿Nos Acompañas?',
                      style: titles,
                    ))),
            /*Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                          'Puedes enviarnos un mensaje vía formulario o vía WhatsApp',
                          style: GoogleFonts.kalam(
                              fontSize: 20, color: Colors.black)))),
                             Container(
            child:  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: formsWeb(width),
            ),
           )*/
            SizedBox(
              height: 30,
            ),
            CardContainer(
              child: Column(
                children: [
                  Center(
                      child: WPButton(
                          msg: 'Confirmar con Emmanuel',
                          numero: '524425255902')),
                  Center(
                      child: WPButton(
                    msg: 'Confirmar con Brenda    ',
                    numero: '524426210255',
                  ))
                ],
              ),
            )
          ],
        ));
  }

  Widget formsMobile(double width) {
    return Column(
      children: [
        Container(
          width: width / 2,
          child: RegisterForm(),
        ),
        WPButton(msg: 'Confirmar con Emmanuel', numero: '524425255902'),
        WPButton(
          msg: 'Confirmar con Brenda',
          numero: '524426210255',
        )
      ],
    );
  }

  Widget formsWeb(double width) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: width / 2,
              child: RegisterForm(),
            )
          ],
        ),
        Column(
          children: [
            WPButton(msg: 'Confirmar con Emmanuel', numero: '524425255902'),
            WPButton(
              msg: 'Confirmar con Brenda',
              numero: '524426210255',
            )
          ],
        ),
      ],
    );
  }
}

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final invitadosForm = InvitadosProvider();
    final _formKey = GlobalKey<FormState>();
    return Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: CardContainer(
                child: Column(
                  children: [
                    TextFormField(
                      style:
                          GoogleFonts.kalam(fontSize: 16, color: Colors.black),
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
                      style:
                          GoogleFonts.kalam(fontSize: 16, color: Colors.black),
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
                    DropDowns(),
                    TextFormField(
                      style:
                          GoogleFonts.kalam(fontSize: 16, color: Colors.black),
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
                            SnackBar(
                              content: Text('Enviando datos, gracias',
                                  style: GoogleFonts.kalam(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              backgroundColor: primaryColor,
                            ),
                          );
                        }
                      },
                      child: Text(
                          invitadosForm.isLoading ? 'Espere' : 'Confirmar',
                          style: GoogleFonts.kalam(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                  ],
                ),
              )),
        ));
  }

  IconData getIcon(bool _isObscure) {
    return _isObscure ? Icons.visibility_off : Icons.visibility;
  }
}

class DropDowns extends StatefulWidget {
  DropDowns({Key? key}) : super(key: key);

  @override
  State<DropDowns> createState() => _DropDownsState();
}

class _DropDownsState extends State<DropDowns> {
  String? selectedValue;
  String? selectedValue2;
  bool enabled = true;

  displayParteEvento() {
    if (Flags.conf == 'Si') {
      setState(() {
        enabled = true;
      });
    } else {
      setState(() {
        enabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.topLeft,
          child: Text('¿Confirmas tu asistencia?',
              style: GoogleFonts.kalam(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ),
        DropdownButton(
          items: _createList(['Si', 'No']),
          hint: Text("Elige una opción",
              style: GoogleFonts.kalam(fontSize: 16, color: Colors.black)),
          value: selectedValue,
          isExpanded: true,
          onChanged: (String? value) => setState(() {
            selectedValue = value ?? "";
            Flags.conf = selectedValue!;
            displayParteEvento();
          }),
        ),
        const SizedBox(height: 10),
        enabled
            ? Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text('¿En que momento nos acompañas?',
                        style: GoogleFonts.kalam(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                  DropdownButton(
                      items: _createList(
                          ['Todo', 'Misa', 'Comida', 'Baile', 'After']),
                      hint: Text("Elige una opción",
                          style: GoogleFonts.kalam(
                              fontSize: 16, color: Colors.black)),
                      value: selectedValue2,
                      isExpanded: true,
                      onChanged: (String? value) => setState(() {
                            selectedValue2 = value ?? "";
                            Flags.parteEv = selectedValue!;
                          })),
                  const SizedBox(height: 10),
                ],
              )
            : Container(),
      ],
    );
  }

  List<DropdownMenuItem<String>> _createList(List<String> options) {
    return options
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(
              e,
              style: GoogleFonts.kalam(fontSize: 16, color: Colors.black),
            ),
          ),
        )
        .toList();
  }
}
