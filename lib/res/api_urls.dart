class ApiUrl {
  static const String uploadimage = "${baseUrl}admin/uploads/";

  // static const String baseUrl ='https://stormaviator.usawin.vip/';
  static const String baseUrl ='https://root.stormaviator.in/';
  static const String configModel = "${baseUrl}api/";

  static const String login = "${configModel}login";
  static const String register = "${configModel}register";
  static const String aviatorHistory = '${baseUrl}aviator_history';
  static const String profile = "${configModel}profile?id=";
  static const String allTranscationType = "${configModel}transaction_history_list";
  static const String allTranscation = "${configModel}transaction_history?userid=";
  static const String depositWithdrawlStatusList = "${configModel}Status_list";

  static const String depositHistory = "${configModel}deposit_history?user_id=";

  static const String withdrawHistory = "${configModel}withdraw_history?user_id=";
  // static const String indianOnlinePayDeposit = "${configModel}userpayin";
  static const String indianPayDeposit = "${configModel}userpayin";
  static const String deposit = "${configModel}payin";
  static const String usdtPayin = "${configModel}usdt_payin";

  // https://root.stormaviator24.live/api/payin?user_id=67&cash=110&type=1
  static const String addacount = "${configModel}add_account";
  static const String addAccountView = "${configModel}Account_view?user_id=";
  static const String withdrawl = "${configModel}withdraw";
  static const String withdrawlUsdt = "${configModel}usdtwithdraw";
  static const String giftHistory = "${configModel}claim_list?userid=";
  static const String privacypolicy = "${configModel}privacy_policy";
  static const String customerService = "${configModel}customer_service";
  static const String changeAvtarList = "${configModel}image_all";
  static const String UpdateAvtarApi = "${configModel}update_avatar";
  static const String changePasswordApi = "${configModel}changePassword";
  static const String banner = "${configModel}slider_image_view";
  static const String mainWalletTransfer = "${configModel}main_wallet_transfer";

  static const String activityRewards = "${configModel}activity_rewards?userid=";
  static const String activityClaimRewards = "${configModel}activity_rewards_claim";
  static const String activityRewardsHistory = "${configModel}activity_rewards_history?userid=";

  static const String invitationBonusList = "${configModel}invitation_bonus_list?userid=";
  static const String invitationRecords = "${configModel}Invitation_records?userid=";
  static const String extraDeposit = "${configModel}extra_first_deposit_bonus?userid=";
  static const String attendanceList = "${configModel}attendance_List?userid=";
  static const String attendanceHistory = "${configModel}attendance_history?userid=";
  static const String attendanceClaim = "${configModel}attendance_claim";
  // static const String promotionScreen = "${configModel}level_getuserbyrefid?id=";
  static const String promotionScreen = "${configModel}agency-promotion-data-";
  static const String newSubordinateTabApi = "${configModel}new-subordinate?id=";
  static const String TierApi = "${configModel}tier";
  static const String SubdataApi = "${configModel}subordinate-data?id=";
  static const String CommissionDetailApi = "${configModel}commission_details?userid=";
  static const String allRules = "${configModel}all_rules?type=";
  static const String bettingRebateApi = "${configModel}betting_rebate_history?userid=";
  // static const String aviatorWebSocket = "http://13.235.103.93:3006";


  static const String aviatorBet = "${configModel}aviator_bet?uid=";
  static const String aviatorBetCancel = "${configModel}aviator_bet_cancel?userid=";
  static const String aviatorBetCashOut = "${configModel}aviator_cashout?salt=";
  static const String aviatorResult = "${configModel}aviator_last_five_result";
  static const String aviatorBetHistory = "${configModel}aviator_history?uid=";


  static const String resultList = "${configModel}results?game_id=";
  static const String betHistory = "${configModel}bet_history?userid=";
  static const String bettingApi = "${configModel}bet";
  static const String game_win = "${configModel}win_amount?userid=";
  static const String dragonBet = "${configModel}dragon_bet";


  static const String promotionCount = "${configModel}promotion_dashboard_count?id=";
  static const String walletdash = "${configModel}wallet_dashboard?id=";
  static const String aboutus = "${configModel}about_us?";
  static const String HowtoplayApi = "${baseUrl}admin/index.php/Mobile_app/howtoplay?game_id=";
  static const String beginnerapi = "${configModel}beginner_guied_line";
  static const String notificationapi = "${configModel}notification";
  static const String giftcardapi = "${configModel}giftCartApply?";
  static const String coinsapi = "${configModel}coins";
  static const String mlm = "${configModel}level_getuserbyrefid?id=";
  static const String feedback = "${configModel}feedback";
  static const String versionlink = "${configModel}version_apk_link";
  static const String profileUpdate = "${configModel}update_profile";

  // static const String getwayList = "${configModel}pay_modes?";
  static const String getwayList = "${configModel}pay_modes";
  static const String planMlm = "${configModel}mlm_plan";
  static const String termscon = "${configModel}terms_condition";
  static const String contact = "${configModel}contact_us";
  static const String AttendenceGet = "${configModel}attendance?";
  static const String attendenceDays = "${configModel}attendance_claim?userid=";
  static const String MLM_PLAN = "${configModel}level_getuserbyrefid?id=";
  static const String walletHistory = "${configModel}wallet_history?userid=";
  static const String paymentCheckStatus = "${configModel}payment_verified_done?orderid=";
  static const String extradepositPayment = "${configModel}extra_first_deposit?";

  static const String usdtdeposit = "https://winzy.live/admin/api/pending_payment.php";
  static const String usdtdepositHistory = "https://winzy.live/admin/api/pendingPayment_history.php?";
  static const String usdtQrcodeApi = "https://winzy.live/admin/index.php/Mahajongapi/usdt_slider";
  static const String usdtQrcodeImage = "https://admin.winzy.live/images/1711803944_IMG_20240330_180436.jpg";
  static const String userblock = "https://admin.winzy.live/api/auth-check-";

  // static const String sendotp = "https://root.winzy.app/api/sendSMS?";
  static const String sendotp = "https://otp.fctechteam.org/send_otp.php?";
  // static const String verifyotp = "https://root.winzy.app/api/verifyOTP?";
  static const String verifyotp = "https://otp.fctechteam.org/verifyotp.php?mobile=";
  static const String forgetPasswordUrl = "https://root.globalbet24.live/api/forget_pass";


  static const String plinkoBet = "${configModel}plinko_bet";
  static const String plinkoList = "${configModel}plinko_index_list?type=";
  static const String plinkoMultiplier = "${configModel}plinko_multiplier";
  static const String plinkoBetHistory = "${configModel}plinko_result?";

  ///andarbahar

  static const String gameHistory = '${baseUrl}api/bet_history?game_id=';
  static const String result = '${baseUrl}api/results?game_id=';
  static const String betPlaced = '${baseUrl}api/bet';
  static const String winAmount = '${baseUrl}api/win_amount?userid=';

  ///head tails

  static const String gameRules = '${baseUrl}api/rules?game_id=';


  ///vip
  static const String vipLevel = "${configModel}vip_level?userid=";
  static const String addMoney = "${configModel}add_money";
  static const String vipHistory = "${configModel}vip_level_history?userid=";

  static const String bonusClaim = "${configModel}invitation_bonus_claim";


  static const String depositQR = "${configModel}show_qr";
  static const String usdtpayinNew = "${configModel}usdt_payinn";






}