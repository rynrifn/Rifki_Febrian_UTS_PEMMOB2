import 'package:flutter/material.dart';
import '../models/place.dart';
import '../services/map_service.dart';

class PlacesListPage extends StatefulWidget {
  const PlacesListPage({super.key});

  @override
  State<PlacesListPage> createState() => _PlacesListPageState();
}

class _PlacesListPageState extends State<PlacesListPage> {
  final MapService _mapService = MapService();
  List<Place> _places = [];
  List<Place> _filteredPlaces = [];
  String _searchQuery = '';
  String _selectedCategory = 'Semua';

  @override
  void initState() {
    super.initState();
    _loadPlaces();
  }

  void _loadPlaces() {
    setState(() {
      _places = _mapService.getPlaces();
      _filteredPlaces = _places;
    });
  }

  void _filterPlaces() {
    setState(() {
      _filteredPlaces = _places.where((place) {
        final matchesSearch =
            place.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                place.description
                    .toLowerCase()
                    .contains(_searchQuery.toLowerCase());
        final matchesCategory =
            _selectedCategory == 'Semua' || place.category == _selectedCategory;
        return matchesSearch && matchesCategory;
      }).toList();
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
    _filterPlaces();
  }

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _filterPlaces();
  }

  Widget _buildPlaceCard(Place place) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: ListTile(
        leading: const Icon(
          Icons.location_on,
          color: Colors.blue,
          size: 40,
        ),
        title: Text(
          place.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(place.description),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  Icons.category,
                  size: 14,
                  color: Colors.grey[600],
                ),
                const SizedBox(width: 4),
                Text(
                  place.category,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                ),
                const SizedBox(width: 4),
                Text(
                  place.rating.toString(),
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          _showPlaceDetails(place);
        },
      ),
    );
  }

  void _showPlaceDetails(Place place) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(place.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori: ${place.category}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(place.description),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text('Rating: ${place.rating}'),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Koordinat: ${place.latitude.toStringAsFixed(4)}, ${place.longitude.toStringAsFixed(4)}',
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  onChanged: _onSearchChanged,
                  decoration: const InputDecoration(
                    labelText: 'Cari tempat...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      'Semua',
                      'Landmark',
                      'Rekreasi',
                      'Sejarah',
                      'Museum',
                    ].map((category) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(category),
                          selected: _selectedCategory == category,
                          onSelected: (selected) {
                            _onCategoryChanged(category);
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _filteredPlaces.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Tidak ada tempat yang ditemukan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: _filteredPlaces.length,
                    itemBuilder: (context, index) {
                      return _buildPlaceCard(_filteredPlaces[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
