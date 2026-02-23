import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'booking_confirmation_screen.dart';

class _Vehicle {
  final String name;
  final String type;
  final int passengers;
  final int luggage;
  final String price;
  final String eta;
  final IconData icon;
  final String assetPath;
  final bool isPremium;

  const _Vehicle({
    required this.name,
    required this.type,
    required this.passengers,
    required this.luggage,
    required this.price,
    required this.eta,
    required this.icon,
    required this.assetPath,
    this.isPremium = false,
  });
}

const _dummyVehicles = <_Vehicle>[
  _Vehicle(
    name: 'Economy Sedan',
    type: 'Toyota Corolla or similar',
    passengers: 3,
    luggage: 2,
    price: '€25.00',
    eta: '~25 min',
    icon: Icons.directions_car_rounded,
    assetPath: 'assets/images/vehicles/toyota_corolla.png',
  ),
  _Vehicle(
    name: 'Comfort Plus',
    type: 'Mercedes E-Class',
    passengers: 3,
    luggage: 3,
    price: '€38.00',
    eta: '~25 min',
    icon: Icons.directions_car_filled_rounded,
    assetPath: 'assets/images/vehicles/mercedes_eclass.png',
  ),
  _Vehicle(
    name: 'VIP Vito',
    type: 'Mercedes-Benz Vito',
    passengers: 6,
    luggage: 6,
    price: '€55.00',
    eta: '~25 min',
    icon: Icons.airport_shuttle_rounded,
    assetPath: 'assets/images/vehicles/mercedes_vito.png',
    isPremium: true,
  ),
  _Vehicle(
    name: 'Mercedes Sprinter',
    type: 'VIP Group Shuttle',
    passengers: 12,
    luggage: 12,
    price: '€75.00',
    eta: '~30 min',
    icon: Icons.directions_bus_rounded,
    assetPath: 'assets/images/vehicles/mercedes_sprinter.png',
    isPremium: true,
  ),
  _Vehicle(
    name: 'Cadillac Escalade',
    type: 'Premium Luxury SUV',
    passengers: 4,
    luggage: 4,
    price: '€90.00',
    eta: '~25 min',
    icon: Icons.directions_car_rounded,
    assetPath: 'assets/images/vehicles/cadillac_escalade.png',
    isPremium: true,
  ),
];

class VehicleSelectionScreen extends StatelessWidget {
  const VehicleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.twilightBlue.withOpacity(0.8),
              AppColors.deepNavy,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildRouteInfo(),
              Expanded(child: _buildVehicleList(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.arrow_back_rounded,
                  color: Colors.white, size: 22),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              'Choose Your Ride',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.warmOrange.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.warmOrange.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.sort_rounded,
                    color: AppColors.warmOrange, size: 16),
                const SizedBox(width: 4),
                Text(
                  'Sort',
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.warmOrange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRouteInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.twilightBlue.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Column(
            children: [
              const Icon(Icons.flight_land_rounded,
                  color: AppColors.warmOrange, size: 18),
              Container(
                width: 2,
                height: 20,
                margin: const EdgeInsets.symmetric(vertical: 4),
                color: AppColors.warmOrange.withOpacity(0.3),
              ),
              const Icon(Icons.location_on_rounded,
                  color: AppColors.softCoral, size: 18),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Antalya Airport (AYT)',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Belek Hotel Zone',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '25 Feb',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '14:30',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleList(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      itemCount: _dummyVehicles.length,
      itemBuilder: (context, index) {
        return _VehicleCard(vehicle: _dummyVehicles[index]);
      },
    );
  }
}

class _VehicleCard extends StatelessWidget {
  final _Vehicle vehicle;

  const _VehicleCard({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: vehicle.isPremium
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.cardDark,
                  AppColors.deepOrange.withOpacity(0.15),
                ],
              )
            : AppColors.cardGradient,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: vehicle.isPremium
              ? AppColors.warmOrange.withOpacity(0.3)
              : AppColors.twilightBlue.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: vehicle.isPremium
                ? AppColors.deepOrange.withOpacity(0.15)
                : Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              vehicle.name,
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          if (vehicle.isPremium) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                gradient: AppColors.buttonGradient,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                'VIP',
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        vehicle.type,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      vehicle.price,
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.goldenYellow,
                      ),
                    ),
                    Text(
                      vehicle.eta,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: vehicle.isPremium
                    ? AppColors.warmOrange.withOpacity(0.08)
                    : AppColors.deepNavy.withOpacity(0.4),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: vehicle.isPremium
                      ? AppColors.warmOrange.withOpacity(0.15)
                      : AppColors.twilightBlue.withOpacity(0.12),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(
                  vehicle.assetPath,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Center(
                    child: Icon(
                      vehicle.icon,
                      color: vehicle.isPremium
                          ? AppColors.warmOrange
                          : AppColors.textMuted,
                      size: 40,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                _buildCapacityChip(
                  Icons.person_rounded,
                  '${vehicle.passengers} pax',
                ),
                const SizedBox(width: 10),
                _buildCapacityChip(
                  Icons.luggage_rounded,
                  '${vehicle.luggage} bags',
                ),
                const Spacer(),
                _buildSelectButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCapacityChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.textMuted),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.buttonGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.deepOrange.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => BookingConfirmationScreen(
                  vehicleName: vehicle.name,
                  vehicleType: vehicle.type,
                  price: vehicle.price,
                  assetPath: vehicle.assetPath,
                  passengers: vehicle.passengers,
                ),
              ),
            );
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Text(
              'Select',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
