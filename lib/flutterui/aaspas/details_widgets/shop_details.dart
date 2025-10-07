import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopDetails extends StatelessWidget {
  final String? openTime;
  final String? closeTime;
  final List<String>? weekDays;
  final String? shopName;
  final bool verified;
  final String? area;
  final String? address;
  final List<String>? shopType;
  final String? distance;
  final String? lat;
  final String? long;
  final String? description;
  final String? phone;

  /// delete there variable
  final bool isOpen = true;
  final bool isOpenDay = true;

  const ShopDetails({
    super.key,
    this.openTime,
    this.closeTime,
    this.weekDays,
    this.shopName,
    this.verified = false,
    this.area,
    this.address,
    this.shopType,
    this.distance,
    this.lat,
    this.long,
    this.description,
    this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 12,
        children: [
          _shopTiming(context),

          _shopNameAndVerificationMark(context),

          _shopAddress(context),

          _areaCityAndShopType(context),

          _shopDescription(context),

          _directionCopyShare(context, distance: distance),

          _callAndWhatsapp(context, phone: phone),
        ],
      ),
    );
  }

  /// Widget Fragments

  Widget _shopTiming(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.end,
            runSpacing: 6,
            spacing: 6,
            children: [
              Text(
                isOpen ? "open" : "close",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF0B8F00),
                  ),
                ),
              ),
              Text(
                "$openTime - $closeTime",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1E1A23),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.end,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.end,
            runSpacing: 4,
            spacing: 4,
            children: [
              _weekDayContainer(context, daySymbol: 'M', isThisDayOpen: true),
              _weekDayContainer(context, daySymbol: 'T', isThisDayOpen: true),
              _weekDayContainer(context, daySymbol: 'W', isThisDayOpen: true),
              _weekDayContainer(context, daySymbol: 'T', isThisDayOpen: true),
              _weekDayContainer(context, daySymbol: 'F', isThisDayOpen: false),
              _weekDayContainer(context, daySymbol: 'S', isThisDayOpen: true),
              _weekDayContainer(context, daySymbol: 'S', isThisDayOpen: false),
            ],
          ),
        ),
      ],
    );
  }

  Widget _weekDayContainer(
    BuildContext context, {
    required String daySymbol,
    isThisDayOpen = false,
  }) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: isThisDayOpen ? Color(0xFFDFC6FF) : Color(0xFFFEF7FF),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          daySymbol,
          style: GoogleFonts.roboto(
            textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: isThisDayOpen ? Color(0xFF1E1A23) : Color(0xFFCDC3D6),
            ),
          ),
        ),
      ),
    );
  }

  Widget _shopNameAndVerificationMark(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 6,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 3),
          child: SvgPicture.asset("assets/icons/aaspas_verified_icon.svg"),
        ),
        Expanded(
          child: Text(
            shopName ?? "No name",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Color(0xFF1E1A23),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _shopAddress(BuildContext context) {
    return Text(
      address ?? "No Address",
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.roboto(
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Color(0xFF4B4454),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _areaCityAndShopType(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Khajrana, Indore",
          style: GoogleFonts.roboto(
            textStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Color(0xFF732FCB)),
          ),
        ),
        Text(
          "Retail, Service",
          style: GoogleFonts.roboto(
            textStyle: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Color(0xFF732FCB)),
          ),
        ),
      ],
    );
  }

  Widget _shopDescription(BuildContext context) {
    return Text(
      description ?? "No Description",
      maxLines: 5,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.roboto(
        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Color(0xFF777777),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _callAndWhatsapp(BuildContext context, {String? phone}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            log("Call button tapped");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
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
                    textStyle: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            log("WhatsApp button tapped");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                    textStyle: Theme.of(
                      context,
                    ).textTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _directionCopyShare(BuildContext context, {String? distance}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xFFF4EBF8),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 6,
            children: [
              SvgPicture.asset("assets/icons/aaspas_location.svg"),
              Text(
                "Direction $distance",
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(
                    context,
                  ).textTheme.labelLarge?.copyWith(color: Color(0xFF1E1A23)),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            IconButton.filled(
              onPressed: () {},
              icon: Icon(Icons.copy_rounded, color: Color(0xFF732FCB)),
              // splashColor: Color(0xFFFAF0FE),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFFFAF0FE)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xFFF4EBF8),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                spacing: 6,
                children: [
                  SvgPicture.asset("assets/icons/aaspas_share.svg"),
                  Text(
                    "Share",
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.labelLarge
                          ?.copyWith(color: Color(0xFF732FCB)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
