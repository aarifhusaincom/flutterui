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
  String? dp;

  /// Card Visibility Boolean
  // bool basic = false;
  // bool whatsappChat = false;
  bool aaspasShopListCard = false;
  bool aaspasServiceListCard = false;

  /// Basic Card Special Properties
  // Widget? trailing;
  //
  /// Basic Card
  // FlutterUiCard.basic({
  //   super.key,
  //   this.title,
  //   this.subtitle,
  //   this.dp,
  //   this.trailing,
  // }) : basic = true;

  /// WhatsApp Special Properties

  // String? lastMessageTime = 'Yesterday';
  // bool? isSeen;
  // int? unreadMessages;

  /// for WhatsApp chat screen card
  // FlutterUiCard.whatsappChat({
  //   super.key,
  //   this.title,
  //   this.subtitle,
  //   this.dp,
  //   this.lastMessageTime,
  //   this.isSeen = false,
  //   this.unreadMessages,
  // }) : whatsappChat = true;

  /// Aaspas Special Properties
  String? distance;
  double? lat;
  double? long;
  String? address;
  bool? verified;

  /// Functions
  VoidCallback? onPress;

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

  /// Aaspas Service Special Properties
  int? serviceCharge;
  String? area;
  String? city;
  String? phone;

  /// Named Constructor for Aaspas Service List Card
  FlutterUiCard.aaspasServiceListCard({
    super.key,
    this.title,
    this.dp,
    this.serviceCharge,
    this.area,
    this.city,
    this.phone,
    this.verified = false,

    /// Functions
    this.onPress,
  }) : aaspasServiceListCard = true;

  @override
  Widget build(BuildContext context) {
    // if (whatsappChat) {
    //   return _whatsappChatCard(context);
    // }
    if (aaspasShopListCard) {
      return _aaspasShopListCard(context);
    }

    if (aaspasServiceListCard) {
      return _aaspasServiceListCard(context);
    }

    return Container(
      color: Colors.grey,
      width: double.infinity,
      height: 50,
      child: Text("No Widget found"),
    );
  }

  // Widget _basicCard(BuildContext context) {
  //   return Text("data");
  // }

  // Widget _whatsappChatCard(BuildContext context) {
  //   return Container(
  //     color: Colors.white.withAlpha(0),
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Flexible(
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               spacing: 12,
  //               mainAxisSize: MainAxisSize.max,
  //               children: [
  //                 SizedBox(
  //                   height: 48,
  //                   width: 48,
  //                   child: CircleAvatar(
  //                     radius: 24,
  //                     backgroundColor: Colors.grey[200],
  //                     child: ClipOval(
  //                       child: CachedNetworkImage(
  //                         imageUrl: dp!,
  //                         fit: BoxFit.cover,
  //                         width: 48,
  //                         height: 48,
  //                         placeholder: (context, url) =>
  //                             Image.asset('assets/images/default_avatar.png'),
  //                         errorWidget: (context, url, error) =>
  //                             Image.asset('assets/images/default_avatar.png'),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         "Hasnain Bhai",
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: GoogleFonts.roboto(
  //                           textStyle: TextStyle(
  //                             fontSize: 18,
  //                             fontWeight: FontWeight.w600,
  //                           ),
  //                         ),
  //                       ),
  //                       Text(
  //                         "Project ka repo nhi aaya h-",
  //                         maxLines: 1,
  //                         overflow: TextOverflow.ellipsis,
  //                         style: GoogleFonts.roboto(
  //                           textStyle: TextStyle(
  //                             fontSize: 15,
  //                             fontWeight: FontWeight.w500,
  //                             color: Colors.black.withAlpha(128),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.end,
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text("data"),
  //               Container(
  //                 width: 20,
  //                 height: 20,
  //                 alignment: Alignment.center,
  //                 decoration: BoxDecoration(
  //                   color: Colors.green,
  //                   borderRadius: BorderRadius.circular(10),
  //                 ),
  //                 child: Text("1"),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _aaspasShopListCard(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        color: Colors.purple.withAlpha(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
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
                        Expanded(
                          child: Text(
                            title ?? "No title",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                              color: Color(0xFF1D1B20),
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
                              textStyle: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(color: Color(0xFF732FCB)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            address ?? "No address",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              color: Color(0xFF49454F),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
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

  Widget _aaspasServiceListCard(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        color: Colors.purple.withAlpha(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
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
                        Expanded(
                          child: Text(
                            title ?? "No title",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(maxWidth: 58),

                          child: Text(
                            "₹ ${serviceCharge ?? 0} /-",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(color: Color(0xFF732FCB)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.center,

                            spacing: 10,
                            runSpacing: 10,

                            children: [
                              Container(
                                constraints: BoxConstraints(maxWidth: 150),
                                height: 30,
                                // alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF4EBF8),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 6,
                                  ),
                                  child: Text(
                                    "Electrician",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(color: Color(0xFF1E1A23)),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(maxWidth: 150),
                                height: 30,
                                // alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF4EBF8),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 6,
                                  ),
                                  child: Text(
                                    "Khajrana",
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .labelMedium
                                          ?.copyWith(color: Color(0xFF1E1A23)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // if (onDirectionTap != null) {
                            //   onDirectionTap?.call(lat: lat, long: long);
                            // }

                            log("Call button tapped");
                          },
                          child: Container(
                            width: 80,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFFDFC6FF),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/aaspas_phone-flip.svg",
                                  width: 15,
                                  height: 15,
                                ),
                                Text(
                                  "Call",
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(
                                      context,
                                    ).textTheme.titleSmall,
                                  ),
                                ),
                              ],
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
