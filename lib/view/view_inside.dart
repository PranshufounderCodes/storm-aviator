import 'package:flutter/material.dart';
import 'package:stormaviator/generated/assets.dart';
import 'package:stormaviator/main.dart';
import 'package:stormaviator/view/home/lottery/wingo/res/size_const.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final String drawNumber;
  final String dateTime;
  final List<String> prizeDetails;

  const ResultPage({
    Key? key,
    required this.title,
    required this.drawNumber,
    required this.dateTime,
   required this.prizeDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildHeader(),
            Sizes.spaceHeight10,
            _buildPrizeCard("I PRIZE", "RS.12000000.0/-", Colors.orange),
            Sizes.spaceHeight10,
            _buildConsolationPrize(),
            Sizes.spaceHeight10,
            _buildPrizeCard("II PRIZE",  "RS.7000000.0/-", Colors.grey),
            Sizes.spaceHeight10,
            _buildPrizeCard("III PRIZE",  "RS.100000.0/-", Colors.brown, ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(drawNumber, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
          Sizes.spaceHeight5,
          Text(dateTime, style: const TextStyle(fontSize: 16, color: Colors.black87)),
          Sizes.spaceHeight10,
          _buildSearchBox(),
        ],
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: const Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Ticket No",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.search, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildPrizeCard(String prizeTitle, String prizeAmount, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    prizeTitle,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                const Spacer(),
                Image.asset(Assets.chips10, width: 30, height: 30),
              ],
            ),
            Sizes.spaceHeight5,
            Text(
              prizeAmount,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: height*0.03,
              width: width*0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.blue)
              ),
              child: Text("12345667"),
            )

          ],
        ),
      ),
    );
  }

  Widget _buildConsolationPrize() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(5)),
              child: const Text(
                "Consolation PRIZE",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            Sizes.spaceHeight5,
            const Text(
              "RS.10000.0/-",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),



          ],
        ),
      ),
    );
  }
}
