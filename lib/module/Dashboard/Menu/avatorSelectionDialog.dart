import 'package:flutter/material.dart';
import 'package:spendwise_app/aLocalAndRemoteData/local/constant.dart';
import 'package:spendwise_app/data/appColors.dart';
import 'package:spendwise_app/data/appCommonWidgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AvatarSelectionDialog extends StatefulWidget {
  @override
  _AvatarSelectionDialogState createState() => _AvatarSelectionDialogState();
}

class _AvatarSelectionDialogState extends State<AvatarSelectionDialog> {
  bool isLoading = false;
  List avatorList = [];
  var selectedAvator;
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    getAvatorList();
    super.initState();
  }

  getAvatorList() async {
    setState(() {
      isLoading = true;
    });
    
    dynamic response = await supabase.from('avatars').select('*');
    List temp = response == null ? [] : response as List;
    avatorList.clear();
    setState(() {
      avatorList = temp;
      if (constant.avatarId.isNotEmpty) {
        for (var element in avatorList) {
          if (element['id'].toString() == constant.avatarId) {
            selectedAvator = element;
            break;
          }
        }
      }
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Choose your avatar", style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),
            isLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20),
                    itemCount: avatorList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final avator = avatorList[index];
                      final isSelected = selectedAvator == null ? false : selectedAvator!['id'] == avator['id'];

                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedAvator = null;
                                } else {
                                  selectedAvator = avator;
                                  Navigator.of(context).pop(selectedAvator);
                                }
                              });
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: appColors.greyColor.withOpacity(0.3),
                                shape: BoxShape.circle,
                                border: !isSelected ? null : Border.all(width: 3, color: appColors.primaryColor),
                              ),
                              child: appCommonWidget.circularImageViewBuilder(imageLink: avator['url'] ?? '', radius: 100, iconSize: 16),
                            ),
                          ),
                          if (isSelected)
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(shape: BoxShape.circle, color: appColors.primaryColor),
                                child: Center(child: Icon(Icons.check, color: appColors.whiteColor, size: 20)),
                              ),
                            )
                        ],
                      );
                    },
                  ),
            if (isLoading) SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
