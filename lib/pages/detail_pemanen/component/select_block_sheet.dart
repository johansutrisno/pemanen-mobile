import 'package:flutter/material.dart';
import 'package:pemanen_mobile/component/pm_asset.dart';
import 'package:pemanen_mobile/core/constants/assets.dart';
import 'package:pemanen_mobile/pages/detail_pemanen/component/select_row_sheet.dart';
import 'package:pemanen_mobile/theme/theme.dart';

class SelectBlockSheet {
  static Future show(BuildContext context) {
    final List<String> dummyBlock = [
      'Block : A21',
      'Block : A22',
      'Block : A23',
      'Block : A25',
      'Block : A26',
    ];

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (_) => Wrap(
        children: [
          Column(
            children: [
              Container(
                width: 84,
                height: 8,
                decoration: BoxDecoration(
                  color: black100,
                  borderRadius: BorderRadius.circular(100),
                ),
                margin: const EdgeInsets.only(top: 24, bottom: 12),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pilih Block',
                          style: headingMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Langkah 1 dari 2',
                          style: labelRegular.copyWith(color: primary),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: mediumEmphasis,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Column(
                children: List.generate(
                  dummyBlock.length,
                  (index) => InkWell(
                    onTap: () => SelectRowSheet.show(context),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: black50,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Text(
                            dummyBlock[index],
                            style: bodyBold.copyWith(color: highEmphasis),
                          ),
                          const Spacer(),
                          PmAsset(
                            IconAsset.getIconPath('arrow-right-2.svg'),
                            width: 24,
                            height: 24,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
