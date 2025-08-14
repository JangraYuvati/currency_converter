import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 80;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        style: BorderStyle.solid,
        color: Color.fromARGB(255, 22, 22, 22),
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 202, 243, 251),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 5, 177, 180),
          title: Text("Currency Converter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',

                style: TextStyle(
                  color: Color.fromARGB(255, 8, 0, 8),

                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(50.0),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Please enter the amount in USD",
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    prefixIcon: Icon(
                      Icons.monetization_on,
                      color: Color(0xFFFF9000),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 248, 247, 245),
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: convert,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 241, 171, 80),
                  ),
                  fixedSize: WidgetStatePropertyAll(Size(200, 50)),
                  elevation: WidgetStatePropertyAll(1),
                ),
                child: Text(
                  "Convert",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
