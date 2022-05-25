import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pemanen_mobile/component/pm_asset.dart';
import 'package:pemanen_mobile/component/pm_button.dart';
import 'package:pemanen_mobile/core/constants/assets.dart';
import 'package:pemanen_mobile/pages/detail_pemanen/component/row_spinner.dart';
import 'package:pemanen_mobile/theme/theme.dart';

class SelectRowSheet {
  static Future show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (_) => Wrap(
        children: const [
          _SelectRowView(),
        ],
      ),
      isScrollControlled: true,
    );
  }
}

class _SelectRowView extends StatefulWidget {
  const _SelectRowView({Key? key}) : super(key: key);

  @override
  State<_SelectRowView> createState() => _SelectRowViewState();
}

class _SelectRowViewState extends State<_SelectRowView> {
  String _selectedModel = 'Tunggal';
  int _selectedRow = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 84,
              height: 8,
              decoration: BoxDecoration(
                color: black100,
                borderRadius: BorderRadius.circular(100),
              ),
              margin: const EdgeInsets.only(top: 24, bottom: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Baris',
                    style: headingMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Langkah 2 dari 2',
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
          const SizedBox(height: 28),
          Text(
            'Model Pemeriksaan',
            style: labelBold.copyWith(color: highEmphasis),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: primary),
            ),
            child: Row(
              children: [
                _ModelItem(
                  title: 'Tunggal',
                  isSelected: _selectedModel == 'Tunggal',
                  onSelected: (value) {
                    setState(() {
                      _selectedModel = value;
                    });
                  },
                ),
                _ModelItem(
                  title: 'Kanan Kiri',
                  isSelected: _selectedModel == 'Kanan Kiri',
                  onSelected: (value) {
                    setState(() {
                      _selectedModel = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Nomor Baris',
            style: labelBold.copyWith(color: highEmphasis),
          ),
          const SizedBox(height: 8),
          RowSpinner(
            selectedIndex: _selectedRow,
            onPageChanged: (index) {
              log('index = $index');
              _selectedRow = index;
              setState(() {});
            },
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: PmAsset(IconAsset.getIconPath('info-circle.svg')),
              ),
              Text(
                'Geser ke kanan atau ke kiri untuk memilih',
                style: caption,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: PmButton.secondary(
                  text: 'Kembali',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PmButton.primary(
                  text: 'Buat',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context, _dummyAncakMutu);
                  },
                ),
              )
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ModelItem extends StatelessWidget {
  const _ModelItem({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onSelected,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final Function(String) onSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onSelected.call(title);
        },
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? primary : Colors.transparent,
          ),
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Center(
            child: Text(
              title,
              style: bodyBold.copyWith(
                color: isSelected ? Colors.white : primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<dynamic> _dummyAncakMutu = [
  {
    'block': 'A24',
    'type': 'Tunggal',
    'row': ['5']
  },
  {
    'block': 'A24',
    'type': 'Kanan Kiri',
    'row': ['3', '4']
  },
  {
    'block': 'A24',
    'type': 'Tunggal',
    'row': ['6']
  },
];
