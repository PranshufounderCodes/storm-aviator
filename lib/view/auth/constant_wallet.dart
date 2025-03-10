import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stormaviator/generated/assets.dart';
import 'package:stormaviator/res/aap_colors.dart';
import 'package:stormaviator/res/components/app_btn.dart';
import 'package:stormaviator/res/components/text_widget.dart';
import 'package:stormaviator/res/provider/profile_provider.dart';
import 'package:stormaviator/utils/utils.dart';
import 'package:stormaviator/view/wallet/deposit_screen.dart';
import 'package:stormaviator/view/wallet/withdraw_screen.dart';

import '../../main.dart';

class ConstantWallet extends StatefulWidget {
  const ConstantWallet({super.key});

  @override
  State<ConstantWallet> createState() => _ConstantWalletState();
}

class _ConstantWalletState extends State<ConstantWallet> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileProvider>().fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, userData, child) {
        return Container(
          margin: const EdgeInsets.only(right: 10, left: 10),
          decoration: BoxDecoration(
            gradient: AppColors.primaryUnselectedGradient,
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
                image: AssetImage(Assets.imagesWalletbg), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      Assets.iconsGamewallet,
                      height: 30,
                    ),
                    textWidget(
                      text: '  Wallet Balance',
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.currency_rupee_outlined,
                        size: 20, color: Colors.white),
                    textWidget(
                      text: userData.totalWallet==null?"":userData.totalWallet.toStringAsFixed(2),
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        context.read<ProfileProvider>().fetchProfileData();
                        Utils.flushBarSuccessMessage('Wallet refresh ✔', context, Colors.white);
                      },
                      child: Image.asset(Assets.iconsTotalBal, height: 30),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppBtn(
                    titleColor: AppColors.primaryTextColor,
                    width: width * 0.4,
                    height: 38,
                    borderRadius: 8,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WithdrawScreen(),
                        ),
                      ).then((value) {
                        // Fetch wallet balance again after returning from Withdraw screen
                        context.read<ProfileProvider>().fetchProfileData();
                      });
                    },
                    title: 'Withdraw',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    gradient: AppColors.loginSecondryGrad,
                    hideBorder: true,
                  ),
                  AppBtn(
                    titleColor: AppColors.primaryTextColor,
                    width: width * 0.4,
                    height: 38,
                    borderRadius: 8,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DepositScreen(),
                        ),
                      ).then((value) {
                        // Fetch wallet balance again after returning from Deposit screen
                        context.read<ProfileProvider>().fetchProfileData();
                      });
                    },
                    gradient: AppColors.transparentgradient,
                    title: 'Deposit',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    border: Border.all(color: AppColors.primaryTextColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
