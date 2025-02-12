import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:stormaviator/model/user_model.dart';
import 'package:stormaviator/res/aap_colors.dart';
import 'package:stormaviator/res/api_urls.dart';
import 'package:stormaviator/res/components/app_btn.dart';
import 'package:stormaviator/res/components/text_widget.dart';
import 'package:stormaviator/generated/assets.dart';
import 'package:stormaviator/res/provider/user_view_provider.dart';

class UploadScreenshots extends StatefulWidget {
  final String amount;

  const UploadScreenshots({super.key, required this.amount});

  @override
  State<UploadScreenshots> createState() => _UploadScreenshotsState();
}

class _UploadScreenshotsState extends State<UploadScreenshots> {
  String imagePath = "";
  String uploadedImageUrl = "";
  String qrCodeUrl = "";
  String walletAddress = "";

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    fetchQrData();
  }

  Future<void> fetchQrData() async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.depositQR),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"type": "1"}),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse["data"] != null && jsonResponse["data"].isNotEmpty) {
          var data = jsonResponse["data"][0];

          setState(() {
            qrCodeUrl = data["qr_code"] ?? '';
            walletAddress = data["wallet_address"] ?? '';
          });
        } else {
          setState(() {
            qrCodeUrl = '';
            walletAddress = '';
          });
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching QR data: $e");
      }
      setState(() {
        qrCodeUrl = '';
        walletAddress = '';
      });
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path;
      });
    }
  }

  UserViewProvider userProvider = UserViewProvider();

  Future<void> _uploadImage(File imageFile) async {

    UserModel user = await userProvider.getUser();
    String userid = user.id.toString();
    try {
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      print(base64Image);

      var body = {
        "user_id": userid,
        "cash": widget.amount,
        "type": "1",
        "screenshot": base64Image,
      };

      // Make the POST request
      var response = await http.post(
        Uri.parse(ApiUrl.usdtpayinNew),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        print(base64Image);
        print("base64Image");
        String message = responseData["message"];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
        Navigator.pop(context);
      } else {
        if (kDebugMode) {
          print("Image upload failed with status code: ${response.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error uploading image: $e");
      }
    }
  }
  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      context: context,
      builder: (BuildContext bc) {
        return SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: const Text("Camera"),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: const Text("Gallery"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.browntextprimary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(Assets.iconsArrowBack),
          ),
        ),
        title: textWidget(
            text: 'Upload Screenshot',
            fontSize: 25,
            color: AppColors.primaryTextColor),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text("Total amount: ${widget.amount}",
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Center(
            child: qrCodeUrl.isNotEmpty
                ? Image.network(qrCodeUrl.toString(),
                    height: 250, width: 250, fit: BoxFit.cover)
                : const CircularProgressIndicator(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textWidget(
                  text: walletAddress.isNotEmpty
                      ? walletAddress
                      : 'Fetching Wallet Address...',
                  fontSize: 12,
                  color: AppColors.blackColor),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: walletAddress.toString()));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Wallet Address Copied!")),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blackColor,
                  ),
                  child: textWidget(
                      text: "Copy", fontSize: 15, color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
            child: uploadedImageUrl.isNotEmpty
                ? Image.network(uploadedImageUrl,
                height: 250, width: 250, fit: BoxFit.cover)
                : imagePath.isNotEmpty
                ? Image.file(File(imagePath),
                height: 250, width: 250, fit: BoxFit.cover)
                : const Text("No image selected"),
          ),
          const SizedBox(height: 20),
          Center(
            child: AppBtn(
              width: 200,
              onTap: () => _settingModalBottomSheet(context),
              title: "Upload Screenshot",
              gradient: AppColors.containerGradient,
            ),
          ),
          const SizedBox(height: 20),
          AppBtn(
            onTap: () {
              if (uploadedImageUrl.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Image uploaded successfully!")),
                );
              } else if (imagePath.isNotEmpty) {
                              _uploadImage(File(imagePath)).then((_) {
                }).catchError((e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error uploading image: $e")),
                  );
                });
              } else {
                // Show a SnackBar if no image is selected
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please select an image first.")),
                );
              }
            },
            title: "Confirm",
          )

        ],
      ),
    );
  }
}
