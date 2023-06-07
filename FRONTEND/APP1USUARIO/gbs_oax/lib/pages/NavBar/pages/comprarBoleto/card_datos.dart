import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

var nombreController = TextEditingController();
var emailController = TextEditingController();

GlobalKey<FormState> keyForm = GlobalKey();

class Card_Boleto extends StatefulWidget {
  final asiento;
  const Card_Boleto({super.key, this.asiento});

  @override
  State<Card_Boleto> createState() => _Card_Boleto();
}

class _Card_Boleto extends State<Card_Boleto> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(3.5),
            child: SizedBox(
                width: 250,
                height: 300,
                child: ReactiveForm(
                    formGroup: FormGroup({
                      'name': FormControl<String>(
                          validators: [Validators.required]),
                      'email':
                          FormControl<String>(validators: [Validators.required])
                    }),
                    child: Card(
                        clipBehavior: Clip.hardEdge,
                        elevation: 5,
                        color: Colors.grey.shade900,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        shadowColor: Colors.grey,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        child: Column(children: [
                          ReactiveTextField<String>(
                            formControlName: 'name',
                            decoration: InputDecoration(labelText: 'Name'),
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  'Please enter your name.',
                            },
                          ),
                          SizedBox(height: 20),
                          ReactiveTextField<String>(
                            formControlName: 'email',
                            decoration: InputDecoration(labelText: 'Email'),
                            validationMessages: {
                              ValidationMessage.required: (_) =>
                                  'Please enter your email.',
                              ValidationMessage.email: (_) =>
                                  'Please enter a valid email address.',
                            },
                          ),
                        ]))))));
  }
}
