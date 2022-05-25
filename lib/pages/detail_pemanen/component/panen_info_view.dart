import 'package:flutter/material.dart';

import '../../../component/pm_asset.dart';
import '../../../core/constants/assets.dart';
import '../../../theme/theme.dart';

class PanenInfoView extends StatelessWidget {
  const PanenInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyBlock = ['A21', 'A22', 'A23', 'A25', 'A26'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Panen Tanggal',
                      style: labelBold,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        PmAsset(IconAsset.getIconPath('calendar.svg')),
                        const SizedBox(width: 8),
                        Text(
                          'Panen Tanggal',
                          style: labelRegular,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hasil Panen',
                      style: labelBold,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '2.31 Ha 5.800 Kg 784 Jjg',
                      style: labelRegular,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 28),
          Text(
            'Block Panen Kemarin',
            style: labelBold,
          ),
          const SizedBox(height: 8),
          Wrap(
            children: List.generate(
              dummyBlock.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: primary,
                  ),
                ),
                child: Text(
                  dummyBlock[index],
                  style: labelRegular.copyWith(color: primary),
                ),
              ),
            ),
          ),
          const SizedBox(height: 44),
          const Divider(),
        ],
      ),
    );
  }
}
