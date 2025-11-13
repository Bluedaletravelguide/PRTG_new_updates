import 'package:flutter/material.dart';
import 'passport_service.dart';
import 'passport_place.dart';

class PerakPassportPage extends StatefulWidget {
  const PerakPassportPage({super.key});

  @override
  State<PerakPassportPage> createState() => _PerakPassportPageState();
}

class _PerakPassportPageState extends State<PerakPassportPage> {
  final PassportService _service = PassportService();
  Set<String> _stampedIds = {};
  String _selectedCategory = 'All'; // 'All', 'Attraction', 'Food', 'Cafe', 'Hotel', 'Worship', 'Shopping'
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStampedIds();
  }

  Future<void> _loadStampedIds() async {
    final stamped = await _service.getStampedIds();
    setState(() {
      _stampedIds = stamped;
      _isLoading = false;
    });
  }

  List<PassportPlace> get _filteredPlaces {
    if (_selectedCategory == 'All') {
      return kPassportPlaces;
    }
    return kPassportPlaces
        .where((place) => place.category == _selectedCategory)
        .toList();
  }

  Future<void> _toggleStamp(PassportPlace place) async {
    final isStamped = _stampedIds.contains(place.id);

    if (isStamped) {
      await _service.unstamp(place.id);
      setState(() {
        _stampedIds.remove(place.id);
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed stamp from ${place.name}'),
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } else {
      await _service.stamp(place.id);
      setState(() {
        _stampedIds.add(place.id);
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('🎉 Stamped ${place.name}!'),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  void _showPlaceDetails(PassportPlace place) {
    final isStamped = _stampedIds.contains(place.id);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.photo_library_outlined,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                  ),
                  if (isStamped)
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle, color: Colors.white, size: 18),
                            SizedBox(width: 6),
                            Text(
                              'Stamped',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            place.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 18, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          place.region,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: _getCategoryColor(place.category),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            place.category,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _getCategoryTextColor(place.category),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    if (place.lat != null && place.lng != null) ...[
                      Row(
                        children: [
                          Icon(Icons.map_outlined, size: 20, color: Colors.grey[700]),
                          const SizedBox(width: 8),
                          Text(
                            'Coordinates: ${place.lat!.toStringAsFixed(4)}, ${place.lng!.toStringAsFixed(4)}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          _toggleStamp(place);
                        },
                        icon: Icon(isStamped ? Icons.remove_circle : Icons.add_circle),
                        label: Text(isStamped ? 'Remove Stamp' : 'Add Stamp'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isStamped ? Colors.red : Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
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

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final totalPlaces = kPassportPlaces.length;
    final stampedPlaces = _stampedIds.length;
    final progress = totalPlaces == 0 ? 0.0 : stampedPlaces / totalPlaces;
    final filteredPlaces = _filteredPlaces;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perak Passport'),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Center(
            child: Text(
              'Collect your Perak stamps!',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Passport Progress',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${(progress * 100).toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$stampedPlaces of $totalPlaces places stamped',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(8),
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        progress < 0.3
                            ? Colors.orange
                            : progress < 0.7
                            ? Colors.blue
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  'Filter by Category',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  '${filteredPlaces.length} places',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip('All'),
                const SizedBox(width: 8),
                _buildFilterChip('Attraction'),
                const SizedBox(width: 8),
                _buildFilterChip('Food'),
                const SizedBox(width: 8),
                _buildFilterChip('Cafe'),
                const SizedBox(width: 8),
                _buildFilterChip('Hotel'),
                const SizedBox(width: 8),
                _buildFilterChip('Worship'),
                const SizedBox(width: 8),
                _buildFilterChip('Shopping'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: filteredPlaces.isEmpty
                ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    'No places found',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filteredPlaces.length,
              itemBuilder: (context, index) {
                final place = filteredPlaces[index];
                final isStamped = _stampedIds.contains(place.id);

                return GestureDetector(
                  onTap: () => _showPlaceDetails(place),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isStamped ? Colors.green[50] : Colors.grey[100],
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isStamped ? Colors.green : Colors.grey[300]!,
                        width: isStamped ? 2 : 1,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Icon(
                                    _getCategoryIcon(place.category),
                                    size: 40,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                place.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 2),
                                  Expanded(
                                    child: Text(
                                      place.region,
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[600],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: isStamped
                                  ? Colors.green
                                  : Colors.black.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  isStamped ? Icons.check_circle : Icons.circle_outlined,
                                  size: 12,
                                  color: isStamped ? Colors.white : Colors.black54,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  isStamped ? 'Stamped' : 'Not yet',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: isStamped ? Colors.white : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String category) {
    final isSelected = _selectedCategory == category;
    return FilterChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = category;
        });
      },
      selectedColor: Colors.blue[100],
      checkmarkColor: Colors.blue[700],
      labelStyle: TextStyle(
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        color: isSelected ? Colors.blue[700] : Colors.grey[700],
      ),
      side: BorderSide(
        color: isSelected ? Colors.blue : Colors.grey[300]!,
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Attraction':
        return Icons.attractions;
      case 'Food':
        return Icons.restaurant;
      case 'Cafe':
        return Icons.local_cafe;
      case 'Hotel':
        return Icons.hotel;
      case 'Worship':
        return Icons.temple_hindu;
      case 'Shopping':
        return Icons.shopping_bag;
      default:
        return Icons.place;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Attraction':
        return Colors.blue[50]!;
      case 'Food':
        return Colors.orange[50]!;
      case 'Cafe':
        return Colors.brown[50]!;
      case 'Hotel':
        return Colors.purple[50]!;
      case 'Worship':
        return Colors.teal[50]!;
      case 'Shopping':
        return Colors.pink[50]!;
      default:
        return Colors.grey[50]!;
    }
  }

  Color _getCategoryTextColor(String category) {
    switch (category) {
      case 'Attraction':
        return Colors.blue[700]!;
      case 'Food':
        return Colors.orange[700]!;
      case 'Cafe':
        return Colors.brown[700]!;
      case 'Hotel':
        return Colors.purple[700]!;
      case 'Worship':
        return Colors.teal[700]!;
      case 'Shopping':
        return Colors.pink[700]!;
      default:
        return Colors.grey[700]!;
    }
  }
}