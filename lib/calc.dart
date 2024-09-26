// Importa a biblioteca material do Flutter para usar widgets.
import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  // Define uma classe chamada Calc que é um StatefulWidget.
  @override
  _CalcState createState() =>
      // Cria o estado associado a este widget.
      _CalcState();
}

class _CalcState extends State<Calc> {
  // Classe que representa o estado do widget Calc.
  // Controlador para o campo de texto do preço do etanol.
  TextEditingController _controletanol = TextEditingController();

  // Controlador para o campo de texto do preço da gasolina.
  TextEditingController _controlGasolina = TextEditingController();

  // Variável que armazenará o resultado da comparação.
  String _resultado = 'Resultado';

  // Método que calcula qual combustível é mais vantajoso.
  void _calcular() {
    // Tenta converter o texto do campo de etanol para um número.
    var etanol = double.tryParse(_controletanol.text);

    // Tenta converter o texto do campo de gasolina para um número.
    var gasolina = double.tryParse(_controlGasolina.text);

    // Verifica se alguma das conversões falhou.
    if (etanol == null || gasolina == null) {
      // Mensagem de erro se a conversão falhar.
      _resultado = 'Não é possível calcular...';
    } else {
      // Calcula se a razão do preço do etanol para o da gasolina é menor que 0.7.
      var res = (etanol / gasolina < 0.7);

      // Se a condição for verdadeira, significa que vale a pena usar etanol.
      if (res) {
        // Mensagem informando que o etanol é vantajoso.
        _resultado = 'Vale a pena usar o Etanol!';
      } else {
        // Mensagem informando que a gasolina é vantajosa.
        _resultado = 'Vale a pena usar a Gasolina';
      }
    }

    // Chama setState para notificar que o estado mudou e a interface deve ser atualizada.
    setState(() {
      // Atualiza a variável _resultado (não é necessário aqui, mas é para forçar a atualização).
      _resultado;
    });
  }

  // Método que constrói a interface do widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold fornece uma estrutura básica para a tela.
      appBar: AppBar(
        // Cria uma barra de aplicativo na parte superior.
        // Define o título da AppBar.
        title: Text('Etanol ou Gasolina'),
        // Define a cor de fundo da AppBar.
        backgroundColor: Colors.blue,
      ),
      body: Container(
          // Container é um widget que pode ter margens, preenchimento, etc.
          // Define um preenchimento de 40 pixels em todos os lados.
          padding: EdgeInsets.all(40),
          child: ListView(
            // ListView permite que você crie uma lista que pode ser rolada.
            children: <Widget>[
              // Lista de widgets filhos dentro do ListView.
              // Exibe uma imagem a partir de um arquivo de ativos.
              Image.asset(
                // Caminho para a imagem.
                'images/logo.png',
                // Define a altura da imagem.
                height: 90,
              ),
              // Exibe um texto na tela.
              Text(
                'Saiba qual é a melhor opção para abastecimento do seu carro',
                // Justifica o texto.
                textAlign: TextAlign.justify,
                style: TextStyle(
                  // Estilo do texto.
                  // Cor do texto.
                  color: Colors.blue,
                  // Tamanho da fonte.
                  fontSize: 25,
                  // Define o texto como negrito.
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Campo de texto para entrada de dados.
              TextField(
                // Define que o teclado deve ser numérico.
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // Estilo da borda do campo de texto.
                  // Texto que aparece no campo.
                  labelText: 'Preço do Etanol:',
                  labelStyle: TextStyle(
                    // Estilo do texto do label.
                    fontSize: 20,
                    color: Colors.black12,
                  ),
                ),
                controller:
                    // Controlador para gerenciar o texto inserido.
                    _controletanol,
              ),
              // Campo de texto para entrada de dados.
              TextField(
                // Define que o teclado deve ser numérico.
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // Estilo da borda do campo de texto.
                  labelText:
                      // Texto que aparece no campo.
                      'Preço da Gasolina:',
                  labelStyle: TextStyle(
                    // Estilo do texto do label.
                    fontSize: 20,
                    color: Colors.black12,
                  ),
                ),
                controller:
                    // Controlador para gerenciar o texto inserido.
                    _controlGasolina,
              ),
              // Botão elevado que pode ser pressionado.
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      // Define a cor de fundo do botão.
                      Colors.blueAccent,
                ),
                // Texto que aparece no botão.
                child: Text(
                  'Calcular',
                  // Centraliza o texto no botão.
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // Cor do texto.
                    color: Colors.black,
                    // Tamanho da fonte.
                    fontSize: 15,
                  ),
                ),
                // Chama o método _calcular ao pressionar o botão.
                onPressed: _calcular,
              ),
              // Adiciona um espaçamento ao redor do widget.
              Padding(
                // Espaço acima do texto do resultado.
                padding: EdgeInsets.only(top: 20),
                // Exibe o resultado do cálculo na tela.
                child: Text(
                  // Texto que mostra o resultado.
                  _resultado,
                  style: TextStyle(
                    // Tamanho da fonte do resultado.
                    fontSize: 22,
                    // Define o texto como negrito.
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
