import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:discover/secondry/places.dart';
import 'package:discover/secondry/hotels.dart';
import 'package:discover/secondry/restaurant.dart';
import '../pages/categorypage.dart';
import '../pages/favorite.dart';
import '../pages/homepage.dart';
class LocaleProvider with ChangeNotifier {
  late Locale _appLocale = Locale('ar', 'SA');
  Color mode = Color(0xFFFFFFFF);
  Color items = Color(0xFF000000);

  String emailkepr = '';
  String mtpkepr = '';
  String userkepr = '';
  File? fileImage;



  List<PlacesCnstr>? Allplaces;

  List<PlacesCnstr> place = [
    PlacesCnstr (0,'Kasbah of Algiers','Alger',false,'City','North',
        'The Kasbah of Algiers is a UNESCO World Heritage site located in the heart of Algiers, the capital of Algeria. It is a historic district characterized by narrow winding streets, traditional houses adorned with intricate designs, and ancient mosques. The Kasbah reflects centuries of cultural and architectural influences, offering visitors a captivating journey through Algeria rich history and heritage.',
        [
          'Casbah.jpeg',
          'istockphoto-1168568479-612x612.jpg',
          'Kasbah-of-Algiers_port_C_ANSS_sept-2017.jpg',
          'Alger_Kasbah02.jpg'
        ],
        [
          hotel('Sofitel Hamma Garden','10000 DA','Sofitel-Algiers-Hamma-Garden.png','Alger'),
          hotel('Hotel El Djazair','8000 DA','FR4_pvcX0AAJGSX.jpg','Alger'),
          hotel('Hilton Algiers','15000 DA','29261054.jpg','Alger'),
          hotel('Sheraton ClubdesPins','20000 DA','hotel-exterior-entrance.jpg','Alger'),
        ],
        [
          restaurant('Signature','Italian Cuisine','Signature-Restaurant.webp','Alger'),
          restaurant('Le Bardo','Mediterranean Cuisine','Le-Bardo-Restaurant.webp','Alger'),
          restaurant('Auberge du moulin','Mexican&Italian Cuisine','terrasse-exterieure-Auberge-du-Moulin.jpg','Alger'),
          restaurant('Le tantra','French&Thai Cuisine','tantra-3-1.jpg','Alger'),
        ]),

    PlacesCnstr (1,'Suspension Bridge','Constantine',false,'Beach','East',
        'One of the iconic landmarks of Constantine is its impressive suspension bridge, also known as the Salah Bey Bridge. This bridge spans the deep Rhumel Gorge, connecting the old city with the newer parts. It provides stunning panoramic views of the city and the surrounding landscape.',
        [
          'Constantine.webp',
          'constantine-city-bridges-algeria-600nw-134225552.webp',
          'sidi-rached-viaduct-across-rhummel-river-canyon-constantine-algeria-sidi-rached-viaduct-across-rhummel-river-120508842.webp',
          'constantine.jpg'
        ],
        [
          hotel('Hôtel Cirta','10000 DA','150875004.f8wUyAMy.AlgeriaJun132567.jpg','Constantine'),
          hotel('Ibis Constantine','8000 DA','ibis.jpg','Constantine'),
          hotel('Hôtel Des Princes','15000 DA','2c1e.jpg','Constantine'),
          hotel('Hôtel Marriott','20000 DA','exterior.jpg','Constantine'),
        ],
        [
          restaurant('Casa mia','All Cuisines','casamia.jpg','Constantine'),
          restaurant('Restaurant Igherssan','Mediterranean Cuisine','ighrsan.jpg','Constantine'),
          restaurant('Mega Food','Fast Food','megafood.jpg','Constantine'),
          restaurant('Restaurant Apex','French&Thai Cuisine','apex.jpg','Constantine'),
        ]),
    PlacesCnstr(
      2,
      'St.Louis Cathedral ',
      'Oran',
      false,
      'Mountain',
      'West',
      'The Cathédrale du Sacré-Cœur de Oran, also known as the Sacred Heart Cathedral of Oran, is a Roman Catholic cathedral located in the city of Oran, Algeria. Built during the French colonial period, the cathedral is a prominent architectural landmark and a symbol of Orans historical and cultural heritage.',
      [
        'catidral1_0.jpg',
        'catidral1.jpg',
        'catidral3.jpg',
        'caditral4.webp',
      ],
      [
        hotel('Hotel Royal', '12000 DA', 'royal.jpg', 'Oran'),
        hotel('Mediterranean View', '20000 DA', 'medtr.jpg', 'Oran'),
        hotel('Sheraton Hotel', '15000 DA', 'shiraton.jpg', 'Oran'),
        hotel('Plaza Hotel', '18000 DA', 'plaza.jpg', 'Oran'),
      ],
      [
        restaurant('Le Modjo', 'Seafood Cuisine', 'le-modjo.jpg', 'Oran'),
        restaurant('Le Ciel De Oran', 'International Cuisine', 'le-ciel-d-oran.jpg', 'Oran'),
        restaurant('Les Ambassadeurs', 'Mediterranean Cafe', 'hotel-les-ambassadeurs.jpg', 'Oran'),
        restaurant('Bistrot Lenas', 'Local Cuisine', 'bistrot-lena-s.jpg', 'Oran'),
      ],
    ),
  PlacesCnstr(
    3,
    'Timimoun',
    'Sahara',
    false,
    'Historical Place',
    'South',
    'Timimoun is often referred to as the "Pearl of the Gourara" and is a charming oasis town located in the Gourara region of the Algerian Sahara. This town is known for its unique architecture, blending traditional mud-brick structures with the surrounding desert landscape. The buildings are designed to provide shelter from the intense desert heat.',
    [
      'timimoun.jpg',
      'timimoun2.webp',
      'timimoun3.webp',
      'timimoun4.jpeg',
    ],
    [
      hotel('Saharian Village', '8000 DA', 'aventuras-por-desierto.jpg', 'Sahara'),
      hotel('La Grotte Ambassadeurs', '10000 DA', 'grotte.jpg', 'Sahara'),
      hotel('Tenere Village', '12000 DA', 'tenere-village.jpg', 'Sahara'),
    ],
    [
      restaurant('Dunes Grill', 'Desert Cuisine', 'restaurant1.webp', 'Sahara'),
      restaurant('Oasis Bistro', 'Mediterranean Fusion', 'restaurant2.jpg', 'Sahara'),
      restaurant('Sand Dunes Cafe', 'International Flavors', 'restaurant3.jpg', 'Sahara'),
      restaurant('Nomads Feast', 'Traditional Sahara Cuisine', 'restaurant4.jpg', 'Sahara'),
    ],
  ),


  ];

  


