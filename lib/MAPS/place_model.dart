import 'package:google_maps_flutter/google_maps_flutter.dart';

class place_model
{
  final int id ;
  double lati =0;
  double lang =0;
  final String name ;
  final LatLng latlen ;


  place_model({required this.id, required this.name, required this.latlen,required this.lati,required this.lang});

}
List<place_model>list_places=[
  place_model(id: 1, name: "مستشفى الزهراء", latlen: LatLng(29.30544844784599, 30.85153792470764),lati:29.30544844784599 ,lang:30.85153792470764 ),
  place_model(id: 2, name: "مستشفى يقين الفيوم", latlen: LatLng(29.306945363069012, 30.853512030518996),lati:29.306945363069012 ,lang:30.853512030518996),
  place_model(id: 3, name: "مستشفي مكة الفيوم", latlen: LatLng(29.307918346191922, 30.856172781829958),lati:29.307918346191922 ,lang:30.856172781829958),
  place_model(id: 3, name: "مستشفى الصدر بالفيوم", latlen: LatLng(29.311435977019592, 30.85917685589072 ),lati:29.311435977019592 ,lang:30.85917685589072),
  place_model(id: 3, name: "مستشفى الندى التخصصي بالفيوم", latlen: LatLng(29.31392037134616, 30.856363177769055),lati:29.31392037134616 ,lang:30.856363177769055),
  place_model(id: 3, name: "مستشفى مصر للخدمات الطبيه", latlen: LatLng(29.312423558423465, 30.857478976704666),lati:29.312423558423465 ,lang:30.857478976704666),
  place_model(id: 3, name: "مستشفى الحياة", latlen: LatLng(29.324771608374302, 30.857822299454085),lati:29.324771608374302 ,lang:30.857822299454085),


];