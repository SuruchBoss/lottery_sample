import 'package:flutter/material.dart';
import 'package:lottery/features/market/model/lottery_model.dart';

class LotteryList extends StatelessWidget {
  final List<LotteryModel> lotteryList;
  final void Function(LotteryModel model) addMyLottery;
  const LotteryList({
    super.key,
    required this.lotteryList,
    required this.addMyLottery,
  });

  void _selectLottery(int index) {
    // lotteryList[index].isSelected = !lotteryList[index].isSelected;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 500,
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

                return TextButton(
                  onPressed: null,
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 1),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 35,
                      left: 20,
                      right: 20,
                      bottom: 35,
                    ),
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2), BlendMode.dstATop),
                        image: const AssetImage("assets/bg.png"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          model.lotteryNumber,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                          width: 20.0,
                          child: Checkbox(
                            value: model.isSelected,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            onChanged: (bool? value) {
                              // context.read<NFTsFilterBloc>().add(
                              //       NFTsFilterEvent.changeFilterCheck(
                              //         selected: widget.filters
                              //             .singleWhere((item) => item == title),
                              //       ),
                              //     );
                            },
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