  final List pages = [
    theHome(),

    category(),

    favorite(),
  ];


  void fillList(){
    Allplaces = place;
  }


  List<PlacesCnstr>? takefavr(){
    List<PlacesCnstr>? keeplist= [];
    keeplist = place.where((elem) => elem.fav == true).toList();
    return keeplist;
  }

  List<PlacesCnstr> Updatelist(String str){
    List<PlacesCnstr> keeplist= [];
    if(str == 'City'||str=='مدينة'){
      keeplist = place.where((elem) => elem.type == 'City').toList();
    }else if(str == 'Beach'||str=='شاطئ'){
      keeplist = place.where((elem) => elem.type == 'Beach').toList();
    }else if(str == 'Mountain'||str=='جبل'){
      keeplist = place.where((elem) => elem.type == 'Mountain').toList();
    }else if(str == 'Historical Place'||str=='مكان تاريخي'){
      keeplist = place.where((elem) => elem.type == 'Historical Place').toList();
    }else{
      keeplist = place;
    }
    print(keeplist);
    return keeplist;
  }


  List<PlacesCnstr> Updatelocation(String str){
    List<PlacesCnstr> keeplist= [];
    if(str == 'North'||str=='الشمال'){
      keeplist = place.where((elem) => elem.diriction == 'North').toList();
    }else if(str == 'South'||str=='الجنوب'){
      keeplist = place.where((elem) => elem.diriction == 'South').toList();
    }else if(str == 'East'||str=='الشرق'){
      keeplist = place.where((elem) => elem.diriction == 'East').toList();
    }else if(str == 'West'||str=='الغرب'){
      keeplist = place.where((elem) => elem.diriction == 'West').toList();
    }else{
      keeplist = place;
    }
    print(keeplist);
    return keeplist;
  }

  void updateData(String newEmail, String newUser) {
    emailkepr = newEmail;
    userkepr = newUser;
    notifyListeners();
  }

  void updateData1(String mnewmtp) {
    mtpkepr = mnewmtp;
    notifyListeners();
  }

  void setcolors() {
    if(mode == Color(0xFF000000)){
      mode = Color(0xFFffffff);
      items = Color(0xFF000000);
    }else{
      mode = Color(0xFF000000);
      items = Color(0xFFffffff);
    };
    notifyListeners();
  }

  void toggleFavorite(index) {
    if (Allplaces?[index].fav != null && Allplaces?[index].fav==false) {
      Allplaces?[index].fav=true;
    } else if(Allplaces?[index].fav==true){
      Allplaces?[index].fav=false;
    }
    notifyListeners();
  }


  void takeimage(File file){
    fileImage = file;
    notifyListeners();
  }






  Locale get appLocale => _appLocale;

  void setAppLocale(Locale locale) {
    _appLocale = locale;
    notifyListeners();
  }
  Future<void> _loadLocale() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final languageCode = preferences.getString('languageCode') ?? 'en';
    final countryCode = preferences.getString('countryCode') ?? 'US';
    _appLocale = Locale(languageCode, countryCode);
    notifyListeners();
  }

  Future<void> setLocale(Locale newLocale) async {
    _appLocale = newLocale;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('languageCode', newLocale.languageCode);
    await preferences.setString('countryCode', newLocale.countryCode ?? '');
    await saveData();
    notifyListeners();
  }


  Future<void> saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('emailkepr', emailkepr);
    preferences.setString('mtpkepr', mtpkepr);
    preferences.setString('userkepr', userkepr);

    preferences.setString('fileImagePath', fileImage?.path ?? '');

    if (Allplaces != null) {
      final favListAsString = Allplaces!.map((place) => place.fav.toString()).join(',');
      preferences.setString('favList', favListAsString);
    }
  }

  Future<void> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    emailkepr = preferences.getString('emailkepr') ?? '';
    mtpkepr = preferences.getString('mtpkepr') ?? '';
    userkepr = preferences.getString('userkepr') ?? '';


    final imagePath = preferences.getString('fileImagePath');
    fileImage = imagePath != null ? File(imagePath) : File('default_path');


    final favListAsString = preferences.getString('favList') ?? '';
    if (Allplaces != null) {
      final favList = favListAsString.split(',').map((str) => str == 'true').toList();
      for (int i = 0; i < favList.length && i < Allplaces!.length; i++) {
        Allplaces![i].fav = favList[i];
      }
    }
  }


  LocaleProvider() {
    _loadLocale();
    loadData();
  }


  
}