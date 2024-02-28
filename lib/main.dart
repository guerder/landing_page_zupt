import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:validatorless/validatorless.dart';

import 'widgets/custom_expansion_panel.dart';
import 'widgets/custom_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing Page Zupt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.light(background: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController celularController = TextEditingController();

  void _request() async {
    showGeneralDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.white.withOpacity(.6),
      pageBuilder: (_, animation, secondaryAnimation) => const Center(
        child: CircularProgressIndicator(
          color: Color(0xffFF8038),
        ),
      ),
    );

    String url =
        'https://script.google.com/macros/s/AKfycbyr5XL1zuY_A_uF3m9OtVyzvGKVdtLLf7zaJppGbPY2cnfI10VnFPl6u08KkgNev55kgQ/exec';

    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    Map<String, String> requestBody = <String, String>{
      "nome": nameController.text,
      "email": emailController.text,
      "celular": celularController.text
    };

    String message =
        'Cadastro efetuado com sucesso. Agora é só aguardar o contato.';

    try {
      await http.post(Uri.parse(url), headers: headers, body: requestBody);
      _formKey.currentState?.reset();
    } catch (e) {
      message = e.toString();
    } finally {
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xff0B3349),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          content: Text(
            message,
            style: GoogleFonts.roboto(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color(0xff0B3349),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints:
                      const BoxConstraints(maxWidth: 846, minWidth: 846),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/logo.png', height: 48),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Quem somos',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Cadastrar mercado',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Já sou cadastrado',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: AssetImage(
                        'assets/images/hero.png',
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 144),
                        constraints: BoxConstraints(
                          maxWidth: 846,
                          minWidth: 846,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Plataforma de compras de supermercado online',
                                          style: GoogleFonts.robotoCondensed(
                                            fontSize: 48,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                            shadows: [
                                              Shadow(
                                                offset: Offset(0, 4),
                                                blurRadius: 12,
                                                color: Colors.black54,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 36),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Todos os seus produtos disponíveis na palma da mão do seu cliente, e com todas as ferramentas para você garantiar a qualidade do seu negócio.',
                                          style: GoogleFonts.roboto(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            shadows: [
                                              Shadow(
                                                offset: Offset(0, 0),
                                                blurRadius: 12,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/example_shot.png',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 126),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Venda rápido, venda na Zupt!',
                      style: GoogleFonts.roboto(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 56),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 713, minWidth: 713),
                      child: Card(
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        elevation: 8,
                        child: Form(
                          key: _formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 47,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cadastre o seu mercado!',
                                      style: GoogleFonts.roboto(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/emojione_shopping-cart.png',
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),
                                CustomTextField(
                                  controller: nameController,
                                  hintText: 'Nome do responsável legal',
                                  label: 'Nome completo*',
                                  validator: Validatorless.required(
                                    'O campo nome deve ser preenchido',
                                  ),
                                ),
                                SizedBox(height: 24),
                                CustomTextField(
                                  controller: emailController,
                                  hintText: 'email@email.com',
                                  label: 'E-mail de contato*',
                                  bottomText:
                                      'Informe o e-mail que você acessa frequentemente',
                                  validator: Validatorless.multiple([
                                    Validatorless.email(
                                      'Informe um e-mail válido',
                                    ),
                                    Validatorless.required(
                                      'O campo e-mail deve ser preenchido',
                                    ),
                                  ]),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                      RegExp(r"(\s)"),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),
                                CustomTextField(
                                  controller: celularController,
                                  hintText: '(00) 0000-00000',
                                  label: 'Celular*',
                                  bottomText:
                                      'Digite seu número de celular principal',
                                  validator: Validatorless.required(
                                    'O campo celular deve ser preenchido',
                                  ),
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24),
                                Text(
                                  '*Campos obrigatórios',
                                  style: TextStyle(
                                    fontFamily: 'Comfortaa',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 24),
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        icon: Icon(Icons.send),
                                        onPressed: () {
                                          if (_formKey.currentState
                                                  ?.validate() ??
                                              false) {
                                            _request();
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 20,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          backgroundColor: Color(0xffF0B695),
                                        ),
                                        label: Text(
                                          'Cadastrar',
                                          style: TextStyle(
                                            fontFamily: 'Comfortaa',
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.centerRight,
                      image: AssetImage(
                        'assets/images/fruits.png',
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 120),
                        constraints: BoxConstraints(
                          maxWidth: 846,
                          minWidth: 846,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Por que a Zupt?',
                              style: GoogleFonts.roboto(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 24),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Preço competitivo',
                                        style: GoogleFonts.roboto(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Os preços da Zupt são formados por 2 itens: taxa de adesão e taxa de serviço. A taxa de adesão que é cobrada uma única vez para cobrir os custos de implantação dos sistemas e treinamento de funcionários. A taxa de serviço que é uma porcentagem de cada pedido de compra.',
                                              style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 18,
                                                height: 1.3,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 60),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Entrega ou retirada',
                                        style: GoogleFonts.roboto(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Utilize a expertise de sua equipe para fazer a separação e entrega dos pedidos, ou apenas faça a separação dos itens para o seu cliente retirar a compra no local.',
                                              style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 18,
                                                height: 1.3,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 48),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Múltiplas formas de pagamento',
                                        style: GoogleFonts.roboto(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Ofereça a seu cliente as principais formas de pagamento disponíveis no mercado, direto no aplicativo ou no PDV do seu mercado.',
                                              style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 18,
                                                height: 1.3,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(width: 60),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sua marca em destaque',
                                        style: GoogleFonts.roboto(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Tenha sua identidade visual apresentada ao cliente. Trabalhamos com white-label para manter a sua marca em evidência.',
                                              style: TextStyle(
                                                fontFamily: 'Comfortaa',
                                                fontSize: 18,
                                                height: 1.3,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage(
                        'assets/images/breads.png',
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: 846, minWidth: 846, minHeight: 219),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Perguntas Frequentes',
                              style: GoogleFonts.roboto(
                                fontSize: 36,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            CustomExpansionPanel()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120),
                Container(
                  color: Color(0xff0B3349),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxWidth: 846, minWidth: 846),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '© 2021 Zupt Technologies',
                                style: TextStyle(
                                  fontFamily: 'Comfortaa',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
