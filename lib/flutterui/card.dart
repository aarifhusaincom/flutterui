import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterUiCard extends StatelessWidget {
  FlutterUiCard({super.key});

  /// Common Properties
  String? title;
  String? subtitle;

  /// Card Visibility Boolean
  bool basic = false;
  bool whatsappChat = false;
  bool aaspasShopListCard = false;

  /// Basic Card Special Properties
  Widget? trailing;

  /// Basic Card
  FlutterUiCard.basic({
    super.key,
    this.title,
    this.subtitle,
    this.dp,
    this.trailing,
  }) : basic = true;

  /// WhatsApp Special Properties
  // String? dp = 'https://picsum.photos/300/300?grayscale';
  String? dp =
      'https://images.unsplash.com/photo-1743360544694-1afb3e67984a?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
  String? lastMessageTime = 'Yesterday';
  bool? isSeen;
  int? unreadMessages;

  /// for WhatsApp chat screen card
  FlutterUiCard.whatsappChat({
    super.key,
    this.title,
    this.subtitle,
    this.dp,
    this.lastMessageTime,
    this.isSeen = false,
    this.unreadMessages,
  }) : whatsappChat = true;

  /// Aaspas Special Properties
  String? distance;
  double? lat;
  double? long;
  String? address;
  bool? verified;

  /// Functions
  VoidCallback? onPress;

  // void Function({double? lat, double? long})? onDirectionTap;

  /// Named Constructor for Aaspas Shop List Card
  FlutterUiCard.aaspasShopListCard({
    super.key,
    this.title,
    this.subtitle,
    this.dp,
    this.distance,
    this.address,
    this.lat,
    this.long,
    this.verified = false,

    /// Functions
    this.onPress,
    // this.onDirectionTap,
  }) : aaspasShopListCard = true;

  @override
  Widget build(BuildContext context) {
    if (whatsappChat) {
      return _whatsappChatCard();
    }
    if (aaspasShopListCard) {
      return _aaspasShopListCard();
    }

    return _basicCard();
  }

  Widget _basicCard() {
    return Text("data");
  }

  Widget _whatsappChatCard() {
    return Container(
      color: Colors.white.withAlpha(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 12,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 48,
                    width: 48,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[200],
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: dp!,
                          fit: BoxFit.cover,
                          width: 48,
                          height: 48,
                          placeholder: (context, url) =>
                              Image.asset('assets/images/default_avatar.png'),
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/images/default_avatar.png'),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hasnain Bhai",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(
                          "Project ka repo nhi aaya h-",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withAlpha(128),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("data"),
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("1"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _aaspasShopListCard() {
    return InkWell(
      onTap: onPress,
      child: Container(
        color: Colors.purple.withAlpha(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 80,
                width: 80,
                child: CachedNetworkImage(
                  imageUrl: dp!,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                  placeholder: (context, url) =>
                      Image.asset('assets/images/aaspas_shopPlaceholder.png'),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/aaspas_shopPlaceholder.png'),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 6,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (verified == true)
                          SvgPicture.asset(
                            "assets/icons/aaspas_verified_icon.svg",
                            width: 20,
                            height: 20,
                          ),
                        if (verified == true) SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            title ?? "No title",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 58),

                          child: Text(
                            distance ?? "NA KM",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF732FCB),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            address ?? "No address",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withAlpha(128),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // if (onDirectionTap != null) {
                            //   onDirectionTap?.call(lat: lat, long: long);
                            // }

                            log("Direction icon tapped");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 47,
                            child: SvgPicture.asset(
                              "assets/icons/aaspas_direction_icon.svg",
                              width: 36,
                              height: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
