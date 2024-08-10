import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_finance.dart';
import 'package:simanja_app/domain/services/kader_finance_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/date_of_birth.dart';
import 'package:simanja_app/presentation/widgets/atom/multiple_selector_box.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/utils/default_account.dart';

class InputKasData extends StatefulWidget {
  final FinanceKader? lastData;
  const InputKasData({super.key, this.lastData});

  @override
  State<InputKasData> createState() => _InputKasDataState();
}

class _InputKasDataState extends State<InputKasData> {
  Map<String, dynamic> data = {'date': DateTime.now()};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateOfBirthField(text: 'Tanggal', value: (d) => data['date'] = d),
        const Padding(padding: EdgeInsets.only(top: 10)),
        MultipleSelectorBox(
          items: const ['Kas Masuk', 'Kas Keluar'],
          onTap: (d) => data['selector'] = d,
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        TextInput(
          hintText: 'Ketik Jumlah Mutasi...',
          labelText: 'Mutasi',
          type: TextInputType.number,
          action: TextInputAction.done,
          value: (d) => data['mutation'] = int.parse(d),
        ),
        TextInput(
          hintText: 'Ketik Asal Dana...',
          labelText: 'Asal Dana',
          type: TextInputType.text,
          action: TextInputAction.done,
          value: (d) => data['source'] = d,
        ),
        TextInput(
          hintText: 'Ketik Deskripsi...',
          labelText: 'Deskripsi',
          type: TextInputType.text,
          action: TextInputAction.done,
          value: (d) => data['description'] = d,
        ),
        const Padding(padding: EdgeInsets.only(top: 30)),
        SubmitButton(
            text: 'Simpan Rekam Kas',
            onClick: () async {
              if (data['mutation'] == null ||
                  data['source'] == null ||
                  data['description'] == null) {
                showCustomSnackbar(context, 'Data tidak boleh kosong', 2);
                return;
              }
              int lastTotal = widget.lastData != null
                  ? int.parse(widget.lastData!.total)
                  : 0;
              print(data['selector']);
              FinanceKader finance = FinanceKader(
                  uid: '',
                  uidPosyandu: kaderAccount.uid,
                  idIncrement: widget.lastData != null
                      ? widget.lastData!.idIncrement + 1
                      : 0,
                  date: data['date'],
                  value: data['mutation'].toString(),
                  source: data['source'],
                  description: data['description'],
                  isDeposit: data['selector'] == 'Kas Masuk' ||
                      data['selector'] == null,
                  total: (lastTotal +
                          (data['selector'] == 'Kas Masuk' ||
                                  data['selector'] == null
                              ? data['mutation']
                              : data['mutation'] * -1))
                      .toString());
              final response =
                  await KaderFinanceService().createFinance(finance);
              if (response != null) {
                showCustomSnackbar(context, 'Berhasil membuat mutasi', 0);
                router.pop();
              } else {
                showCustomSnackbar(context, 'Gagal membuat mutasi', 1);
              }
            }),
      ],
    );
  }
}
