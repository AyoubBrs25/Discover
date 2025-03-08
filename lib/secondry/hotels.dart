import 'package:flutter/material.dart';

class hotel{
  final String name;
  final String price;
  final String imgsrc;
  final String plc;

  hotel(this.name , this.price , this.imgsrc,this.plc);

  static List<hotel> hotelList() {
    return <hotel>[
      hotel('Sofitel Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Alger'),
      hotel('Hotel El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Alger'),
      hotel('Hilton Algiers','15000 DA','29261054.jpg','Alger'),
      hotel('Sheraton Club des Pins Resort','20000 DA','hotel-exterior-entrance.jpg','Alger'),
      hotel('Sofitel Algiers Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Constantine'),
      hotel('Hotel El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Constantine'),
      hotel('Hilton Algiers','15000 DA','29261054.jpg','Constantine'),
      hotel('Sheraton Club des Pins Resort','20000 DA','hotel-exterior-entrance.jpg','Constantine'),
      hotel('Sofitel Algiers Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Oran'),
      hotel('Hotel El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Oran'),
      hotel('Hilton Algiers','15000 DA','29261054.jpg','Oran'),
      hotel('Sheraton Club des Pins Resort','20000 DA','hotel-exterior-entrance.jpg','Oran'),
      hotel('Sofitel Algiers Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Sahara'),
      hotel('Hotel El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Sahara'),
      hotel('Hilton Algiers','15000 DA','29261054.jpg','Sahara'),
      hotel('Sheraton Club des Pins Resort','20000 DA','hotel-exterior-entrance.jpg','Sahara'),
    ];
  }
}