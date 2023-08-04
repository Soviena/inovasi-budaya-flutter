import 'package:flutter/material.dart';
import 'package:inovasi_budaya/view/homepage/component/divider.dart';
import 'package:inovasi_budaya/view/homepage/component/rewardContainer.dart';

class Rewards extends StatelessWidget {
  const Rewards({super.key, this.reward = const {}});
  final dynamic reward;

  List<Widget> makeListReward() {
    List<Widget> containerArray = [const TextDivider(titleText: "Rewards")];
    if (reward['users'] != null) {
      for (var r in reward['users']) {
        containerArray.add(RewardContainer(
            nama: r['name'],
            judul: r['pivot']['rewardsName'],
            deskripsi: r['pivot']['deskripsi'],
            image:
                "https://django.belajarpro.online/storage/uploaded/user/${r['profilepic']}"));
      }
    }
    return containerArray;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: makeListReward(),
    );
  }
}
