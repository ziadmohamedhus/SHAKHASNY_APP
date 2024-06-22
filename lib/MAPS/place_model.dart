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
  place_model(id: 1, name: "مستشفى الزهراء", latlen: LatLng(29.304378683255248, 30.851494773574455),lati:29.304378683255248 ,lang:30.851494773574455 ),
  place_model(id: 2, name: "مستشفى يقين الفيوم", latlen: LatLng(29.30549261900563, 30.853700414319704),lati:29.30549261900563 ,lang:30.853700414319704),
  place_model(id: 3, name: "مستشفي مكة الفيوم", latlen: LatLng(29.305963623214755, 30.856138542328615),lati:29.305963623214755 ,lang:30.856138542328615),
  place_model(id: 4, name: "مستشفى الصدر بالفيوم", latlen: LatLng(29.308417910910766, 30.842852292972363 ),lati:29.308417910910766 ,lang:30.842852292972363),
  place_model(id: 5, name: "مستشفى الندى التخصصي بالفيوم", latlen: LatLng(29.312163844697167, 30.856233204589284),lati:29.312163844697167 ,lang:30.856233204589284),
  place_model(id: 6, name: "مستشفى مصر للخدمات الطبيه", latlen: LatLng(29.31111963057034, 30.857230363484916),lati:29.31111963057034 ,lang:30.857230363484916),
  place_model(id: 7, name: "مستشفى الحياة", latlen: LatLng(29.323407796464597, 30.857572107573606),lati:29.323407796464597 ,lang:30.857572107573606),
  place_model(id: 8, name: "مستشفى الفيوم الجامعي", latlen: LatLng(29.321364108065332, 30.834015678736836),lati:29.321364108065332 ,lang:30.834015678736836),
  place_model(id: 9, name: "مستشفي نور الفؤاد", latlen: LatLng(29.318761475415975, 30.842512250080535),lati:29.318761475415975 ,lang:30.842512250080535),
  place_model(id: 10, name: "مستشفى الفيوم العام", latlen: LatLng(29.31668006270108, 30.849392116136904),lati:29.31668006270108 ,lang:30.849392116136904),
  place_model(id: 11, name: "مستشفى التحرير بالفيوم", latlen: LatLng(29.307100924231932, 30.850725173956114),lati:29.307100924231932 ,lang:30.850725173956114),
  place_model(id: 12, name: "مستشفى التامين الصحى", latlen: LatLng(29.310531461889155, 30.859394073614336),lati:29.310531461889155 ,lang:30.859394073614336),
  place_model(id: 13, name: "مركز أورام الفيوم", latlen: LatLng(29.309217030543063, 30.8592720331012),lati:29.309217030543063 ,lang:30.8592720331012),
  place_model(id: 14, name: "مستشفى دار النخيل للخدمات الطبية", latlen: LatLng(29.317138047401574, 30.85058338450755),lati:29.317138047401574 ,lang:30.85058338450755),
  place_model(id: 15, name: "مستشفي حميات الفيوم", latlen: LatLng(29.296519729098485, 30.831595636417976),lati:29.296519729098485 ,lang:30.831595636417976),
  place_model(id: 16, name: "مستشفي الصفوه التخصصي", latlen: LatLng(29.296971184394533, 30.83349195818698),lati:29.296971184394533 ,lang:30.83349195818698),


];