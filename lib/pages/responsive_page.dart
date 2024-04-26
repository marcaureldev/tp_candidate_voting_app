import 'package:flutter/material.dart';

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) { 
          print(constraints);

          if(constraints.maxWidth <= 780){

            //phone

             
          };

           if(constraints.maxWidth >= 768  && constraints.maxWidth <992 ){ 
             
          }

            if(constraints.maxWidth >= 1200  && constraints.maxWidth <992 ){ 
             
          }


          

          return Container(
            
          );
         },
        
      ),
    );
  }
}