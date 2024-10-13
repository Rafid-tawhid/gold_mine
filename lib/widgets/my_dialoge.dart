import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MyDialogs {

  static Widget successDialoge(BuildContext context,String title,String body) {

    return ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: title,
            text: body
        )
    );
  }


  static Widget errorDialoge(BuildContext context,String title,String body) {

    return ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.warning,
            title: title,
            text: body,

        )
    );
  }

  static Widget serverErrorDialoge(BuildContext context,String title,String body) {

    return ArtSweetAlert.show(
        context: context,
        artDialogArgs: ArtDialogArgs(
          type: ArtSweetAlertType.danger,
          title: title,
          text: body,
          confirmButtonText: 'Exit',
          onConfirm: (){
            SystemNavigator.pop();
          }

        )
    );
  }
}