import 'package:flutter/material.dart';

import '../../../component/pm_asset.dart';
import '../../../core/constants/assets.dart';
import '../../../theme/theme.dart';

class MutuAncakView extends StatefulWidget {
  const MutuAncakView({Key? key, required this.ancakMutuList})
      : super(key: key);

  final List<dynamic> ancakMutuList;

  @override
  State<MutuAncakView> createState() => _MutuAncakViewState();
}

class _MutuAncakViewState extends State<MutuAncakView> {
  @override
  Widget build(BuildContext context) {
    if (widget.ancakMutuList.isEmpty) {
      return Column(
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
      );
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: widget.ancakMutuList.length,
          itemBuilder: (_, index) => _MutuAncakItem(
            mutuAncak: widget.ancakMutuList[index],
          ),
        ),
      );
    }
  }
}

class _MutuAncakItem extends StatelessWidget {
  const _MutuAncakItem({Key? key, this.mutuAncak}) : super(key: key);

  final dynamic mutuAncak;

  @override
  Widget build(BuildContext context) {
    String rowMap = (mutuAncak['row'] as List<String>)
        .map((e) => 'Baris $e')
        .toList()
        .join(', ');

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: black200),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text.rich(
                TextSpan(
                  text: 'Block : ${mutuAncak['block']}   ',
                  children: [
                    TextSpan(
                      text: mutuAncak['type'],
                      style: labelRegular.copyWith(
                        color: mutuAncak['type'] == 'Tunggal'
                            ? info500
                            : success500,
                      ),
                    ),
                  ],
                  style: headingRegular,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.more_vert_rounded,
                color: black,
              )
            ],
          ),
          const SizedBox(height: 4),
          Text(
            rowMap,
            style: bodyRegular.copyWith(color: black400),
          ),
        ],
      ),
    );
  }
}
