import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class AiConciergeFab extends StatelessWidget {
  const AiConciergeFab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.buttonGradient,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.deepOrange.withOpacity(0.45),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: () => _openConciergeSheet(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: const Icon(Icons.auto_awesome, color: Colors.white, size: 26),
      ),
    );
  }

  void _openConciergeSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _AiConciergeSheet(),
    );
  }
}

class _ChatMessage {
  final String text;
  final bool isUser;
  final String time;

  const _ChatMessage({
    required this.text,
    required this.isUser,
    required this.time,
  });
}

const _mockMessages = [
  _ChatMessage(
    text:
        'Welcome to Antalya! 🌅 I\'m your AI Concierge. I can help with restaurant picks, sightseeing tips, or anything about your trip. What do you need?',
    isUser: false,
    time: '14:20',
  ),
  _ChatMessage(
    text: 'Yes, what are some good restaurants near Belek?',
    isUser: true,
    time: '14:21',
  ),
  _ChatMessage(
    text:
        'Great choice! Here are my top picks near Belek:\n\n🍽️ **Seraser Fine Dining** — Mediterranean cuisine with a stunning garden terrace.\n\n🥘 **Pio Gastro Bar** — Fusion dishes with an excellent wine selection.\n\n🐟 **Kalender Restaurant** — Fresh seafood right on the waterfront.\n\nWould you like me to help book a table or arrange a transfer to any of these?',
    isUser: false,
    time: '14:21',
  ),
  _ChatMessage(
    text: 'Kalender sounds amazing! How far is it from my hotel?',
    isUser: true,
    time: '14:22',
  ),
  _ChatMessage(
    text:
        'Kalender Restaurant is about 12 minutes from the Belek Hotel Zone. I can arrange a private transfer for you — just let me know the time and I\'ll have a driver ready! 🚗',
    isUser: false,
    time: '14:22',
  ),
];

class _AiConciergeSheet extends StatelessWidget {
  const _AiConciergeSheet();

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.cardDark,
            AppColors.deepNavy.withOpacity(0.98),
          ],
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        border: Border.all(color: AppColors.twilightBlue.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          _buildHandle(),
          _buildSheetHeader(),
          const Divider(color: Color(0xFF2F4A7A), height: 1),
          Expanded(child: _buildMessageList()),
          _buildQuickActions(),
          _buildInputBar(bottomInset),
        ],
      ),
    );
  }

  Widget _buildHandle() {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 4),
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  Widget _buildSheetHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              gradient: AppColors.buttonGradient,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.auto_awesome, color: Colors.white, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Concierge',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4ADE80),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Online — ready to help',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.more_horiz_rounded,
              color: Colors.white60,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: _mockMessages.length,
      itemBuilder: (context, index) {
        final msg = _mockMessages[index];
        return _MessageBubble(message: msg);
      },
    );
  }

  Widget _buildQuickActions() {
    final actions = [
      '🗺️ Sightseeing',
      '🍽️ Restaurants',
      '🚗 Transfers',
      '🏖️ Beaches',
    ];

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const BouncingScrollPhysics(),
        itemCount: actions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.warmOrange.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.warmOrange.withOpacity(0.25)),
            ),
            child: Text(
              actions[index],
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.warmOrange,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputBar(double bottomInset) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 8,
        top: 12,
        bottom: 12 + bottomInset,
      ),
      decoration: BoxDecoration(
        color: AppColors.deepNavy.withOpacity(0.8),
        border: Border(
          top: BorderSide(color: AppColors.twilightBlue.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.cardDark.withOpacity(0.6),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.twilightBlue.withOpacity(0.2),
                ),
              ),
              child: TextField(
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  hintText: 'Ask me anything about Antalya...',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.textMuted.withOpacity(0.6),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              gradient: AppColors.buttonGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.deepOrange.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final _ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                gradient: AppColors.buttonGradient,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.auto_awesome,
                  color: Colors.white, size: 15),
            ),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: isUser
                    ? AppColors.deepOrange.withOpacity(0.2)
                    : AppColors.cardDark.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isUser ? 18 : 4),
                  bottomRight: Radius.circular(isUser ? 4 : 18),
                ),
                border: Border.all(
                  color: isUser
                      ? AppColors.warmOrange.withOpacity(0.25)
                      : AppColors.twilightBlue.withOpacity(0.15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    message.text,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: isUser ? AppColors.paleGold : AppColors.textLight,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message.time,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      color: AppColors.textMuted.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isUser) ...[
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: AppColors.twilightBlue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.person_rounded,
                  color: Colors.white70, size: 16),
            ),
          ],
        ],
      ),
    );
  }
}
