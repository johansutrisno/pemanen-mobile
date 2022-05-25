import 'package:flutter/material.dart';
import 'package:pemanen_mobile/component/pm_app_bar.dart';
import 'package:pemanen_mobile/pages/detail_pemanen/component/mutu_ancak_view.dart';
import 'package:pemanen_mobile/pages/detail_pemanen/component/panen_info_view.dart';
import 'package:pemanen_mobile/pages/detail_pemanen/component/select_block_sheet.dart';
import 'package:pemanen_mobile/theme/theme.dart';

import 'component/user_view.dart';

class DetailPemanenScreen extends StatefulWidget {
  const DetailPemanenScreen({Key? key}) : super(key: key);

  @override
  State<DetailPemanenScreen> createState() => _DetailPemanenScreenState();
}

class _DetailPemanenScreenState extends State<DetailPemanenScreen> {
  late List<dynamic> ancakMutuList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PmAppBar(title: 'Detail Pemanen'),
      body: Column(
        children: [
          const UserView(),
          const PanenInfoView(),
          MutuAncakView(
            ancakMutuList: ancakMutuList,
          ),
        ],
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
    var result = await SelectBlockSheet.show(context);
    if (result != null && result is List<dynamic>) {
      ancakMutuList = result;
      setState(() {});
    }
  }
}
