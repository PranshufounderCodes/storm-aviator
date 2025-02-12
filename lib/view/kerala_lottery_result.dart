import 'package:flutter/material.dart';
import 'package:stormaviator/view/view_inside.dart';

class KeralaLotteryResult extends StatefulWidget {
  @override
  _KeralaLotteryResultState createState() => _KeralaLotteryResultState();
}

class _KeralaLotteryResultState extends State<KeralaLotteryResult> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[800],
          title: Text(
            "Kerala",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "List"),
              Tab(text: "Search"),
              Tab(text: "Tendency"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // List Tab
            ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: lotteryResults.length,
              itemBuilder: (context, index) {
                final result = lotteryResults[index];
                return ListTile(

                  title: Text(
                    result['drawNumber'].toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${result['dateTime']}",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          title: result['title'].toString(),
                          drawNumber: result['drawNumber'].toString(),
                          dateTime: result['dateTime'].toString(),
                          prizeDetails: List<String>.from(result['prizes']),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            // Search Tab
            Center(child: Text("Search")),
            // Tendency Tab
            Center(child: Text("Tendency")),
          ],
        ),
      ),
    );
  }
}

// // Sample data for the list
// List<Map<String, String>> lotteryResults = [
//   {"title": "FF-128", "date": "12-02-2025", "time": "3:00 PM",},
//   {"title": "OA-1145", "date": "11-02-2025", "time": "8:00 PM"},
//   {"title": "SS-454", "date": "11-02-2025", "time": "3:00 PM"},
//   {"title": "OA-1144", "date": "10-02-2025", "time": "8:00 PM"},
//   {"title": "W-808", "date": "10-02-2025", "time": "3:00 PM"},
//   {"title": "OA-1143", "date": "09-02-2025", "time": "8:00 PM"},
//   {"title": "AK-688", "date": "09-02-2025", "time": "3:00 PM"},
//   {"title": "OA-1142", "date": "08-02-2025", "time": "8:00 PM"},
//   {"title": "KR-692", "date": "08-02-2025", "time": "3:00 PM"},
//   {"title": "OA-1141", "date": "07-02-2025", "time": "8:00 PM"},
//   {"title": "NR-418", "date": "07-02-2025", "time": "3:00 PM"},
//   {"title": "OA-1140", "date": "06-02-2025", "time": "8:00 PM"},
// ];

final List<Map<String, dynamic>> lotteryResults = [
  {
    'title': 'Kerala',
    'drawNumber': 'OA-1145',
    'dateTime': '11-02-2025 8:00 PM',
    'prizes': [
      '1st Prize: RS.12000000.0/- (OF462301)',
      'Consolation Prize: RS.10000.0/- (OA462301, OB462301, OC462301, ...)',
      '2nd Prize: RS.7000000.0/- (OF291638)',
      '3rd Prize: RS.100000.0/-',
    ]
  },
  {
    'title': 'Kerala1',
    'drawNumber': 'OA-1145',
    'dateTime': '11-02-2025 8:00 PM',
    'prizes': [
      '1st Prize: RS.12000000.0/- (OF462301)',
      'Consolation Prize: RS.10000.0/- (OA462301, OB462301, OC462301, ...)',
      '2nd Prize: RS.7000000.0/- (OF291638)',
      '3rd Prize: RS.100000.0/-',
    ]
  },
  {
    'title': 'Kerala2',
    'drawNumber': 'OA-1145',
    'dateTime': '11-02-2025 8:00 PM',
    'prizes': [
      '1st Prize: RS.12000000.0/- (OF462301)',
      'Consolation Prize: RS.10000.0/- (OA462301, OB462301, OC462301, ...)',
      '2nd Prize: RS.7000000.0/- (OF291638)',
      '3rd Prize: RS.100000.0/-',
    ]
  },
  {
    'title': 'Kerala3',
    'drawNumber': 'OA-1145',
    'dateTime': '11-02-2025 8:00 PM',
    'prizes': [
      '1st Prize: RS.12000000.0/- (OF462301)',
      'Consolation Prize: RS.10000.0/- (OA462301, OB462301, OC462301, ...)',
      '2nd Prize: RS.7000000.0/- (OF291638)',
      '3rd Prize: RS.100000.0/-',
    ]
  },
];