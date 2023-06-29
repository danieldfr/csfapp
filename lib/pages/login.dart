import 'package:csfapp/components/decoracao_campo_autenticacao.dart';
import 'package:csfapp/core/cores_csf.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool buttonLoginRegister = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "imagens/logo_azul.png",
                        height: 128,
                      ),
                      const Text(
                        "Cristianismo Sem Fronteiras",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: CoresCsf.azulPrincipal,
                        ),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        decoration:
                            getDecoracaoCampoAutenticacao("Digite seu e-mail"),
                        validator: (String? value) {
                          if (value == null) {
                            return "O e-mail não pode ser vazio.";
                          }
                          if (value.length < 5) {
                            return "O e-mail é muito curto.";
                          }
                          if (!value.contains("@")) {
                            return "O e-mail digital é inválido";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: getDecoracaoCampoAutenticacao("Senha"),
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null) {
                            return "A senha não pode ser vazia.";
                          }
                          if (value.length < 5) {
                            return "A senha é muito curta.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: !buttonLoginRegister,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getDecoracaoCampoAutenticacao(
                                  "Confirme sua senha"),
                              obscureText: true,
                              validator: (String? value) {
                                if (value == null) {
                                  return "A confirmação de senha não pode ser vazia.";
                                }
                                if (value.length < 5) {
                                  return "A confirmação de senha é muito curta.";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              decoration: getDecoracaoCampoAutenticacao(
                                  "Digite seu nome"),
                              validator: (String? value) {
                                if (value == null) {
                                  return "O nome não pode ser vazio.";
                                }
                                if (value.length < 5) {
                                  return "O nome é muito curto.";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          validacaoEntrarCadastrar();
                        },
                        child: Text(
                            (buttonLoginRegister) ? "Entrar" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            buttonLoginRegister = !buttonLoginRegister;
                          });
                        },
                        child: Text((buttonLoginRegister)
                            ? "Se não tiver conta, cadastre-se!"
                            : "Quero entrar."),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  validacaoEntrarCadastrar() {
    if (_formKey.currentState!.validate()) {
      print("Formulário válido!");
    } else {
      print("Formulário inválido!");
    }
  }
}
