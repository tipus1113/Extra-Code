import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_interest_calculator/Util/utils.dart';

class SIForm extends StatefulWidget {
  @override
  _SIFormState createState() => _SIFormState();
}

class _SIFormState extends State<SIForm> {
  final String tag = "_SIFormState";


  var _formKey = GlobalKey<FormState>();
  var _timePeriod = ['1', '2', '3', '4'];
  final _minimumPadding = 5.0;
  var _currentItemSelected = '1';
  TextEditingController showRoomController = TextEditingController();
  TextEditingController onRoadControllers = TextEditingController();
  TextEditingController downPaymentController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var displayResult = '';

  var displayResult2 = '';

  var displayResult3 = '';

  var displayResult4 = '';

  @override
  Widget build(BuildContext context) {
    Util.showLog("_SIFormState", "build: called");
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .bodyText1;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(_minimumPadding * 2),
            child: ListView(children: [
              getImageAsset(),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: showRoomController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter showroom amount";
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Showroom Price',
                        hintText: 'Enter the Showroom Price e.g. 120000',
                        labelStyle: textStyle,
                        errorStyle:
                        TextStyle(color: Colors.deepPurple, fontSize: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: onRoadControllers,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter on road amount";
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'On Road Price',
                        hintText: 'Enter the on road price e.g. 120000',
                        labelStyle: textStyle,
                        errorStyle:
                        TextStyle(color: Colors.deepPurple, fontSize: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: downPaymentController,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Please enter Down Payment";
                      }
                    },
                    decoration: InputDecoration(
                        labelText: 'Down Payment',
                        hintText: 'enter down payment e.g. 10%',
                        labelStyle: textStyle,
                        errorStyle:
                        TextStyle(color: Colors.deepPurple, fontSize: 15.0),
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
                      buildTermDropDown()
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: _minimumPadding, bottom: _minimumPadding),
                  child: Row(
                    children: [
                      Expanded(
                          child: RaisedButton(
                            color: Theme
                                .of(context)
                                .accentColor,
                            child: Text(
                              "Calculate",
                              textScaleFactor: 1.2,
                            ),
                            onPressed: () {
                              _calculateButtonPressed();
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
              Expanded(child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text(displayResult),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3.0),

                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)
                              ),
                              child: Text("Amount + Interest"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ))
            ]),
          )),
    );
  }


  Widget getImageAsset() {
    Util.showLog("_SIFormState", "getImageAsset: called");
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


  Widget buildTermDropDown() {
    return Expanded(
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
            }));
  }


  /*
  *
  *  Logical methods -------------
  * */


  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }


  void _calculateButtonPressed() {
    Util.showLog(tag, "_calculateButtonPressed: called");
    if (_formKey.currentState.validate()) {}
    setState(() {
      this.displayResult =
          _calculateDueAmountTotalInterest();
      this.displayResult2 = _calculateTotalReturns2();
      this.displayResult3 = _calculateTotalReturns3();
      this.displayResult4 = _calculateTotalReturns4();
    });
  }

  String _calculateDueAmountTotalInterest() {
    Util.showLog(tag, "_calculateDueAmountTotalInterest: called");

    int showroom = int.parse(showRoomController.text);
    int onRoad = int.parse(onRoadControllers.text);
    int downPay = int.parse(downPaymentController.text);
    int interest = int.parse(termController.text);
    int ddi = int.parse(_currentItemSelected);

    var dueAmount = (onRoad - downPay); //Loan amount
    double emi = dueAmount / (ddi * 12); //EMi
    double interestEmi = interest / 100 * emi; //per month interest
    double totalInterest = interestEmi * (ddi * 12);


    Util.showLog(tag,
        "_calculateDueAmountTotalInterest: _currentItemSelected $_currentItemSelected");
    Util.showLog(tag, "_calculateDueAmountTotalInterest: dueAmount $dueAmount");
    Util.showLog(tag, "_calculateDueAmountTotalInterest: emi $emi");
    Util.showLog(
        tag, "_calculateDueAmountTotalInterest: interestEmi $interestEmi");
    Util.showLog(
        tag, "_calculateDueAmountTotalInterest: totalInterest $totalInterest");

    String result = "${totalInterest.toStringAsFixed(2)}";
    return result;
  }


  String _calculateTotalReturns2() {
    Util.showLog("_SIFormState", "_calculateTotalReturns2 : called");

    int showroom = int.parse(showRoomController.text);
    int onRoad = int.parse(onRoadControllers.text);
    int downPay = int.parse(downPaymentController.text);
    double interest = double.parse(termController.text);
    int ddi = int.parse(_currentItemSelected);

    var dueAmount = onRoad - downPay; //Loan amount
    double emi = dueAmount / (ddi * 12); //EMi
    double interestEmi = interest / 100 * emi; //per month interest
    double totalInterest = interestEmi * (ddi * 12);
    //  double totalInterest = 10.00000000000002;
    String result2 = '${totalInterest.toStringAsFixed(2)}';
    return result2;
  }

  String _calculateTotalReturns3() {
    Util.showLog("_SIFormState", "_calculateTotalReturns3 : called");
    Util.showLog(tag, "_calculateTotalReturns3: called");
    int showroom = int.parse(showRoomController.text);
    int onRoad = int.parse(onRoadControllers.text);
    int downPay = int.parse(downPaymentController.text);
    double interest = double.parse(termController.text);
    int ddi = int.parse(_currentItemSelected);

    var dueAmount = onRoad - downPay; //Loan amount
    double emi = dueAmount / (ddi * 12); //EMi
    double interestEmi = interest / 100 * emi; //per month interest
    double totalInterest = interestEmi * (ddi * 12);

    Util.showLog(tag, "_calculateTotalReturns3: ddi $ddi");
    Util.showLog(tag, "_calculateTotalReturns3: onRoad $onRoad");
    Util.showLog(tag, "_calculateTotalReturns3: downPay $downPay");
    Util.showLog(tag, "_calculateTotalReturns3: dueAmount $dueAmount");
    Util.showLog(tag, "_calculateTotalReturns3: emi $emi");
    Util.showLog(tag, "_calculateTotalReturns3: interestEmi $interestEmi");
    Util.showLog(tag, "_calculateTotalReturns3: totalInterest $totalInterest");

    String result3 = '$interestEmi';
    return result3;
  }

  String _calculateTotalReturns4() {
    Util.showLog("_SIFormState", "_calculateTotalReturns4 : called");
    int showroom = int.parse(showRoomController.text);
    int onRoad = int.parse(onRoadControllers.text);
    int downPay = int.parse(downPaymentController.text);
    double interest = double.parse(termController.text);
    int ddi = int.parse(_currentItemSelected);

    var dueAmount = onRoad - downPay; //Loan amount
    var emi = dueAmount / (ddi * 12); //EMi
    var interestEmi = interest / 100 * emi; //per month interest
    var totalInterest = interestEmi * (ddi * 12);

    String result4 = '$emi and $interestEmi';
    return result4;
  }

  void _reset() {
    Util.showLog("_SIFormState", "_reset : called");
    showRoomController.text = '';
    onRoadControllers.text = '';
    downPaymentController.text = '';
    termController.text = '';
    displayResult = '';
    _currentItemSelected = _timePeriod[0];
  }
}
