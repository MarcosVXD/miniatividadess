import 'package:flutter/material.dart';

void main() {
  runApp(const MeuAplicativo());
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Cadastro(),
    );
  }
}



class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController nomeController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    super.dispose();
  }

  void abrirResumo() {
    final String nome = nomeController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaResumo(
          nome: nome,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: abrirResumo,
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}

class TelaResumo extends StatelessWidget {
  final String nome;

  const TelaResumo({
    super.key,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Resumo'),
      ),
      body: Center(
        child: Text(
          nome,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}