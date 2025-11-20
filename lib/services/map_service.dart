import 'dart:math';
import 'package:latlong2/latlong.dart';
import '../models/place.dart';

class MapService {
  static final MapService _instance = MapService._internal();
  factory MapService() => _instance;
  MapService._internal();

  // Simulasi data tempat menarik
  final List<Place> _places = [
    Place(
      id: '1',
      name: 'Monas',
      description: 'Monumen Nasional Indonesia',
      latitude: -6.1754,
      longitude: 106.8272,
      category: 'Landmark',
      rating: 4.8,
    ),
    Place(
      id: '2',
      name: 'Taman Mini Indonesia Indah',
      description: 'Taman rekreasi dan edukasi',
      latitude: -6.3024,
      longitude: 106.8952,
      category: 'Rekreasi',
      rating: 4.5,
    ),
    Place(
      id: '3',
      name: 'Kota Tua Jakarta',
      description: 'Kawasan sejarah Jakarta',
      latitude: -6.1352,
      longitude: 106.8133,
      category: 'Sejarah',
      rating: 4.3,
    ),
    Place(
      id: '4',
      name: 'Ancol Dreamland',
      description: 'Taman hiburan terbesar',
      latitude: -6.1256,
      longitude: 106.8380,
      category: 'Rekreasi',
      rating: 4.6,
    ),
    Place(
      id: '5',
      name: 'Museum Nasional',
      description: 'Museum arkeologi dan sejarah',
      latitude: -6.1764,
      longitude: 106.8224,
      category: 'Museum',
      rating: 4.4,
    ),
  ];

  List<Place> getPlaces() => _places;

  List<Place> getPlacesByCategory(String category) {
    return _places.where((place) => place.category == category).toList();
  }

  // Hitung jarak antara dua titik (dalam km)
  double calculateDistance(LatLng point1, LatLng point2) {
    const R = 6371.0; // Radius bumi dalam km
    final lat1 = point1.latitude * pi / 180;
    final lon1 = point1.longitude * pi / 180;
    final lat2 = point2.latitude * pi / 180;
    final lon2 = point2.longitude * pi / 180;

    final dlat = lat2 - lat1;
    final dlon = lon2 - lon1;

    final a = sin(dlat / 2) * sin(dlat / 2) +
        cos(lat1) * cos(lat2) * sin(dlon / 2) * sin(dlon / 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c;
  }

  // Cari tempat terdekat
  List<Place> findNearbyPlaces(LatLng currentLocation, double radiusInKm) {
    return _places.where((place) {
      final distance = calculateDistance(
        currentLocation,
        LatLng(place.latitude, place.longitude),
      );
      return distance <= radiusInKm;
    }).toList();
  }
}
