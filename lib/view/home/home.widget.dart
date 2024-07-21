import 'package:flutter/material.dart';
import 'package:horizon/core/extensions/context_extension.dart';
import 'package:horizon/core/extensions/widget_extension.dart';
import 'package:horizon/view/home/profile.model.dart';

/// Created by Balaji Malathi on 7/21/2024 at 21:13.

class ProfileCardWidget extends StatelessWidget {
  final ProfileModel profile;

  const ProfileCardWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormalAll,
      decoration: BoxDecoration(
          border: Border.all(color: context.colors.secondary),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.name ?? '',
                style: context.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                profile.employeeId ?? '',
                style: context.textTheme.labelLarge,
              ),
            ],
          )
        ].divide(SizedBox(
          width: 8,
        )),
      ),
    );
  }
}
