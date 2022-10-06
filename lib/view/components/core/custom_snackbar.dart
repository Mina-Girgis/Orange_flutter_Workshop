

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void topSnackBarSuccess({required String text , required context}){
  showTopSnackBar(
    context,
    CustomSnackBar.success(
      message:text,
    ),
  );
}



void topSnackBarError({required String text , required context}){
  showTopSnackBar(
    context,
    CustomSnackBar.error(
      message:text,
    ),
  );
}



void topSnackBarInfo({required String text , required context}){
  showTopSnackBar(
    context,
    CustomSnackBar.info(message:text,),
  );
}




