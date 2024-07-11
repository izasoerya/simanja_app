import 'package:flutter/material.dart';
import 'package:simanja_app/presentation/widgets/atom/posyandu_activity.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: const Column(
        children: [
          SearchBar(),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            children: [
              Image(
                  image: AssetImage('assets/logo/No_Image.jpg'),
                  width: 70,
                  height: 70),
              Padding(padding: EdgeInsets.only(right: 15)),
              SizedBox(
                height: 70,
                child: PosyanduActivity(
                  place: 'Jl. Posyandu 1',
                  title: 'Posyandu 1',
                  date: '12/12/2021',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
