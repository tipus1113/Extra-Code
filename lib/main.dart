import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Simple Interest Calculator',
    home: SIForm(),
    theme: ThemeData(
        primaryColor: Colors.orange, accentColor: Colors.orangeAccent),
  ));
}

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();
  var _timePeriod = ['1', '2', '3', '4'];
  final _minimumPadding = 5.0;
  var _currentItemSelected = '1';
  TextEditingController principleController = TextEditingController();
  TextEditingController principleControllers = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  var displayResult2 = '';

  var displayResult3 = '';

  var displayResult4 = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(
              children: [
                getImageAsset(),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: principleController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please enter showroom amount";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Showroom Price',
                          hintText: 'Enter the Showroom Price e.g. 120000',
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.deepPurple, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: principleControllers,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please enter on road amount";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'On Road Price',
                          hintText: 'Enter the on road price e.g. 120000',
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.deepPurple, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: roiController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please enter Down Payment";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Down Payment',
                          hintText: 'enter down payment e.g. 10%',
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.deepPurple, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0))),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          controller: termController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter Interest rate';
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Total Interest',
                              hintText: 'enter interest rate e.g. 10.00',
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  color: Colors.deepPurple, fontSize: 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0))),
                        )),
                        Container(
                          width: _minimumPadding * 5,
                        ),
                        Expanded(
                            child: DropdownButton<String>(
                                items: _timePeriod.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                value: _currentItemSelected,
                                onChanged: (String newValueSelected) {
                                  _onDropDownItemSelected(newValueSelected);
                                }))
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        top: _minimumPadding, bottom: _minimumPadding),
                    child: Row(
                      children: [
                        Expanded(
                            child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            "Calculate",
                            textScaleFactor: 1.2,
                          ),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {}
                            setState(() {
                              this.displayResult = _calculateTotalReturns();
                              this.displayResult2 = _calculateTotalReturns2();
                              this.displayResult3 = _calculateTotalReturns3();
                              this.displayResult4 = _calculateTotalReturns4();
                            });
                          },
                        )),
                        Expanded(
                            child: RaisedButton(
                          child: Text(
                            "Reset",
                            textScaleFactor: 1.2,
                          ),
                          onPressed: () {
                            setState(() {
                              _reset();
                            });
                          },
                        ))
                      ],
                    )),
                Expanded(
                    child: Column(children: [
                  Row(children: [
                    Padding(
                    padding: EdgeInsets.all(_minimumPadding),
                    child: Text('amount and Interest')),
                Padding(
                    padding: EdgeInsets.all(_minimumPadding),
                    child: Text(
                      this.displayResult,
                      style: textStyle,
                    )),
                  ]),
                  Row(children: [
                    Padding(
                        padding: EdgeInsets.all(_minimumPadding),
                        child: Text('amount and Interest')),
                    Padding(
                      padding: EdgeInsets.all(_minimumPadding),
                      child: Text(
                        this.displayResult2,
                        style: textStyle,
                      ),
                    )
                  ]),
                  Row(children: [
                    Padding(
                        padding: EdgeInsets.all(_minimumPadding),
                        child: Text('amount and Interest')),
                    Padding(
                        padding: EdgeInsets.all(_minimumPadding),
                        child: Text(
                          this.displayResult3,
                          style: textStyle,
                        )),
                  ]),
                  Row(children: [
                    Padding(
                        padding: EdgeInsets.all(_minimumPadding),
                        child: Text('amount and Interest')),
                    Padding(
                        padding: EdgeInsets.all(_minimumPadding),
                        child: Text(
                          this.displayResult4,
                          style: textStyle,
                        )),
                  ])
                ]))
              ],
            ),
          )),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/cnw_logo.png');
    Image image = Image(
      image: assetImage,
      width: 100.0,
      height: 100.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotalReturns() {
    int showroom = int.parse(principleController.text);
    int onRoad = int.parse(principleControllers.text);
    int downPay = int.parse(roiController.text);
    double interest = double.parse(termController.text);
    int ddi = int.parse(_currentItemSelected);

    var dueAmount = onRoad - downPay; //Loan amount
    double emi = dueAmount / (ddi * 12); //EMi
    double interestEmi = interest / 100 * emi; //per month interest
    double totalInterest = interestEmi * (ddi * 12);

    String result = '$dueAmount and $totalInterest';
    return result;
  }

  String _calculateTotalReturns2() {
    int showroom = int.parse(principleController.text);
    int onRoad = int.parse(principleControllers.text);
    int downPay = int.parse(roiController.text);
    double interest = double.parse(termController.text);
    int ddi = int.parse(_currentItemSelected);

    var dueAmount = onRoad - downPay; //Loan amount
    double emi = dueAmount / (ddi * 12); //EMi
    double interestEmi = interest / 100 * emi; //per month interest
    double totalInterest = interestEmi * (ddi * 12);

    String result2 = '$totalInterest';
    return result2;
  }

  String _calculateTotalReturns3() {
    int showroom = int.parse(principleController.text);
    int onRoad = int.parse(principleControllers.text);
    int downPay = int.parse(roiController.text);
    double interest = double.parse(termController.text);
    int ddi = int.parse(_currentItemSelected);

    var dueAmount = onRoad - downPay; //Loan amount
    double emi = dueAmount / (ddi * 12); //EMi
    double interestEmi = interest / 100 * emi; //per month interest
    double totalInterest = interestEmi * (ddi * 12);

    String result3 = '$interestEmi';
    return result3;
  }

  String _calculateTotalReturns4() {
    int showroom = int.parse(principleController.text);
    int onRoad = int.parse(principleControllers.text);
    int downPay = int.parse(roiController.text);
    double interest = double.parse(termController.text);
    int ddi = int.parse(_currentItemSelected);

    var dueAmount = onRoad - downPay; //Loan amount
    double emi = dueAmount / (ddi * 12); //EMi
    double interestEmi = interest / 100 * emi; //per month interest
    double totalInterest = interestEmi * (ddi * 12);

    String result4 = '$emi and $interestEmi';
    return result4;
  }

  void _reset() {
    principleController.text = '';
    principleControllers.text = '';
    roiController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _timePeriod[0];
  }
}
