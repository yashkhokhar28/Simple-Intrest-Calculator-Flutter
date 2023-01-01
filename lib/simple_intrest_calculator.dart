import 'package:flutter/material.dart';

class SimpleInterestCalculator extends StatefulWidget {
  const SimpleInterestCalculator({super.key});

  @override
  State<SimpleInterestCalculator> createState() =>
      _SimpleInterestCalculatorState();
}

class _SimpleInterestCalculatorState extends State<SimpleInterestCalculator> {
  late TextEditingController _amountController;
  late TextEditingController _roiController;
  late TextEditingController _tpController;

  // double finalPrincipalAmount = 0;
  // double finalTotalInterest = 0;
  // double finalTotalAmount = 0;

  double finalPrincipalAmount = 0;
  double totalInterest = 0;
  double totalAmount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _amountController = TextEditingController();
    _roiController = TextEditingController();
    _tpController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Simple Interest Calculator"),
            backgroundColor: Colors.black),
        body: Container(
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(children: [
            getCustomizedRowWidget(
                "Principal Amount", "Enter Amount", false, _amountController),
            getCustomizedRowWidget("Rate Of Interest", "Enter Rate Of Interest",
                false, _roiController),
            getCustomizedRowWidget(
                "Time Period", "Enter Time Period", false, _tpController),
            Container(
              // color: Colors.black,
              margin: const EdgeInsets.only(top: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.black),
                onPressed: calculateSPIAndDisplay,
                child: const Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            getCustomizedRowWidget("Principal Amount",
                finalPrincipalAmount.toString(), true, null),
            getCustomizedRowWidget(
                "Total Interest", totalInterest.toString(), true, null),
            getCustomizedRowWidget(
                "Total Amount", totalAmount.toString(), true, null),
          ]),
        ),
      ),
    );
  }

  // void calculateSPIAndDisplay() {
  //   setState(() {
  //     double amount = double.parse(_amountController.text);
  //     double roi = double.parse(_amountController.text);
  //     double tp = double.parse(_amountController.text);
  //     finalPrincipalAmount = amount;
  //     finalTotalInterest = (amount * (1 + roi / 100 * tp));
  //     finalTotalAmount = finalTotalInterest + finalPrincipalAmount;
  //     print("$finalPrincipalAmount");
  //     print("$finalTotalInterest");
  //     print("$finalTotalAmount");
  //   });
  // }
  void calculateSPIAndDisplay() {
    setState(() {
      double amount = double.parse(_amountController.text);
      double roi = double.parse(_roiController.text);
      double tp = double.parse(_tpController.text);

      finalPrincipalAmount = amount;
      totalInterest = (amount * (1 + (roi / 100) * tp)) - finalPrincipalAmount;
      totalAmount = totalInterest + finalPrincipalAmount;
    });
  }

  Widget getCustomizedRowWidget(
      title, String hintText, isAnswerWidget, controller) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(title),
          ),
          isAnswerWidget
              ? Expanded(
                  flex: 3,
                  child: Text(hintText),
                )
              : Expanded(
                  flex: 3,
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: hintText.toString()),
                  ),
                )
        ],
      ),
    );
  }
}
