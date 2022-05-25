import 'package:flutter/material.dart';
import 'package:pemanen_mobile/component/pm_app_bar.dart';
import 'package:pemanen_mobile/component/pm_asset.dart';
import 'package:pemanen_mobile/core/constants/assets.dart';
import 'package:pemanen_mobile/pages/detail_pemanen/component/select_block_sheet.dart';
import 'package:pemanen_mobile/theme/theme.dart';

class DetailPemanenScreen extends StatefulWidget {
  const DetailPemanenScreen({Key? key}) : super(key: key);

  @override
  State<DetailPemanenScreen> createState() => _DetailPemanenScreenState();
}

class _DetailPemanenScreenState extends State<DetailPemanenScreen> {
  final _dummyBlock = ['A21', 'A22', 'A23', 'A25', 'A26'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PmAppBar(title: 'Detail Pemanen'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Row(
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
            const SizedBox(height: 32),
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
                _dummyBlock.length,
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
                    _dummyBlock[index],
                    style: labelRegular.copyWith(color: primary),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 44),
            const Divider(),
            const SizedBox(height: 60),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PmAsset(
                  ImageAsset.getPath('ilustrasi-empty.png'),
                  width: double.infinity,
                  height: 200,
                ),
                Text(
                  'Mutu Ancak Masih \nKosong',
                  style: bodyBold.copyWith(color: mediumEmphasis),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onPressedFab,
        backgroundColor: primary,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onPressedFab() async {
    await SelectBlockSheet.show(context);
  }
}
