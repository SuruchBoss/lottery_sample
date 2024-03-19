import 'package:flutter/material.dart';
import 'package:lottery/features/market/model/lottery_model.dart';

class LotteryList extends StatelessWidget {
  final List<LotteryModel> lotteryList;
  const LotteryList({
    super.key,
    required this.lotteryList,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 500,
      color: Colors.grey[200],
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
        bottom: 30,
      ),
      child: lotteryList.isEmpty
          ? Text(
              "No Result",
              style: TextStyle(fontSize: 30, color: Colors.grey[700]),
            )
          : ListView.builder(
              itemCount: lotteryList.length,
              itemBuilder: (BuildContext context, int index) {
                LotteryModel model = lotteryList[index];

                return Container(
                  padding: const EdgeInsets.only(
                    top: 5,
                    left: 40,
                    right: 40,
                    bottom: 5,
                  ),
                  margin: const EdgeInsets.only(
                    top: 5,
                    left: 20,
                    right: 20,
                    bottom: 5,
                  ),
                  child: Text(model.lotteryNumber),
                );
              },
            ),
    );
  }
}
