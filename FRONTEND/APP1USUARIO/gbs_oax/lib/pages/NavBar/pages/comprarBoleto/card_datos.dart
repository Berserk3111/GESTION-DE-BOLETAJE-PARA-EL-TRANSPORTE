import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:http/http.dart' as http;

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

  final form = FormGroup({
    'nombre': FormControl<String>(validators: [Validators.required]),
    'apellidos': FormControl<String>(validators: [Validators.required]),
  });

  void submitForm() async {
    if (form.valid) {
      final url = Uri.parse('http://10.0.2.2:8090/boleto/api/insertData');
      final response = await http.post(
        url,
        body: {
          'nombre': form.control('nombre').value,
          'email': form.control('apellidos').value,
        },
      );

      if (response.statusCode == 200) {
        // Datos enviados exitosamente
        print('Datos enviados exitosamente');
      } else {
        // Error al enviar los datos
        print('Error al enviar los datos');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                      title: Text("Pasajero",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black)),
                      subtitle: Text(
                          "Tipo Pasajero, Asiento: ${widget.asiento}",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black)),
                    ),
                    Text('Origen:  ${widget.corrida['municipio_origen']}',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.orange)),
                    Text('Destino:  ${widget.corrida['municipio_destino']}',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.orange)),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Nombre(s)",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.orange)),
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
                                          'Introduce tu(s) nombre(s)',
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
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Apellido(s)",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.orange)),
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
                                        hintText: 'Apellidos',
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
                          onPressed: submitForm, child: Text('Enviar')

                          /* submit == false
                              ? form.valid
                                  ? () {
                                      debugPrint(form.rawValue.toString());
                                      submit = true;
                                      setState(() {});
                                      final snackBar = SnackBar(
                                        /// need to set following properties for best effect of awesome_snackbar_content
                                        elevation: 0,
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.transparent,
                                        content: AwesomeSnackbarContent(
                                          title: 'Excelente!',
                                          message:
                                              'Tu boleto a sido registrado con exito',

                                          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                                          contentType: ContentType.success,
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);

                                      const SizedBox(height: 10);
                                    }
                                  : null
                              : null, */
                          // child: submit == false
                          //     ? Icon(Icons.done)
                          //     : Icon(Icons.done_all));
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
