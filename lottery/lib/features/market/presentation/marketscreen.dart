import 'package:flutter/material.dart';
import 'package:lottery/features/login/presentation/screen/loginscreen.dart';
import 'package:lottery/features/market/model/lottery_model.dart';
import 'package:lottery/features/market/presentation/widget/lottery_list.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final box1Controller = TextEditingController();
  final box2Controller = TextEditingController();
  final box3Controller = TextEditingController();
  final box4Controller = TextEditingController();
  final box5Controller = TextEditingController();
  final box6Controller = TextEditingController();

  List<LotteryModel> lotteryList = [
    const LotteryModel(lotteryNumber: "123456"),
    const LotteryModel(lotteryNumber: "123222"),
    const LotteryModel(lotteryNumber: "123333"),
    const LotteryModel(lotteryNumber: "123445")
  ];

  void _logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _generatedLottery() {}

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Lottery Market",
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _logOut(),
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.blueAccent,
              size: 24.0,
            ),
          )
        ],
      ),
      body: Container(
        width: screenWidth,
        color: Colors.white,
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
          bottom: 30,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: box1Controller,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: box2Controller,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: box3Controller,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: box4Controller,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: box5Controller,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                  Container(
                    width: 40,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: box6Controller,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: "",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () => _generatedLottery(),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft),
                child: const Text(
                  "Generate",
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Divider(
                height: 20,
                thickness: 2,
                color: Colors.red[600],
              ),
              const SizedBox(
                height: 15,
              ),
              LotteryList(
                lotteryList: lotteryList,
              )
            ],
          ),
        ),
      ),
    );
  }
}
