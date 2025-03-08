import 'package:flutter/material.dart';

class restaurant{
  final String name;
  final String mtype;
  final String imgsrc;
  final String plc;

  restaurant(this.name , this.mtype , this.imgsrc,this.plc);

  static List<restaurant> restauranttList() {
    return <restaurant>[
      restaurant('Sofitel Algiers Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Alger'),
      restaurant('restaurantt El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Alger'),
      restaurant('Hilton Algiers','15000 DA','29261054.jpg','Alger'),
      restaurant('Sheraton Club des Pins restaurantort','20000 DA','restaurantt-exterior-entrance.jpg','Alger'),
      restaurant('Sofitel Algiers Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Constantine'),
      restaurant('restaurantt El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Constantine'),
      restaurant('Hilton Algiers','15000 DA','29261054.jpg','Constantine'),
      restaurant('Sheraton Club des Pins restaurantort','20000 DA','restaurantt-exterior-entrance.jpg','Constantine'),
      restaurant('Sofitel Algiers Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Oran'),
      restaurant('restaurantt El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Oran'),
      restaurant('Hilton Algiers','15000 DA','29261054.jpg','Oran'),
      restaurant('Sheraton Club des Pins restaurantort','20000 DA','restaurantt-exterior-entrance.jpg','Oran'),
      restaurant('Sofitel Algiers Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Sahara'),
      restaurant('restaurantt El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Sahara'),
      restaurant('Hilton Algiers','15000 DA','29261054.jpg','Sahara'),
      restaurant('Sheraton Club des Pins restaurantort','20000 DA','restaurantt-exterior-entrance.jpg','Sahara'),
    ];
  }
}