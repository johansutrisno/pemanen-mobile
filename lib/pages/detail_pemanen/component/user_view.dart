import 'package:flutter/material.dart';

import '../../../component/pm_asset.dart';
import '../../../core/constants/assets.dart';
import '../../../theme/theme.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 32.0),
      child: Row(
        children: [
          PmAsset(
            ImageAsset.getPath('dummy-profile.png'),
            width: 56,
            height: 56,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sulaiman Johan',
                style: headingMedium,
              ),
              Text(
                '293019293',
                style: bodyRegular,
              ),
            ],
          )
        ],
      ),
    );
  }
}
