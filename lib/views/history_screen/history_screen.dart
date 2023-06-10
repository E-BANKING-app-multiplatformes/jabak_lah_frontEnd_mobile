import 'package:e_banking_app/Consts/const.dart';
import 'package:e_banking_app/service/service.dart';
import 'package:e_banking_app/views/history_screen/history_details.dart';
import 'package:e_banking_app/views/home_screen/home_screen.dart';
import 'package:e_banking_app/views/widgets_common/normal_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:intl/intl.dart' as intl ;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {

  final Service historyControllerPage = Get.put(Service());
  //Service.fetchAccountId(Service.clientId);
  //fetchAccountId(Service.clientId);
  int accountId = 0;
   @override
  void initState() {
    super.initState();
    someFunction();
    
  }
   void someFunction() async {
    //final responseData = await homeControllerPage.fetchData();
    //int accountId = await homeControllerPage.fetchAccountId(homeControllerPage.getClientId())
    //Service.accountId
    print("je suis dans historyScreen");
    print(Service.clientId);
    //print(Service.getAccountId());
    int accountId1 = await historyControllerPage.fetchAccountId(Service.clientId);
    print("voici notre accountid");
    print(accountId1);
    
    
    if (mounted) {
      setState(() {
       // myCardBalance = balance;
        accountId= accountId1;
        print("voici notre accountid dans Setstate");
    print(accountId);
      });}
      print("voici notre accountid apres SetState");
    print(accountId);
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor:purpleClair,
        title: const Text(
          "History",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        actions: [
          50.widthBox,
          Center(child: normalText(text: intl.DateFormat('EEE, MMM d , ''yy').format(DateTime.now()),color: whiteColor)),
          10.widthBox,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.heightBox,
            Container(
              height: 40,
              //color:Color.fromARGB(255, 168, 174, 229),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color.fromARGB(255, 168, 174, 229),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  boldText(text: "date",color: Colors.black),
                  boldText(text: "transaction name",color: Colors.black),
                  boldText(text: "amount",color: Colors.black),
                ],
              ),
            ),
            FutureBuilder<List<Transaction>>(
              future: historyControllerPage.fetchHistoryData(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final List<Transaction> transactions = snapshot.data!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      transactions.length,
                      (index) => Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HistoryDetailsScreen(
                                transaction: transactions[index],
                              ),
                            ),
                          );
                          },
                          title: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    boldText(
                                      text: transactions[index].date,
                                      color: fontGrey,
                                    ),
                                    boldText(
                                      text: transactions[index].creditor,
                                      color: fontGrey,
                                    ),
                                    boldText(
                                      text: "-\MAD ${transactions[index].amount.toString()}",
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("Erreur lors de la récupération des données");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

    /*return Scaffold(
      appBar: AppBar(
        backgroundColor:purpleClair,
        title: const Text(
          "History",
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        actions: [
          50.widthBox,
          Center(child: normalText(text: intl.DateFormat('EEE, MMM d , ''yy').format(DateTime.now()),color: whiteColor)),
          10.widthBox,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.heightBox,
            Container(
              height: 40,
              //color:Color.fromARGB(255, 168, 174, 229),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color.fromARGB(255, 168, 174, 229),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  boldText(text: "date",color: Colors.black),
                  boldText(text: "transaction name",color: Colors.black),
                  boldText(text: "amount",color: Colors.black),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:List.generate(
                15, 
                (index)=>Card(
                  child: ListTile(
                    onTap: () {
                      //Get.to( () => HomeScreen());
                    },
                    title: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              boldText(text: intl.DateFormat(' MMM d/''yy').format(DateTime.now()),color: fontGrey),
                              //10.widthBox,
                              boldText(text: "transaction name",color: fontGrey,),
                              //60.widthBox,
                              boldText(text: "-"+"\$ 800",color:Colors.green)
                            ],
                          ),
                        )
                      ],
                    ),
                    )
                    
                ),
              )
            )
          ],
        ),
      ),
    );*/
  

