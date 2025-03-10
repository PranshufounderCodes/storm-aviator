// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'package:stormaviator/generated/assets.dart';
// import 'package:stormaviator/main.dart';
// import 'package:stormaviator/model/bettingHistory_Model.dart';
// import 'package:stormaviator/model/user_model.dart';
// import 'package:stormaviator/res/aap_colors.dart';
// import 'package:stormaviator/res/api_urls.dart';
// import 'package:stormaviator/res/components/text_widget.dart';
// import 'package:stormaviator/res/provider/user_view_provider.dart';
//
// class DragonTigerAllHistory extends StatefulWidget {
//   final String gameid;
//   const DragonTigerAllHistory({super.key,required this.gameid});
//
//   @override
//   State<DragonTigerAllHistory> createState() => _DragonTigerAllHistoryState();
// }
// class _DragonTigerAllHistoryState extends State<DragonTigerAllHistory> {
//
//
//   @override
//   void initState() {
//     BettingHistory();
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//
//       children: [
//         responseStatuscode == 400
//             ? const Notfounddata()
//             : items.isEmpty
//             ? const Center(child: CircularProgressIndicator()):
//         ListView.builder(
//           padding: const EdgeInsets.symmetric(
//               horizontal: 10),
//           physics:
//           const ScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             List<Color> colors;
//
//             if (items[index].number ==
//                 1) {
//               colors = [
//                 const Color(0xFF56d5e5),
//                 const Color(0xFF56d5e5),
//               ];
//             } else if (items[index]
//                 .number ==
//                 2) {
//               colors = [
//                 Colors.red,
//                 Colors.red
//               ];
//             }
//             else {
//               colors = [
//                 Colors.green,
//                 Colors.green
//               ];
//             }
//
//
//
//             return ExpansionTile(
//               leading: Container(
//                   height: height * 0.06,
//                   width: width * 0.12,
//                   decoration: BoxDecoration(
//                       borderRadius:
//                       BorderRadius.circular(10),
//                       // color: Colors.grey
//                       gradient: LinearGradient(
//                           stops: const [
//                             0.5,
//                             0.5
//                           ],
//                           colors:colors,
//                           begin: Alignment.topLeft,
//                           end: Alignment
//                               .bottomRight)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(1.0),
//                     child: Image.asset(
//                       // 1 dragon
//                       // 2 tiger
//
//                       items[index].number == 1
//                           ? Assets.dragontigerIcDtD
//                           : items[index].number == 2
//                           ? Assets.dragontigerIcDtT:
//                       Assets.dragontigerIcDtTie,
//                     ),
//                   )
//               ),
//               title:  Text(
//                 items[index].gamesno.toString(),
//                 style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w800,
//                     color: Colors.white),
//               ),
//               subtitle:  Text(
//                   items[index].createdAt.toString(),
//                   style: const TextStyle(
//                       fontSize: 10,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.grey)),
//               trailing: Column(
//                 mainAxisAlignment:
//                 MainAxisAlignment.end,
//                 children: [
//                   Container(
//                     height: height * 0.042,
//                     width: width * 0.2,
//                     decoration: BoxDecoration(
//                         borderRadius:
//                         BorderRadius.circular(
//                             10),
//                         border: Border.all(
//                             color: items[index].status==0? AppColors.primaryTextColor:items[index].status==2?
//                             AppColors
//                                 .secondaryTextColor: Colors.green)),
//                     child: Center(
//                       child:  Text(
//                         items[index].status==2?'Failed':items[index].status==0?'Pending':'Succeed',
//                         style: TextStyle(
//                             fontSize: 12,
//                             fontWeight:
//                             FontWeight.w700,
//                             color:
//                             items[index].status==0?Colors.white:
//                             items[index].status==2?
//                             AppColors
//                                 .secondaryTextColor: Colors.green),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     items[index].status==0?'--':
//                     items[index].status==2?'- ₹${items[index].amount.toStringAsFixed(2)}':'+ ₹${items[index].winAmount.toStringAsFixed(2)}',
//                     style: TextStyle(
//                         fontSize: 12,
//                         fontWeight:
//                         FontWeight.w700,
//                         color: items[index].status==0?Colors.white:items[index].status==2?
//                         AppColors
//                             .secondaryTextColor: Colors.green),
//                   ),
//                 ],
//               ),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0),
//                   child: Column(
//                     mainAxisAlignment:
//                     MainAxisAlignment.start,
//                     crossAxisAlignment:
//                     CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       const Align(
//                           alignment:
//                           Alignment.topLeft,
//                           child: Text(
//                             'Details',
//                             style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight:
//                                 FontWeight
//                                     .w900,
//                                 color:
//                                 Colors.white),
//                           )),
//                       const SizedBox(height: 8.0),
//                       Container(
//                         height: height * 0.08,
//                         width: width,
//                         decoration: BoxDecoration(
//                             borderRadius:
//                             BorderRadius
//                                 .circular(10),
//                             color: AppColors
//                                 .FirstColor),
//                         child: Padding(
//                           padding:
//                           const EdgeInsets
//                               .all(8.0),
//                           child: Column(
//                             mainAxisAlignment:
//                             MainAxisAlignment
//                                 .start,
//                             crossAxisAlignment:
//                             CrossAxisAlignment
//                                 .start,
//                             children: [
//                               const Text(
//                                 'order number',
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight:
//                                     FontWeight
//                                         .w700,
//                                     color: Colors
//                                         .white),
//                               ),
//                               const SizedBox(
//                                   height: 4.0),
//                               Text(
//                                 items[index].orderId.toString(),
//                                 style: const TextStyle(
//                                     fontSize: 12,
//                                     fontWeight:
//                                     FontWeight
//                                         .w700,
//                                     color: Colors
//                                         .white),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       historyDetails(
//                           'Period',
//                           items[index].gamesno.toString(),
//                           Colors.white),
//                       historyDetails(
//                           'Purchase amount',
//                           items[index].amount.toString(),
//                           Colors.white),
//                       historyDetails(
//                           'Amount after tax',
//                           items[index].tradeAmount.toString(),
//                           Colors.red),
//                       historyDetails('Tax',
//                           items[index].commission.toString(), Colors.white),
//                       historyWinDetails(
//                           'Result',
//                           items[index].winNumber==null? '--': '${items[index].winNumber}, ',
//
//                           items[index].winNumber==1?"Dragon": items[index].winNumber==2?"Tiger":"Tie",
//
//                           Colors.white,
//
//                           items[index].winNumber==1?const Color(0xff56d5e5):
//                           items[index].winNumber==2?Colors.red:Colors.green
//
//                       ),
//                       historyDetails('Select',
//                           items[index].number==1?'Dragon':items[index].number==2?'Tiger':"Tie",
//                           Colors.white
//                       ),
//                       historyDetails('Status',
//                           items[index].status==0?'Unpaid':
//                           items[index].status==2?
//                           'Failed':'Succeed', items[index].status==0?Colors.white:items[index].status==2?Colors.red:Colors.green),
//                       historyDetails('Win/Loss',
//                           items[index].status==0?'--': '₹${items[index].winAmount.toStringAsFixed(2)}', items[index].status==0?Colors.white:items[index].status==2? Colors.red:Colors.green),
//                       historyDetails(
//                           'Order time',
//                           items[index].createdAt.toString(),
//                           Colors.white),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: limitResult == 0
//                   ? () {}
//                   : () {
//                 setState(() {
//                   pageNumber--;
//                   limitResult = limitResult - 10;
//                   offsetResult = offsetResult - 10;
//                 });
//                 setState(() {});
//                 BettingHistory();
//               },
//               child: Container(
//                 height: height * 0.06,
//                 width: width * 0.10,
//                 decoration: BoxDecoration(
//                   gradient: AppColors.loginSecondryGrad,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Icon(
//                   Icons.navigate_before,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 16),
//             textWidget(
//               text: '$pageNumber/${items.length}',
//               fontSize: 13,
//               fontWeight: FontWeight.w600,
//               color: AppColors.primaryTextColor,
//               maxLines: 1,
//             ),
//             const SizedBox(width: 16),
//             GestureDetector(
//               onTap: () {
//                 setState(() {
//                   limitResult = limitResult + 10;
//                   offsetResult = offsetResult + 10;
//                   pageNumber++;
//                 });
//                 setState(() {});
//                 BettingHistory();
//               },
//               child: Container(
//                 height: height * 0.06,
//                 width: width * 0.10,
//                 decoration: BoxDecoration(
//                   gradient: AppColors.loginSecondryGrad,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Icon(Icons.navigate_next,
//                     color: Colors.white),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//   int limitResult = 0;
//   int pageNumber = 1;
//   historyDetails(String title, String subtitle, Color subColor) {
//     return Column(
//       children: [
//         const SizedBox(height: 8.0),
//         Container(
//           height: height * 0.05,
//           width: width,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.FirstColor),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white),
//                 ),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w700,
//                       color: subColor),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   historyWinDetails(String title, String subtitle, String subtitle1,
//       Color subColor, Color subColor1) {
//     return Column(
//       children: [
//         const SizedBox(height: 8.0),
//         Container(
//           height: height * 0.05,
//           width: width,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.FirstColor),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white),
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       subtitle,
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: subColor),
//                     ),
//                     Text(
//                       subtitle1,
//                       style: TextStyle(
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                           color: subColor1),
//                     ),
//
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   int? responseStatuscode;
//   UserViewProvider userProvider = UserViewProvider();
//
//   int offsetResult = 0;
//   List<BettingHistoryModel> items = [];
//   Future<void> BettingHistory() async {
//
//     UserModel user = await userProvider.getUser();
//     String token = user.id.toString();
//     final response = await http.get(
//       Uri.parse('${ApiUrl.betHistory}$token&game_id=${widget.gameid}&limit=10&offset=$offsetResult'),
//     );
//     setState(() {
//       responseStatuscode = response.statusCode;
//     });
//
//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body)['data'];
//       final Map<String, dynamic> Data = json.decode(response.body);
//       final int totalBetsCount = Data['total_bets'];
//
//       setState(() {
//         items = responseData.map((item) => BettingHistoryModel.fromJson(item)).toList();
//
//       });
//
//     } else if (response.statusCode == 400) {
//       if (kDebugMode) {
//         print('Data not found');
//       }
//     } else {
//       setState(() {
//         items = [];
//       });
//       throw Exception('Failed to load data');
//     }
//   }
// }
//
//
// class Notfounddata extends StatelessWidget {
//   const Notfounddata({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image(
//           image: const AssetImage(Assets.imagesNoDataAvailable),
//           height: height / 3,
//           width: width / 2,
//         ),
//         SizedBox(height: height * 0.07),
//         const Text(
//           "Data not found",
//         )
//       ],
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stormaviator/generated/assets.dart';
import 'package:stormaviator/main.dart';
import 'package:stormaviator/model/bettingHistory_Model.dart';
import 'package:stormaviator/model/user_model.dart';
import 'package:stormaviator/res/aap_colors.dart';
import 'package:stormaviator/res/api_urls.dart';
import 'package:stormaviator/res/components/app_bar.dart';
import 'package:stormaviator/res/components/text_widget.dart';
import 'package:http/http.dart' as http;
import 'package:stormaviator/res/provider/user_view_provider.dart';

