import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFunctions {
  AppFunctions._privateConstructor();

  static final AppFunctions instance = AppFunctions._privateConstructor();

  factory AppFunctions() {
    return instance;
  }

  Future<void> openDialer(String? phoneNumber) async {
    final String cleanNumber = await removeHiddenCharacters(phoneNumber ?? "");
    if (cleanNumber.isEmpty) {
      Utils.displayToast("Don't have any phone number");
      return;
    }
    final Uri launchUri = Uri(scheme: 'tel', path: cleanNumber);

    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        throw 'Could not launch ${launchUri.path}';
      }
    } catch (e) {
      Utils.displayToast(e.toString());
    }
  }

  Future<void> openWhatsApp(BuildContext context, String? phoneNumber,
      [String? message]) async {
    final String cleanNumber = await removeHiddenCharacters(phoneNumber ?? "");

    if (cleanNumber.isEmpty) {
      Utils.displayToast("Don't have any whatsapp number");
      return;
    }

    var whatsappUrlPlatform = "https://wa.me/$cleanNumber";

    // Append the message if provided
    if (message != null && message.isNotEmpty) {
      // whatsappUrlAndroid += "&text=${Uri.encodeComponent(message)}";
      whatsappUrlPlatform += "?text=${Uri.encodeComponent(message)}";
    }

    final Uri whatsappUrl = Uri.parse(whatsappUrlPlatform);

    // Check if the URL can be launched and launch it
    try {
      if (await canLaunchUrl(whatsappUrl)) {
        await launchUrl(whatsappUrl);
      } else {
        throw 'Could not launch $whatsappUrl';
      }
    } catch (e) {
      Utils.displayToast(e.toString());
    }
  }

  Future<void> openEmailApp(String emailAddress) async {
    if (emailAddress.isEmpty) {
      Utils.displayToast("Don't have any email address");
      return;
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query: Uri.encodeFull('subject=&body='),
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        throw 'Could not launch email: ${emailUri.path}';
      }
    } catch (e) {
      Utils.displayToast(e.toString());
    }
  }

  Future<void> openWebUrl(String url) async {
    if (url.isEmpty) {
      Utils.displayToast("Don't have any url");
      return;
    }

    final Uri launchUri = Uri.parse(url);

    try {
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        throw 'Could not launch $launchUri';
      }
    } catch (e) {
      Utils.displayToast(e.toString());
    }
  }

  Future<String> removeHiddenCharacters(String input) async {
    return input.replaceAll(RegExp(r'[^+\d]'), '');
  }
}
