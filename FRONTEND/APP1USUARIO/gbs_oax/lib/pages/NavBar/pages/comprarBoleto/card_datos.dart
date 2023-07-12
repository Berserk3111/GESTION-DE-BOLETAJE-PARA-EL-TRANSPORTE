import 'package:flutter/material.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/confirmacionPago.dart';
import 'package:gbs_oax/pages/NavBar/pages/comprarBoleto/detallesPasajero.dart';
import 'package:gbs_oax/providers/boletos_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$");

GlobalKey<FormState> keyForm = GlobalKey();

class Card_Boleto extends StatefulWidget {
  final asiento;
  final corrida;
  const Card_Boleto({super.key, this.asiento, required this.corrida});

  @override
  State<Card_Boleto> createState() => _Card_Boleto();
}

class _Card_Boleto extends State<Card_Boleto> {
  bool submit = false;
  FormGroup buildForm() => fb.group({
        'nombre': ['', Validators.required, Validators.minLength(3)],
        'apellidos': ['', Validators.required],
        'email': ['', Validators.required, Validators.email],
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
          color: submit == false ? Colors.grey.shade200 : Colors.green.shade300,
          shadowColor: Colors.black,
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
                      title: Text(
                        "Pasajero",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange),
                      ),
                      subtitle: Text(
                        "Tipo Pasajero, Asiento: ${widget.asiento}",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Nombre(s)",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
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
                                          'Introduce tu nombre',
                                    },
                                    showErrors: (control) => control.touched,
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Apellido(s)",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
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
                                            'Introduce tu apellido paterno'
                                      },
                                      showErrors: (control) => control.touched,
                                    ),
                                  );
                                })),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Text(
                            "Email",
                            style: GoogleFonts.montserrat(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                              width: 200,
                              child: ReactiveFormConsumer(
                                  builder: (context, form, child) {
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ReactiveTextField(
                                    keyboardType: TextInputType.emailAddress,
                                    formControlName: 'email',
                                    readOnly: submit,
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      suffixIcon: group['email']!.valid
                                          ? const Icon(Icons.check)
                                          : null,
                                    ),
                                    validationMessages: {
                                      ValidationMessage.required: (error) =>
                                          'Introduce un email',
                                    },
                                    showErrors: (control) => control.touched,
                                  ),
                                );
                              })),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Precio: ${numberFormat.format(widget.corrida['costosModel']['costo'])}',
                            style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange),
                          ),
                        ],
                      ),
                    ),
                    ReactiveFormConsumer(builder: (context, form, child) {
                      return ElevatedButton(
                        onPressed: submit == false
                            ? form.valid
                                ? () {
                                    final ticketdata =
                                        TicketData(form.rawValue.toString());

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
                            : null,
                        child: submit == false
                            ? Icon(Icons.done)
                            : Icon(Icons.done_all),
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
