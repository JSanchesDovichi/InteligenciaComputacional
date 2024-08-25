import 'package:flutter/material.dart';
import 'package:my_app/src/rust/api/simple.dart';
import 'package:my_app/src/rust/frb_generated.dart';

//List<Widget> matriz = [];
List<bool> pixels_matriz_1 = [];
List<bool> pixels_matriz_2 = [];
List<bool> pixels_matriz_3 = [];

/*
limparGrid() {
  for (var i = 0; i < 100; i++) {
    preenchidos.add(false);

    matriz.add(Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: InkWell(
        onTap: () {
          preenchidos[i] = true;
        },
      ),
    ));
  }

  //matriz.add(ElevatedButton(onPressed: () {}, child: Text("LIMPAR")));
}
*/

Future<void> main() async {
  //limparGrid();
  for (var indice = 0; indice < 100; indice++) {
    //pixels[indice] = false;
    pixels_matriz_1.add(false);
  }

  for (var indice = 0; indice < 100; indice++) {
    //pixels[indice] = false;
    pixels_matriz_2.add(false);
  }

  for (var indice = 0; indice < 100; indice++) {
    //pixels[indice] = false;
    pixels_matriz_3.add(false);
  }

  await RustLib.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String letraReconhecida = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> matriz_1 = [];
    List<Widget> matriz_2 = [];
    List<Widget> matriz_3 = [];

    for (var indice = 0; indice < 100; indice++) {
      matriz_1.add(Container(
        decoration: BoxDecoration(
            color: pixels_matriz_1[indice] ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black)),

        //color: pixels[indice] ? Colors.black : Colors.white,
        child: InkWell(
          onSecondaryTap: () {
            pixels_matriz_1[indice] = false;

            /*
            treinarRede(
                vetorMatriz1: pixels_matriz_1,
                vetorMatriz2: pixels_matriz_2,
                vetorTeste: pixels_matriz_3);
              */

            setState(() {});
          },
          onTap: () {
            pixels_matriz_1[indice] = true;

            /*
            treinarRede(
                vetorMatriz1: pixels_matriz_1,
                vetorMatriz2: pixels_matriz_2,
                vetorTeste: pixels_matriz_3);
              */

            treinarRedePerceptron(
                vetorMatriz1: pixels_matriz_1,
                vetorMatriz2: pixels_matriz_2,
                vetorTeste: pixels_matriz_3);

            setState(() {});
          },
        ),
      ));

      matriz_2.add(Container(
        decoration: BoxDecoration(
            color: pixels_matriz_2[indice] ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black)),

        //color: pixels[indice] ? Colors.black : Colors.white,
        child: InkWell(
          onTap: () {
            pixels_matriz_2[indice] = true;

            /*
            treinarRede(
                vetorMatriz1: pixels_matriz_1,
                vetorMatriz2: pixels_matriz_2,
                vetorTeste: pixels_matriz_3);
              */

            setState(() {});
          },
        ),
      ));

      matriz_3.add(Container(
        decoration: BoxDecoration(
            color: pixels_matriz_3[indice] ? Colors.black : Colors.white,
            border: Border.all(color: Colors.black)),

        //color: pixels[indice] ? Colors.black : Colors.white,
        child: InkWell(
          onTap: () {
            pixels_matriz_3[indice] = true;

            /*
            treinarRede(
                vetorMatriz1: pixels_matriz_1,
                vetorMatriz2: pixels_matriz_2,
                vetorTeste: pixels_matriz_3);
              */

            letraReconhecida = treinarRedePerceptron(
                vetorMatriz1: pixels_matriz_1,
                vetorMatriz2: pixels_matriz_2,
                vetorTeste: pixels_matriz_3);

            setState(() {});
          },
        ),
      ));
    }

    /*
    for (var indice = 0; indice < 100; indice++) {
      if (preenchidos[indice] == true) {
        //matriz[indice].color = Colors.black;
        matriz[indice] = Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: InkWell(
            onTap: () {
              preenchidos[indice] = false;
            },
          ),
        );
      }
    }
    */

    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            label: Text("Limpar"),
            icon: Icon(Icons.clear),
            onPressed: () {
              //limparGrid();
              for (var indice = 0; indice < 100; indice++) {
                //pixels[indice] = false;
                pixels_matriz_1[indice] = false;
                pixels_matriz_2[indice] = false;
                pixels_matriz_3[indice] = false;
              }

              setState(() {});
            },
          ),
          body: Center(
              child: Row(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Letra 1:"),
              SizedBox(
                  width: 300,
                  height: 300,
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      children: matriz_1)),
            ]),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Letra 2:"),
              SizedBox(
                  width: 300,
                  height: 300,
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      children: matriz_2)),
            ]),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text("Letra 3:"),
              SizedBox(
                  width: 300,
                  height: 300,
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      children: matriz_3)),
            ]),
            /*
            if (pixels_matriz_1.contains(true) &&
                pixels_matriz_2.contains(true)) ...[
              ElevatedButton(
                  onPressed: () {
                    print(treinarRede(
                        vetorMatriz1: pixels_matriz_1,
                        vetorMatriz2: pixels_matriz_2));
                  },
                  child: Text("Treinar")),
            ],
            */
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                  onPressed: () {
                    pixels_matriz_1 = [
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false
                    ];

                    pixels_matriz_2 = [
                      false,
                      true,
                      true,
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      true,
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      true,
                      false,
                      false,
                      true,
                      true,
                      true,
                      true,
                      true,
                      true,
                      true,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false,
                      false
                    ];

                    /*
            treinarRede(
                vetorMatriz1: pixels_matriz_1,
                vetorMatriz2: pixels_matriz_2,
                vetorTeste: pixels_matriz_3);
              */

                    setState(() {});
                  },
                  child: Text("Exemplo")),
              ElevatedButton(
                  onPressed: () {
                    /*
            treinarRede(
                vetorMatriz1: pixels_matriz_1,
                vetorMatriz2: pixels_matriz_2,
                vetorTeste: pixels_matriz_3);
              */
                  },
                  child: Text("Treinar")),
              Text("Letra: $letraReconhecida")
            ]),
          ]))),
    );
  }
}

/*
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            label: Text("Limpar"),
            icon: Icon(Icons.clear),
            onPressed: () {
              limparGrid();

              setState(() { /* The animation changed. */ });
            },
          ),
          body: Center(
              child: SizedBox(
                  width: 800,
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: false,
                      children: matriz)))),
    );
  }
}
*/
