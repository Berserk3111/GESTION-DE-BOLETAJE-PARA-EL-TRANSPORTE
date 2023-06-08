import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_forms/reactive_forms.dart';

GlobalKey<FormState> keyForm = GlobalKey();

class Card_Boleto extends StatefulWidget {
  final asiento;
  const Card_Boleto({super.key, this.asiento});

  @override
  State<Card_Boleto> createState() => _Card_Boleto();
}

class _Card_Boleto extends State<Card_Boleto> {
  String nombre = '';
  String apellidos = '';

  FormGroup buildForm() => fb.group({
        'nombre': ['', Validators.required],
        'apellidos': ['', Validators.required]
      }, []);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReactiveForm(
          formGroup: FormGroup({
            'nombre': FormControl<String>(validators: [Validators.required]),
            'apellidos': FormControl<String>(validators: [Validators.required])
          }),
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 5,
            color: Colors.white,
            shadowColor: Colors.grey,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ReactiveFormBuilder(
                form: buildForm,
                builder: (context, form, child) {
                  final group = form.controls;
                  return Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.confirmation_number),
                        title: Text("Pasajero"),
                        subtitle:
                            Text("Tipo Pasajero, Asiento: ${widget.asiento}"),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Nombre(s)"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              child: ReactiveTextField<String>(
                                formControlName: 'nombre',
                                decoration:
                                    InputDecoration(labelText: 'Nombre'),
                                validationMessages: {
                                  ValidationMessage.required: (_) =>
                                      'Please enter your name.',
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Apellido(s)"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ReactiveTextField<String>(
                                  formControlName: 'apellidos',
                                  decoration:
                                      InputDecoration(labelText: 'Apellidos'),
                                  validationMessages: {
                                    ValidationMessage.required: (_) =>
                                        'Please enter your email.',
                                    ValidationMessage.email: (_) =>
                                        'Please enter a valid email address.',
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Text("Precio: \$100.00")],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (() {
                            print(form.rawValue.toString());
                          }), child: Icon(Icons.done))
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
