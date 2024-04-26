import 'package:flutter/material.dart';


 
  Widget syAdmindash(context, ){
return   Padding(padding: EdgeInsets.all(30.0),
child: Center(
            child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("DASHBOARD",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.blueAccent),),
                   
                SizedBox(
                   height: MediaQuery.of(context).size.height * 0.08,),
                SizedBox(
                   height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.70,
                  child: Card(
                    elevation: 20.0,
                    child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                      
                        Text("WELLCOME  !",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                         Text("",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black),),
                       
                         SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
         
                      ],
                    ),
                    
                
                  ),
                ),

                
              ],
            ),
      
           ),

);
  }