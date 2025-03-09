import 'package:bookingapp/core/helpers/app_values.dart' show AppPadding;
import 'package:bookingapp/core/theming/colors.dart';
import 'package:bookingapp/core/theming/styles.dart';
import 'package:bookingapp/feature/organizer/domain/entity/organizer_entity.dart';
import 'package:flutter/material.dart';

class OrganizerboutTab extends StatelessWidget {
  const OrganizerboutTab({super.key, required this.organizerEntity});
  final OrganizerEntity organizerEntity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p20),
        child: RichText(
          text: TextSpan(
            style: TextStyles.font16Regular.copyWith(
              color: Colors.black,
            ), // Default text style
            children: [
              TextSpan(text: organizerEntity.about),
              TextSpan(
                text: "Read More",
                style: TextStyles.font16Regular.copyWith(
                  color: ColorsManager.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