import '../../account/History/betting_history.dart';

class DragonTigerHistory extends StatefulWidget {
  final String gameid;
  const DragonTigerHistory({super.key,required this.gameid});

  @override
  State<DragonTigerHistory> createState() => _DragonTigerHistoryState();
}

class _DragonTigerHistoryState extends State<DragonTigerHistory> {


  @override
  void initState() {
    gameHistory();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffolddark,
      appBar: GradientAppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 5, 5),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                )),
          ),
          centerTitle: true,
          title: textWidget(
            text: 'Dragon Tiger',
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: AppColors.primaryTextColor,),
          gradient: AppColors.primaryUnselectedGradient),
      body: ListView(
        shrinkWrap: true,
        children: [
          responseStatusCode == 400
              ? const Notfounddata()
              : itemsDataHistory.isEmpty
              ? const Center(child: CircularProgressIndicator()):
          ListView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: 10),
            physics:
            const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: itemsDataHistory.length,
            itemBuilder: (context, index) {
              List<Color> colors;

              if (itemsDataHistory[index].number ==
                  1) {
                colors = [
                  const Color(0xFF56d5e5),
                  const Color(0xFF56d5e5),
                ];
              } else if (itemsDataHistory[index]
                  .number ==
                  2) {
                colors = [
                  Colors.red,
                  Colors.red
                ];
              }
              else {
                colors = [
                  Colors.green,
                  Colors.green
                ];
              }



              return ExpansionTile(
                leading: Container(
                    height: height * 0.06,
                    width: width * 0.12,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(10),
                        // color: Colors.grey
                        gradient: LinearGradient(
                            stops: const [
                              0.5,
                              0.5
                            ],
                            colors:colors,
                            begin: Alignment.topLeft,
                            end: Alignment
                                .bottomRight)),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Image.asset(
                        // 1 dragon
                        // 2 tiger

                        itemsDataHistory[index].number == 1
                            ? Assets.dragontigerIcDtD
                            : itemsDataHistory[index].number == 2
                            ? Assets.dragontigerIcDtT:
                        Assets.dragontigerIcDtTie,
                      ),
                    )
                ),
                title:  Text(
                  itemsDataHistory[index].gamesno.toString(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                subtitle:  Text(
                    itemsDataHistory[index].createdAt.toString(),
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey)),
                trailing: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.end,
                  children: [
                    Container(
                      height: height * 0.042,
                      width: width * 0.2,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              10),
                          border: Border.all(
                              color: itemsDataHistory[index].status==0? AppColors.orangeColor:itemsDataHistory[index].status==2?
                              AppColors
                                  .red: Colors.green)),
                      child: Center(
                        child:  Text(
                          itemsDataHistory[index].status==2?'Failed':itemsDataHistory[index].status==0?'Pending':'Succeed',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight:
                              FontWeight.w700,
                              color:
                              itemsDataHistory[index].status==0?Colors.orange:
                              itemsDataHistory[index].status==2?Colors.red
                                  : Colors.green
                          ),
                        ),
                      ),
                    ),
                    Text(
                      itemsDataHistory[index].status==0?'--':
                      itemsDataHistory[index].status==2?'- ₹${itemsDataHistory[index].amount.toStringAsFixed(2)}':'+ ₹${itemsDataHistory[index].winAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight:
                          FontWeight.w700,
                          color: itemsDataHistory[index].status==0?Colors.orange:itemsDataHistory[index].status==2?
                          AppColors
                              .red: Colors.green),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        const Align(
                            alignment:
                            Alignment.topLeft,
                            child: Text(
                              'Details',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight:
                                  FontWeight
                                      .w900,
                                  color:
                                  Colors.white),
                            )),
                        const SizedBox(height: 8.0),
                        Container(
                          height: height * 0.08,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(10),
                              color: AppColors
                                  .FirstColor),
                          child: Padding(
                            padding:
                            const EdgeInsets
                                .all(8.0),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .start,
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                const Text(
                                  'order number',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight
                                          .w700,
                                      color: Colors
                                          .white),
                                ),
                                const SizedBox(
                                    height: 4.0),
                                Text(
                                  itemsDataHistory[index].orderId.toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight:
                                      FontWeight
                                          .w700,
                                      color: Colors
                                          .white),
                                )
                              ],
                            ),
                          ),
                        ),
                        historyDetails(
                            'Period',
                            itemsDataHistory[index].gamesno.toString(),
                            Colors.white),
                        historyDetails(
                            'Purchase amount',
                            itemsDataHistory[index].amount.toString(),
                            Colors.white),
                        historyDetails(
                            'Amount after tax',
                            itemsDataHistory[index].tradeAmount.toString(),
                            Colors.red),
                        historyDetails('Tax',
                            itemsDataHistory[index].commission.toString(), Colors.white),
                        historyWinDetails(
                            'Result',
                            itemsDataHistory[index].winNumber==null? '--': '${itemsDataHistory[index].winNumber}, ',

                            itemsDataHistory[index].winNumber==1?"Dragon": itemsDataHistory[index].winNumber==2?"Tiger":"Tie",

                            Colors.white,

                            itemsDataHistory[index].winNumber==1?const Color(0xff56d5e5):
                            itemsDataHistory[index].winNumber==2?Colors.red:Colors.green

                        ),
                        historyDetails('Select',
                            itemsDataHistory[index].number==1?'Dragon':itemsDataHistory[index].number==2?'Tiger':"Tie",
                            Colors.white
                        ),
                        historyDetails('Status',
                            itemsDataHistory[index].status==0?'Unpaid':
                            itemsDataHistory[index].status==2?
                            'Failed':'Succeed', itemsDataHistory[index].status==0?Colors.white:itemsDataHistory[index].status==2?Colors.red:Colors.green),
                        historyDetails('Win/Loss',
                            itemsDataHistory[index].status==0?'--': '₹${itemsDataHistory[index].winAmount.toStringAsFixed(2)}', itemsDataHistory[index].status==0?Colors.white:itemsDataHistory[index].status==2? Colors.red:Colors.green),
                        historyDetails(
                            'Order time',
                            itemsDataHistory[index].createdAt.toString(),
                            Colors.white),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: limitResult == 0
                    ? () {}
                    : () {
                  setState(() {
                    pageNumber--;
                    limitResult = limitResult - 10;
                    offsetResult = offsetResult - 10;
                  });
                  setState(() {});
                  gameHistory();
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: AppColors.loginSecondryGrad,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.navigate_before,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              textWidget(
                text: '$pageNumber/${itemsDataHistory.length}',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryTextColor,
                maxLines: 1,
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    limitResult = limitResult + 10;
                    offsetResult = offsetResult + 10;
                    pageNumber++;
                  });
                  setState(() {});
                  gameHistory();
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.10,
                  decoration: BoxDecoration(
                    gradient: AppColors.loginSecondryGrad,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.navigate_next,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),

    );
  }
  int limitResult = 0;
  int pageNumber = 1;
  historyDetails(String title, String subtitle, Color subColor) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Container(
          height: height * 0.05,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.FirstColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: subColor),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  historyWinDetails(String title, String subtitle, String subtitle1,
      Color subColor, Color subColor1) {
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Container(
          height: height * 0.05,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.FirstColor),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: subColor),
                    ),
                    Text(
                      subtitle1,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: subColor1),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  // int? responseStatuscode;
  // UserViewProvider userProvider = UserViewProvider();
  //
  // int offsetResult = 0;
  // List<BettingHistoryModel> items = [];
  // Future<void> BettingHistory() async {
  //
  //   UserModel user = await userProvider.getUser();
  //   String token = user.id.toString();
  //   final response = await http.get(
  //     Uri.parse('${ApiUrl.betHistory}$token&game_id=${widget.gameid}&limit=10&offset=$offsetResult'),
  //   );
  //   if (kDebugMode) {
  //     print('${ApiUrl.betHistory}$token&game_id=${widget.gameid}&limit=10&offset=0');
  //     print('betHistory+token');
  //   }
  //
  //   setState(() {
  //     responseStatuscode = response.statusCode;
  //   });
  //
  //   if (response.statusCode == 200) {
  //     final List<dynamic> responseData = json.decode(response.body)['data'];
  //     setState(() {
  //       items = responseData.map((item) => BettingHistoryModel.fromJson(item)).toList();
  //
  //     });
  //   } else if (response.statusCode == 400) {
  //     if (kDebugMode) {
  //       print('Data not found');
  //     }
  //   } else {
  //     setState(() {
  //       items = [];
  //     });
  //     throw Exception('Failed to load data');
  //   }
  // }

  int? responseStatusCode;

  int offsetResult = 0;
  List<BettingHistoryModel> itemsDataHistory = [];

  UserViewProvider userProvider = UserViewProvider();


  Future<void> gameHistory() async {
    try {
      // Fetch userId
      UserModel user = await userProvider.getUser();
      String token = user.id.toString();

      final response = await http.post(
        Uri.parse(ApiUrl.gameHistory),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
        },
        body: jsonEncode(<String, String>{
          "game_id": widget.gameid.toString(),
          "userid": token,
          "limit": "10",
          // "offset": offset // Uncomment if offset is required
        }),
      );

      // Handle the response
      setState(() {
        responseStatusCode = response.statusCode;
      });

      if (response.statusCode == 200) {
        // Parse the response data
        final List<dynamic> responseData = json.decode(response.body)['data'];
        setState(() {
          itemsDataHistory = responseData
              .map((item) => BettingHistoryModel.fromJson(item))
              .toList();
        });

        if (kDebugMode) {
          print('Response Data: $responseData');
          print('API URL: ${ApiUrl.gameHistory}');
          print('Request successful.');
        }
      } else if (response.statusCode == 400) {
        // Handle specific client error
        if (kDebugMode) {
          print('Error 400: Bad Request.');
        }
      } else {
        // Handle other response errors
        setState(() {
          itemsDataHistory = [];
        });
        if (kDebugMode) {
          print('Error ${response.statusCode}: ${response.reasonPhrase}');
        }
      }
    } catch (e) {
      // Handle unexpected errors
      setState(() {
        itemsDataHistory = [];
      });
      if (kDebugMode) {
        print('Exception occurred: $e');
      }
    }
  }


}
