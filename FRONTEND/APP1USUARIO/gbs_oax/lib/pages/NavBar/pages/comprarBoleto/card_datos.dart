import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gbs_oax/providers/boletos_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:provider/provider.dart';

GlobalKey<FormState> keyForm = GlobalKey();

class Card_Boleto extends StatefulWidget {
  final asiento;
  final corrida;
  const Card_Boleto({super.key, this.asiento, required this.corrida});

  @override
  State<Card_Boleto> createState() => _Card_Boleto();
}

class _Card_Boleto extends State<Card_Boleto> {
  String nombre = '';
  String apellidos = '';
  bool submit = false;
  FormGroup buildForm() => fb.group({
        'nombre': ['', Validators.required, Validators.minLength(3)],
        'apellidos': ['', Validators.required]
      }, []);

  @override
  Widget build(BuildContext context) {
    final boletosProvider = Provider.of<BoletosProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 5,
          color:
              submit == false ? Colors.white : Color.fromRGBO(145, 250, 141, 1),
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
                      leading: const Icon(Icons.confirmation_number),
                      title: const Text("Pasajero"),
                      subtitle:
                          Text("Tipo Pasajero, Asiento: ${widget.asiento}"),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Nombre(s)"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 200,
                              child: ReactiveFormConsumer(
                                  builder: (context, form, child) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ReactiveTextField(
                                    formControlName: 'nombre',
                                    readOnly: submit,
                                    decoration: InputDecoration(
                                      hintText: 'Nombre',
                                      suffixIcon: group['nombre']!.valid
                                          ? const Icon(Icons.check)
                                          : null,
                                    ),
                                    validationMessages: {
                                      ValidationMessage.required: (error) =>
                                          'Please enter your name.',
                                    },
                                    showErrors: (control) => control.touched,
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Apellido(s)"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ReactiveFormConsumer(
                                    builder: (context, form, child) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: ReactiveTextField(
                                      readOnly: submit,
                                      onChanged: (control) {
                                        setState(() {});
                                      },
                                      formControlName: 'apellidos',
                                      decoration: InputDecoration(
                                        hintText: 'Nombre',
                                        suffixIcon: group['apellidos']!.valid
                                            ? const Icon(Icons.check)
                                            : null,
                                      ),
                                      validationMessages: {
                                        'required': (error) =>
                                            'Introduce tus apellidos'
                                      },
                                      showErrors: (control) => control.touched,
                                    ),
                                  );
                                })),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text("Precio: \$100.00")],
                      ),
                    ),
                    ReactiveFormConsumer(builder: (context, form, child) {
                      return ElevatedButton(
                        child: submit == false
                            ? Icon(Icons.done)
                            : Icon(Icons.done_all),
                        onPressed: () {
                          print(form.control('apellidos').value);
                          FormData formData = FormData.fromMap({
                            'nombre': form.control('nombre').value,
                            "apellidos": form.control('apellidos').value,
                          });
                          boletosProvider.registro(formData);

                          final snackBar = SnackBar(
                            /// need to set following properties for best effect of awesome_snackbar_content
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Excelente!',
                              message: 'Tu boleto a sido registrado con exito',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.success,
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);

                          const SizedBox(height: 10);
                        },
                      );
                    }),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
