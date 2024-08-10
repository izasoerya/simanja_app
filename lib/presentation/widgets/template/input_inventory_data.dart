import 'package:flutter/material.dart';
import 'package:simanja_app/domain/entities/kader_inventory.dart';
import 'package:simanja_app/domain/services/kader_inventory_service.dart';
import 'package:simanja_app/presentation/router/router.dart';
import 'package:simanja_app/presentation/widgets/atom/custom_snackbar.dart';
import 'package:simanja_app/presentation/widgets/atom/date_of_birth.dart';
import 'package:simanja_app/presentation/widgets/atom/submit_button.dart';
import 'package:simanja_app/presentation/widgets/atom/text_input.dart';
import 'package:simanja_app/utils/default_account.dart';

class InputInventoryData extends StatelessWidget {
  const InputInventoryData({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {'date': DateTime.now()};
    return Column(
      children: [
        TextInput(
            hintText: 'Ketik nama barang...',
            labelText: 'Nama Barang',
            type: TextInputType.name,
            action: TextInputAction.next,
            value: (d) => data['name'] = d),
        TextInput(
            hintText: 'Ketik merk barang...',
            labelText: 'Merk Barang',
            type: TextInputType.name,
            action: TextInputAction.next,
            value: (d) => data['merk'] = d),
        TextInput(
            hintText: 'Ketik jenis/tipe/spesifikasi...',
            labelText: 'Jenis/Tipe/Spesifikasi',
            type: TextInputType.text,
            action: TextInputAction.next,
            value: (d) => data['spek'] = d),
        TextInput(
            hintText: 'Ketik jumlah barang...',
            labelText: 'Jumlah Barang',
            type: TextInputType.number,
            action: TextInputAction.next,
            value: (d) => data['qty'] = d),
        TextInput(
            hintText: 'Ketik asal barang...',
            labelText: 'Asal Barang',
            type: TextInputType.text,
            action: TextInputAction.next,
            value: (d) => data['source'] = d),
        DateOfBirthField(
            value: (d) => data['date'] = d, text: 'Tanggal Diterima'),
        TextInput(
            hintText: 'Ketik keterangan barang...',
            labelText: 'Keterangan',
            type: TextInputType.text,
            action: TextInputAction.done,
            value: (d) => data['note'] = d),
        const Padding(padding: EdgeInsets.only(top: 30)),
        SubmitButton(
          text: 'Tambahkan Barang',
          onClick: () async {
            if (data['name'] == null) {
              showCustomSnackbar(context, 'Nama tidak boleh kosong', 2);
              return;
            }
            if (data['merk'] == null) {
              showCustomSnackbar(context, 'Merk tidak boleh kosong', 2);
              return;
            }
            if (data['spek'] == null) {
              showCustomSnackbar(context, 'Spesifikasi tidak boleh kosong', 2);
              return;
            }
            if (data['qty'] == null) {
              showCustomSnackbar(context, 'Jumlah tidak boleh kosong', 2);
              return;
            }
            if (data['source'] == null) {
              showCustomSnackbar(context, 'Sumber tidak boleh kosong', 2);
              return;
            }
            if (data['date'] == null) {
              showCustomSnackbar(context, 'Tanggal tidak boleh kosong', 2);
              return;
            }
            if (data['note'] == null) {
              showCustomSnackbar(context, 'Catatan tidak boleh kosong', 2);
              return;
            }

            KaderInventory inven = KaderInventory(
                uid: '',
                uidPosyandu: kaderAccount.uid,
                name: data['name'],
                brand: data['merk'],
                type: data['spek'],
                stock: int.parse(data['qty']),
                source: data['source'],
                dateReceive: data['date'],
                note: data['note'],
                imageURL: '');
            final response =
                await KaderInventoryService().createInventory(inven);
            if (response != null) {
              showCustomSnackbar(context, 'Berhasil Menambahkan Item', 0);
              router.pop();
            } else {
              showCustomSnackbar(context, 'Gagal Menambahkan Item', 2);
            }
          },
        ),
        const Padding(padding: EdgeInsets.only(top: 50)),
      ],
    );
  }
}
