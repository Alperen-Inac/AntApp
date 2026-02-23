import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class _Notification {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String body;
  final String time;
  final bool isUnread;
  final String category;

  const _Notification({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.body,
    required this.time,
    required this.category,
    this.isUnread = false,
  });
}

const _dummyNotifications = [
  _Notification(
    icon: Icons.check_circle_rounded,
    iconBg: Color(0xFF4ADE80),
    title: 'Booking Confirmed',
    body: 'Your VIP Vito transfer from Airport to Belek on 25 Feb at 14:30 is confirmed. Driver details will be sent 1 hour before pickup.',
    time: '2 min ago',
    category: 'Bookings',
    isUnread: true,
  ),
  _Notification(
    icon: Icons.local_offer_rounded,
    iconBg: AppColors.goldenYellow,
    title: '20% Off Your Next Ride!',
    body: 'Welcome to Antalya! Enjoy 20% discount on your next transfer. Use code: WELCOME20',
    time: '1 hour ago',
    category: 'Offers',
    isUnread: true,
  ),
  _Notification(
    icon: Icons.star_rounded,
    iconBg: AppColors.warmOrange,
    title: 'Rate Your Last Trip',
    body: 'How was your transfer from Airport to Lara Beach? Your feedback helps us improve.',
    time: '3 hours ago',
    category: 'Bookings',
  ),
  _Notification(
    icon: Icons.directions_car_rounded,
    iconBg: AppColors.twilightBlue,
    title: 'Driver On The Way',
    body: 'Mehmet is heading to Antalya Airport. He will arrive in approximately 5 minutes. Black Mercedes Vito, plate 07 ANT 456.',
    time: 'Yesterday',
    category: 'Bookings',
  ),
  _Notification(
    icon: Icons.auto_awesome,
    iconBg: AppColors.softCoral,
    title: 'AI Concierge Tip',
    body: 'The weather in Belek will be 28°C and sunny tomorrow. Perfect for visiting Aspendos! Shall I arrange a transfer?',
    time: 'Yesterday',
    category: 'System',
  ),
  _Notification(
    icon: Icons.payment_rounded,
    iconBg: Color(0xFF60A5FA),
    title: 'Payment Successful',
    body: 'Your payment of €35.00 for the Airport → Belek transfer has been processed successfully.',
    time: '2 days ago',
    category: 'System',
  ),
  _Notification(
    icon: Icons.card_giftcard_rounded,
    iconBg: AppColors.goldenYellow,
    title: 'Gold Member Reward',
    body: 'Congratulations! You have earned Gold Member status. Enjoy priority booking and exclusive discounts.',
    time: '3 days ago',
    category: 'Offers',
  ),
];

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  static const _filters = ['All', 'Bookings', 'Offers', 'System'];
  int _selectedFilter = 0;

  List<_Notification> get _filtered {
    if (_selectedFilter == 0) return _dummyNotifications;
    final cat = _filters[_selectedFilter];
    return _dummyNotifications.where((n) => n.category == cat).toList();
  }

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
              _buildFilterChips(),
              Expanded(child: _buildNotificationList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final unreadCount =
        _dummyNotifications.where((n) => n.isUnread).length;
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
              'Notifications',
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          if (unreadCount > 0)
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.deepOrange.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: AppColors.deepOrange.withOpacity(0.3)),
              ),
              child: Text(
                '$unreadCount new',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.warmOrange,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        height: 38,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: _filters.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, index) {
            final isSelected = index == _selectedFilter;
            return GestureDetector(
              onTap: () => setState(() => _selectedFilter = index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  gradient:
                      isSelected ? AppColors.buttonGradient : null,
                  color: isSelected ? null : Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(20),
                  border: isSelected
                      ? null
                      : Border.all(
                          color: AppColors.twilightBlue.withOpacity(0.25)),
                ),
                child: Text(
                  _filters[index],
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.textMuted,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    final items = _filtered;
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.notifications_off_rounded,
                color: AppColors.textMuted.withOpacity(0.4), size: 56),
            const SizedBox(height: 12),
            Text(
              'No notifications here',
              style: GoogleFonts.poppins(
                fontSize: 15,
                color: AppColors.textMuted.withOpacity(0.6),
              ),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: items.length,
      itemBuilder: (_, index) {
        return _NotificationTile(notification: items[index]);
      },
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final _Notification notification;
  const _NotificationTile({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: notification.isUnread
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.cardDark,
                  AppColors.warmOrange.withOpacity(0.06),
                ],
              )
            : AppColors.cardGradient,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: notification.isUnread
              ? AppColors.warmOrange.withOpacity(0.2)
              : AppColors.twilightBlue.withOpacity(0.2),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: notification.iconBg.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(notification.icon,
                color: notification.iconBg, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        notification.title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    if (notification.isUnread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.warmOrange,
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notification.body,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: AppColors.textMuted,
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  notification.time,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: AppColors.textMuted.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
