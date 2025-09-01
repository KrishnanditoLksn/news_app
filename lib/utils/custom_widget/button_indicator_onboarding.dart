import 'package:flutter/material.dart';
import 'package:starwars/screens/main/main_page.dart';
import 'package:starwars/utils/onboard_share.dart';

class ButtonIndicatorOnboarding extends StatelessWidget {
  final int currPageIdx;
  final TabController tabController;
  final void Function(int) onUpdateCurrPageIdx;

  const ButtonIndicatorOnboarding(
    this.currPageIdx,
    this.tabController,
    this.onUpdateCurrPageIdx, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              if (currPageIdx == 0) {
                return;
              }
              onUpdateCurrPageIdx(currPageIdx - 1);
            },
            child: Text("Previous"),
          ),
          Spacer(),
          TabPageSelector(
            controller: tabController,
            color: Colors.white,
            selectedColor: Colors.blueAccent,
          ),
          Spacer(),
          TextButton(
            onPressed: () async {
              if (currPageIdx == 1) {
                await complateOnboarding();
                if (context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                }
                // Stop execution here
                return;
              }
              onUpdateCurrPageIdx(currPageIdx + 1);
            },
            child: Text("Next"),
          ),
        ],
      ),
    );
  }
}
