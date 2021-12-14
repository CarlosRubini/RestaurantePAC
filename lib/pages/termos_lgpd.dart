import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermosLGPD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // Vertically center the widget inside the column
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 380,
            width: 500,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Card(
              margin: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Text(
                    "Termos de Utilização dos Dados",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Ao realizar o cadastro do usuário você está concordando com a seguinte utilização dos seus dados:",
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Usuário: Seu Nome, será utilizado na distinção de pedidos entre os usuários.",
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Senha: Será utilizada juntamente do seu email para o login no site. (Toda a senha é criptografada em nosso banco de dados)",
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Email: Juntamente com a senha, é utilizada no login, porém tambem é utilizada na comunicação com o usuário.",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
