import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../../theme.dart';

// --- DATA MODEL (FIXED: Added const constructor) ---
class StatsData {
  final int calories;
  final int steps;
  final double durationHours;
  final int heartRate;

  const StatsData({
    required this.calories,
    required this.steps,
    required this.durationHours,
    required this.heartRate,
  });
}

// --- STATS SCREEN IMPLEMENTATION (FIXED: _stats field now uses const) ---
class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  final StatsData _stats = const StatsData(
    calories: 542,
    steps: 8743,
    durationHours: 2.57,
    heartRate: 78,
  );

  String _formatDuration(double hours) {
    int minutes = (hours * 60).round();
    int h = minutes ~/ 60;
    int m = minutes % 60;
    return ':';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundGradients(),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: _buildHeader(context)),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),

                  SliverToBoxAdapter(child: _buildMainStatsCard()),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),

                  SliverGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: 1.0,
                    children: [
                      _buildStatGridCard(
                          'CALORIES',
                          '',
                          'kcal burned',
                          FeatherIcons.zap,
                          0.68),
                      _buildStatGridCard(
                          'STEPS',
                          'k',
                          'of 10k today',
                          FeatherIcons.target,
                          0.87),
                      _buildStatGridCard(
                          'DURATION',
                          _formatDuration(_stats.durationHours),
                          'hours active',
                          FeatherIcons.trendingUp,
                          0.73),
                      _buildStatGridCard(
                          'HEART RATE',
                          '',
                          'bpm normal',
                          FeatherIcons.heart,
                          0.52),
                    ],
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),

                  SliverToBoxAdapter(child: _buildLeaderboardCard()),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),

                  SliverToBoxAdapter(child: _buildRecentActivityCard()),
                  const SliverToBoxAdapter(child: SizedBox(height: 120)),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // --- Widget Builders ---

  Widget _buildBackgroundGradients() {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryDark,
              Color(0xFF0A0F1F),
              primaryDark,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryBlue.withOpacity(0.05),
                  boxShadow: [
                    BoxShadow(
                      color: primaryBlue.withOpacity(0.1),
                      blurRadius: 100,
                      spreadRadius: 50,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -50,
              right: -50,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryBlue.withOpacity(0.05),
                  boxShadow: [
                    BoxShadow(
                      color: secondaryBlue.withOpacity(0.1),
                      blurRadius: 100,
                      spreadRadius: 50,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome back',
              style: TextStyle(fontSize: 14, color: textSecondary),
            ),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [textPrimary, neonBlue, primaryBlue],
              ).createShader(bounds),
              child: const Text(
                'Sarah Miller',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [primaryBlue, secondaryBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: primaryBlue.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Icon(Icons.person, color: textPrimary, size: 24),
          ),
        ),
      ],
    );
  }

  Widget _buildMainStatsCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: secondaryDark.withOpacity(0.9),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: neonBlue.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.2),
            blurRadius: 30,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TODAY'S ACTIVITY",
            style: TextStyle(
                fontSize: 12, color: textSecondary, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      const Text(
                        '1,247',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text('points',
                          style: TextStyle(
                              fontSize: 14, color: textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: primaryBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: neonBlue.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(FeatherIcons.zap,
                            color: neonBlue, size: 16),
                        const SizedBox(width: 6),
                        Text('+124 this week',
                            style: TextStyle(
                                color: neonBlue,
                                fontSize: 13,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: neonBlue.withOpacity(0.5), width: 3),
                  gradient: LinearGradient(
                    colors: [primaryBlue.withOpacity(0.2), secondaryBlue.withOpacity(0.1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Icon(FeatherIcons.activity, color: neonBlue, size: 40),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatGridCard(String title, String value, String subtitle,
      IconData icon, double progress) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: secondaryDark.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: neonBlue.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.1),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1),
              ),
              Icon(icon, color: neonBlue.withOpacity(0.6), size: 16),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(color: neonBlue.withOpacity(0.8), fontSize: 12),
          ),
          const Spacer(),
          Container(
            height: 4,
            decoration: const BoxDecoration(
              color: primaryDark,
              borderRadius: BorderRadius.all(Radius.circular(2)), 
            ),
            child: FractionallySizedBox(
              widthFactor: progress,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [secondaryBlue, neonBlue],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(2)), 
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaderboardCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: secondaryDark.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: neonBlue.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Leaderboard',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_right_alt, color: neonBlue.withOpacity(0.7)),
            ],
          ),
          const SizedBox(height: 15),
          _buildLeaderboardItem('You', '12,450 pts', '1st', true),
          const SizedBox(height: 8),
          _buildLeaderboardItem('Jordan Kim', '11,230 pts', '-1,220', false),
          const SizedBox(height: 8),
          _buildLeaderboardItem('Casey Lee', '10,890 pts', '-1,560', false),
        ],
      ),
    );
  }

  Widget _buildLeaderboardItem(
      String name, String points, String rankOrDiff, bool isSelf) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelf ? primaryBlue.withOpacity(0.2) : secondaryDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
            color: isSelf ? neonBlue.withOpacity(0.3) : primaryDark.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: isSelf
                  ? const LinearGradient(colors: [primaryBlue, secondaryBlue])
                  : const LinearGradient(
                      colors: [Color(0xFF475569), Color(0xFF334155)]),
            ),
            child: Center(
                child: Text(isSelf ? '??' : rankOrDiff[0] == '-' ? '2' : '3',
                    style: const TextStyle(fontSize: 14))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(points,
                    style:
                        const TextStyle(color: textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Text(rankOrDiff,
              style: TextStyle(
                  color: isSelf ? neonBlue : textSecondary.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildRecentActivityCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: secondaryDark.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: neonBlue.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Recent Activity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_right_alt, color: neonBlue.withOpacity(0.7)),
            ],
          ),
          const SizedBox(height: 15),
          _buildActivityItem('Morning Run', 'Today at 06:30 AM', '+542', FeatherIcons.zap),
          const SizedBox(height: 8),
          _buildActivityItem('Yoga Session', 'Yesterday at 07:15 PM', '+320', FeatherIcons.trendingUp),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
      String title, String time, String points, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: secondaryDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryDark.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: primaryBlue.withOpacity(0.2),
              border: Border.all(color: neonBlue.withOpacity(0.3)),
            ),
            child: Center(child: Icon(icon, color: neonBlue, size: 20)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                Text(time,
                    style:
                        const TextStyle(color: textSecondary, fontSize: 12)),
              ],
            ),
          ),
          Text(points,
              style: TextStyle(
                  color: neonBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: 80 + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
        top: 12,
        bottom: 12 + MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: neonBlue.withOpacity(0.1))),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryDark.withOpacity(0.8),
            primaryDark,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(FeatherIcons.home, 'Home', true),
          _buildNavItem(FeatherIcons.barChart2, 'Stats', false),
          _buildNavItem(FeatherIcons.bell, 'Alerts', false),
          _buildNavItem(FeatherIcons.grid, 'More', false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    final Color color = isActive ? neonBlue : textSecondary.withOpacity(0.7);

    return InkWell(
      onTap: () {
        debugPrint('Navigating to ');
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive ? primaryBlue.withOpacity(0.2) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: isActive ? neonBlue.withOpacity(0.3) : Colors.transparent),
            ),
            child: Icon(icon, color: color, size: 26),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
                color: color, fontSize: 11, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
