import 'package:e_banking_app/Consts/const.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:e_banking_app/views/recharge_screen/recharge_screen.dart';
import 'package:e_banking_app/views/util/my_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../facture_screen/facture_screen.dart';
import 'package:intl/intl.dart' as intl;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final homeControllerPage =Get.put(Service());
  final ControllerPage = PageController();
  List<Transaction> transactions = [];

  // Déclarer les variables pour stocker les données
  double myCardBalance = 0.0;
  int myCardNumber = 0;
  int myexpiryMonth = 0;
  int myexpiryYear = 0;


  @override
  void initState() {
    super.initState();
    someFunction();
    
  }

  
  

  void someFunction() async {
    //final responseData = await homeControllerPage.fetchData();
    //int accountId = await homeControllerPage.fetchAccountId(homeControllerPage.getClientId())
    //Service.accountId
    print("je suis dans homeScreen");
    print(Service.clientId);
    //print(Service.getAccountId());
    int accountId = await homeControllerPage.fetchAccountId(Service.clientId);
    print("voici notre accountid");
    print(accountId);
    double balance = await homeControllerPage.fetchBalance(accountId);
    transactions = await homeControllerPage.fetchHistoryData(accountId);
    
    //double balance = responseData['balance'];
    //int cardNumber = responseData['cardNumber'];
    //int expiryMonth = responseData['expiryMonth'];
    //int expiryYear = responseData['expiryYear'];
    print(balance);
    if (mounted) {
      setState(() {
        myCardBalance = balance;
        accountId;
        //myCardNumber = cardNumber;
        //myexpiryMonth = expiryMonth;
        //myexpiryYear = expiryYear;
        print(balance);
      });}
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      boldText(text: " My", color: Colors.black, size: 28.0),
                      normalText(text: " Card", color: purpleColor, size: 28.0),
                    ],
                  ),
                  boldText(text: intl.DateFormat('EEE, MMM d , ''yy').format(DateTime.now()),color:Colors.black ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.notifications),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 200,
                  child: PageView(
                    controller: ControllerPage,
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyCard(
                          balance:  myCardBalance,
                          color: purpleClair),
                     /* MyCard(
                          balance: 5250.20,
                          cardNumber: 58872589,
                          expiryMonth: 12,
                          expiryYear: 29,
                          color: Colors.blue[400]),
                      MyCard(
                          balance: 5250.20,
                          cardNumber: 58872589,
                          expiryMonth: 12,
                          expiryYear: 29,
                          color: Colors.green[400])*/
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Center(
                child: SmoothPageIndicator(
                  controller: ControllerPage,
                  count: 3,
                  effect: ExpandingDotsEffect(),
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 90,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(21),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                )
                              ]),
                          child: Center(
                            child: Image.asset(sendMoney),
                          ),
                        ),
                        SizedBox(height: 12),
                        boldText(
                            text: "Donation", size: 18.0, color: Colors.grey[700])
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 90,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(21),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                )
                              ]),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const RechargeScreen());
                            },
                            child: Center(
                              child: Image.asset(creditCard),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        boldText(
                            text: "Pay", size: 18.0, color: Colors.grey[700])
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: 90,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(21),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                )
                              ]),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const FactureScreen());
                            },
                            child: Center(
                              child: Image.asset(bill),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        boldText(
                            text: "Bills", size: 18.0, color: Colors.grey[700])
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              boldText(
                  text: "Recent Transaction", color: Colors.black, size: 20.0),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    20.heightBox,
                    Container(
                      height: 40,
                      width: 330,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Color.fromARGB(255, 168, 174, 229),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          boldText(text: "Date", color: Colors.black),
                          boldText(
                              text: "Transaction Name", color: Colors.black),
                          boldText(text: "Amount", color: Colors.black),
                        ],
                      ),
                    ),
                    Divider(
                      color: fontGrey,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:transactions.isEmpty
                      ? [Text('Loading ...')] 
                      :List.generate(
                        transactions.length,
                        (index) => Card(
                          child: ListTile(
                            onTap: () {
                              //Get.to( () => HomeScreen());
                            },
                            title: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    boldText(
                                      text: intl.DateFormat(' MMM d/' 'yy')
                                        .format(DateTime.now()),
                                      color: fontGrey,
                                    ),
                                    //10.widthBox,
                                    boldText(
                                      text: transactions[index].creditor,
                                      color: fontGrey,
                                    ),
                                    //60.widthBox,
                                    boldText(
                                      text: "-" + "\MAD ${transactions[index].amount}",
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
