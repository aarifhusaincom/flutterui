import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceDetails extends StatelessWidget {
  final String? category;
  final String? categoryBanner;
  final String? dp;
  final bool verified;
  final String? name;
  final int? age;
  final int? serviceCharge;
  final String? area;
  final String? city;
  final String? description;
  final String? phone;

  const ServiceDetails({
    super.key,
    this.category,
    this.categoryBanner,
    this.dp,
    this.verified = false,
    this.name,
    this.age,
    this.serviceCharge,
    this.area,
    this.city,
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
          _nameAndVerificationMark(context, name: name),
          _areaCityCopyShare(context, area: area, city: city),
          _description(context, description: description),
          _callAndWhatsapp(context, phone: phone),
        ],
      ),
    );
  }

  /// Widget Fragments

  Widget _nameAndVerificationMark(BuildContext context, {String? name}) {
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
            name ?? "No name",
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

  Widget _description(BuildContext context, {String? description}) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        description ?? "No Description",
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.roboto(
          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Color(0xFF777777),
            fontWeight: FontWeight.w500,
          ),
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

  Widget _areaCityCopyShare(
    BuildContext context, {
    String? area,
    String? city,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            "${area ?? "area"}, ${city ?? "city"}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.roboto(
              textStyle: Theme.of(
                context,
              ).textTheme.labelLarge?.copyWith(color: Color(0xFF732FCB)),
            ),
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
