import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../services/map_service.dart';
import '../models/place.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _mapController = MapController();
  final MapService _mapService = MapService();
  List<Place> _places = [];
  LatLng? _currentLocation;
  String _selectedCategory = 'Semua';

  @override
  void initState() {
    super.initState();
    _loadPlaces();
    _getCurrentLocation();
  }

  void _loadPlaces() {
    setState(() {
      _places = _mapService.getPlaces();
    });
  }

  void _getCurrentLocation() {
    // Simulasi lokasi saat ini (Jakarta)
    setState(() {
      _currentLocation = const LatLng(-6.2088, 106.8456);
    });
  }

  void _filterPlaces(String category) {
    setState(() {
      _selectedCategory = category;
      if (category == 'Semua') {
        _places = _mapService.getPlaces();
      } else {
        _places = _mapService.getPlacesByCategory(category);
      }
    });
  }

  void _showPlaceDetails(Place place) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.category,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    place.category,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    size: 16,
                    color: Colors.amber,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    place.rating.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                place.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _mapController.move(
                      LatLng(place.latitude, place.longitude),
                      15.0,
                    );
                  },
                  child: const Text('Lihat di Peta'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter:
                  _currentLocation ?? const LatLng(-6.2088, 106.8456),
              initialZoom: 12.0,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.my_maps_app',
              ),
              MarkerLayer(
                markers: [
                  if (_currentLocation != null)
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: _currentLocation!,
                      child: const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ..._places.map((place) {
                    return Marker(
                      width: 30.0,
                      height: 30.0,
                      point: LatLng(place.latitude, place.longitude),
                      child: GestureDetector(
                        onTap: () => _showPlaceDetails(place),
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.blue,
                          size: 30.0,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButton<String>(
                  value: _selectedCategory,
                  isExpanded: true,
                  underline: const SizedBox(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      _filterPlaces(newValue);
                    }
                  },
                  items: <String>[
                    'Semua',
                    'Landmark',
                    'Rekreasi',
                    'Sejarah',
                    'Museum'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    if (_currentLocation != null) {
                      _mapController.move(_currentLocation!, 15.0);
                    }
                  },
                  child: const Icon(Icons.my_location),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: () {
                    _mapController.move(
                      _mapController.camera.center,
                      _mapController.camera.zoom + 1,
                    );
                  },
                  child: const Icon(Icons.zoom_in),
                ),
                const SizedBox(height: 8),
                FloatingActionButton(
                  onPressed: () {
                    _mapController.move(
                      _mapController.camera.center,
                      _mapController.camera.zoom - 1,
                    );
                  },
                  child: const Icon(Icons.zoom_out),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}
