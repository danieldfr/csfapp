import 'package:csfapp/core/cores_csf.dart';
import 'package:flutter/material.dart';

InputDecoration getDecoracaoCampoAutenticacao(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: Colors.white, //cor de fundo do campo
    filled: true, //ativar exibição da cor de fundo
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: OutlineInputBorder(
      //Cor da borda do campo fora de foco
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: CoresCsf.cinzaEscuro,
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      //Cor da borda do campo que está em foco
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: CoresCsf.azulPrincipal,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 4,
      ),
    ),
  );
}
