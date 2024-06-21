import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hospital/MAPS/place_model.dart';
import 'package:location/location.dart';

class custom_google_map extends StatefulWidget {


  @override
  State<custom_google_map> createState() => _custom_google_mapState();
}

class _custom_google_mapState extends State<custom_google_map> {
  late CameraPosition init_cameraposition;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  late Location location;
  int z=0;

  double? my_lati;
  double? my_lang;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    googleMapController!.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState

    //zooooooooooooooooooom================>
    //world view 0 -> 3
    //country view 4 -> 6
    //city view 10 -> 12
    //streets view 13 -> 17
    //buildings view 18 -> 20


    init_cameraposition = CameraPosition(
        zoom: 11, target: LatLng(29.289796813618093, 30.782897882029538));

    init_markers();

    location=Location();

    init_location();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          markers: markers,
          polylines: polylines,

          zoomControlsEnabled: false,

          // to make controller
          onMapCreated: (controller) {
            googleMapController = controller;
            setState(() {});


          },

          // mapType: MapType.satellite,

          initialCameraPosition: init_cameraposition,
          //حدود الخريطة
          cameraTargetBounds: CameraTargetBounds(LatLngBounds(
              southwest: LatLng(22.078065792726495, 24.86451820325752),
              northeast: LatLng(31.327889127600173, 34.18092434186751))),
        ),

      ],
    );
  }

  void init_markers() async{
    // var mark=Marker(markerId: MarkerId('1'),position: LatLng(29.289796813618093, 30.782897882029538));
    // markers.add(mark);
    // setState(() {});

    //var icon_marker= await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/image/location.png');
    var places = list_places
        .map(
          (e) =>
          Marker(markerId: MarkerId(e.id.toString()), position: e.latlen,infoWindow: InfoWindow(title: e.name,snippet: "zxskjdkddd")),
    )
        .toSet();
    markers.addAll(places);
    setState(() {});
  }

  Future<void> Check_Request_location_services() async{

    var isServiceEnable =await location.serviceEnabled();
    if(! isServiceEnable)
    {
      isServiceEnable =await location.requestService();
    }
    if(! isServiceEnable)
    {
      //do action
    }
    Check_Request_location_permisson();
  }


  Future<bool> Check_Request_location_permisson() async{

    var permissionStatus =await location.hasPermission();
    if(permissionStatus==PermissionStatus.deniedForever)
    {
      return false;
    }
    if(permissionStatus==PermissionStatus.denied)
    {
      permissionStatus =await location.requestPermission();
      if( permissionStatus != PermissionStatus.granted)
      {
        //do action
        return false;
      }

    }

    return true;
  }
  void get_location_data()
  {
    location.onLocationChanged.listen((event) {
      my_lati=event.latitude;
      my_lang=event.longitude;
      var cameraPosition =CameraPosition(target: LatLng(event.latitude!, event.longitude!),zoom: 15);
      var my_location_marker=Marker(markerId: MarkerId("my_location_marker"),position: LatLng(event.latitude!, event.longitude!));
      markers.add(my_location_marker);
      z=find_nearest_hos(my_lati!, my_lang!);
      polylines_method();
      print("+++++++++++++++++++++++++++++++++++++++++++++=");
      print(z);
      setState(() {});
      googleMapController?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    },);
  }

  void init_location() async{
    await Check_Request_location_services();
    bool is_permission=await Check_Request_location_permisson();
    get_location_data();
    if(is_permission)
    {
      get_location_data();
    }
  }

  int find_nearest_hos(double x, double y) {
    double minValue = double.infinity;
    int minIndex = -1;

    for (int i = 0; i < list_places.length; i++) {
      double diff = (x - list_places[i].lati).abs() + (y - list_places[i].lang).abs();
      if (diff < minValue) {
        minValue = diff;
        minIndex = i;
      }
    }

    return minIndex;
  }
  void polylines_method(){
    Polyline polyline =Polyline(polylineId: PolylineId("1"),
        color: Colors.deepPurple.shade300,
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        width: 7,


        points: [
          LatLng(my_lati!, my_lang!),
          LatLng(list_places[z].lati, list_places[z].lang),
        ]);
    polylines.add(polyline);
  }
}
