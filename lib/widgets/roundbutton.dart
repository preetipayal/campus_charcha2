import 'package:campus_charcha/widgets/appcolors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String tittle;
  final VoidCallback ontap;
  final bool loading;
  const RoundButton({
    super.key,
    required this.tittle,
    required this.ontap,
    this.loading=false
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(50),
          ),
          child:Center( 
            child:loading?CircularProgressIndicator(strokeWidth: 3,color: Colors.white,): 
            Text(tittle,style: TextStyle(
              color: Colors.white,
            ),),
          )
        ),
      ),
    ) ;
  }
}