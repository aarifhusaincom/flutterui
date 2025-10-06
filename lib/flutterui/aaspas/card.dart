import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AaspasUiCard extends StatelessWidget {
  AaspasUiCard({super.key});

  /// Card Visibility Boolean

  bool shopListCard = false;
  bool serviceListCard = false;
  bool propertyListCard = false;

  /// Common Properties
  String? title;
  String? subtitle;
  String? dp;
  bool? verified;
  String? phone;
  String? area;
  VoidCallback? onPress;

  /// Aaspas Shop Special Properties
  bool? anyJob;
  String? distance;
  double? lat;
  double? long;
  String? address;

  AaspasUiCard.shopListCard({
    super.key,
    this.anyJob,
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
  }) : shopListCard = true;

  /// Aaspas Service Special Properties
  int? serviceCharge;
  String? category;

  AaspasUiCard.serviceListCard({
    super.key,
    this.title,
    this.dp,
    this.serviceCharge,
    this.category,
    this.area,
    this.phone,
    this.verified = false,

    /// Functions
    this.onPress,
  }) : serviceListCard = true;

  /// Aaspas Property Special Properties
  int? totalArea;
  String? itemType;
  String? city;

  AaspasUiCard.propertyListCard({
    super.key,
    this.title,
    this.dp,
    this.totalArea,
    this.itemType,
    this.area,
    this.city,
    this.phone,
    this.onPress,
  }) : propertyListCard = true;

  @override
  Widget build(BuildContext context) {
    if (shopListCard) {
      return _shopListCard(context);
    }

    if (serviceListCard) {
      return _serviceListCard(context);
    }
    if (propertyListCard) {
      return _propertyListCard(context);
    }

    return Container(
      color: Colors.grey,
      width: double.infinity,
      height: 50,
      child: Text("No Widget found"),
    );
  }

  Widget _shopListCard(BuildContext context) {
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: dp!,
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                      placeholder: (context, url) => Image.asset(
                        'assets/images/aaspas_shopPlaceholder.png',
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/aaspas_shopPlaceholder.png',
                      ),
                    ),
                    if (anyJob == true)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 50,
                          height: 22,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            "Job",
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.labelMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                  ],
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

  Widget _serviceListCard(BuildContext context) {
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
                      Image.asset('assets/images/aaspas_default_avatar.png'),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/aaspas_default_avatar.png'),
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
                                constraints: BoxConstraints(maxWidth: 100),
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
                                    category ?? "No Category",
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
                                constraints: BoxConstraints(maxWidth: 100),
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
                                    area ?? "No area",
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

  Widget _propertyListCard(BuildContext context) {
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
                      Image.asset('assets/images/aaspas_default_avatar.png'),
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/images/aaspas_default_avatar.png'),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

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
                          padding: EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 4,
                          ),

                          decoration: BoxDecoration(
                            color: Color(0xFFF6EEFF),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "${totalArea ?? 0} Sqft Area",
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
                    Text(
                      itemType ?? "No item",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: Color(0xFF49454F),
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "${area ?? "No area"}, ${city ?? "No city"}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                              textStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              color: Color(0xFF1E1A23),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            log("WhatsApp button tapped");
                          },
                          child: Container(
                            // width: 110,
                            height: 30,
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Color(0xFF0B8F00),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 10,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/aaspas_logo-whatsapp-in-property-list-card.svg",
                                  width: 18,
                                  height: 18,
                                ),
                                Text(
                                  "WhatsApp",
                                  style: GoogleFonts.roboto(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(color: Colors.white),
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
