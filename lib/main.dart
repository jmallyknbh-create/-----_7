 import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const OmarWhatsAppApp());
}

class AppTheme {
  ألوان وتساب جمال الداكن
  static const Color background = Color(0xFF0D141A);
  static const Color surface = Color(0xFF17212B);
  static const Color surfaceAlt = Color(0xFF242F3D);
  static const Color border = Color(0xFF1E2C3A);
  static const Color primary = Color(0xFF00A884);
  static const Color primaryLight = Color(0xFF25D366);
  static const Color success = Color(0xFF00A884);
  static const Color danger = Color(0xFFE53935);
  static const Color warning = Color(0xFFFFA000);
  static const Color textPrimary = Color(0xFFF5F5F5);
  static const Color textMuted = Color(0xFF7F91A0);

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: primaryLight,
          surface: surface,
          error: danger,
        ),
      );
}

class OmarWhatsAppApp extends StatelessWidget {
  const OmarWhatsAppApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'واتساب جمال كنبه (نسخة عمر)',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const OmarHomeScreen(),
    );
  }
}

class OmarHomeScreen extends StatefulWidget {
  const OmarHomeScreen({Key? key}) : super(key: key);

  @override
  State<OmarHomeScreen> createState() => _OmarHomeScreenState();
}

class _OmarHomeScreenState extends State<OmarHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.surface,
        elevation: 2,
        title: const Text(
          'واتساب جمال كنبه',
          style: TextStyle(
            color: AppTheme.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // إيقاف الإنترنت (وضع الطيران داخل واتساب جمال)
          IconButton(
            icon: const Icon(Icons.flight_takeoff, color: AppTheme.textPrimary),
            tooltip: 'وضع الطيران',
            onPressed: () {},
          ),
          // الوضع الليلي / الفاتح
          IconButton(
            icon: const Icon(Icons.nightlight_round, color: AppTheme.textPrimary),
            tooltip: 'تغيير الثيم',
            onPressed: () {},
          ),
          // البحث
          IconButton(
            icon: const Icon(Icons.search, color: AppTheme.textPrimary),
            onPressed: () {},
          ),
قائمة إضافات واتساب جمال  ر
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: AppTheme.textPrimary),
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'omar_settings',
                  child: Text('إضافات جمال كنبه'),
                ),
                const PopupMenuItem(
                  value: 'auto_reply',
                  child: Text('الرد التلقائي'),
                ),
                const PopupMenuItem(
                  value: 'schedule_msg',
                  child: Text('جدولة الرسائل'),
                ),
                const PopupMenuItem(
                  value: 'restart',
                  child: Text('إعادة تشغيل الواتساب'),
                ),
                const PopupMenuItem(
                  value: 'num_msg',
                  child: Text('إرسال رقم غير محفوظ'),
                ),
                const PopupMenuItem(
                  value: 'settings',
                  child: Text('الإعدادات'),
                ),
              ];
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppTheme.primary,
          indicatorWeight: 3,
          labelColor: AppTheme.primary,
          unselectedLabelColor: AppTheme.textMuted,
          tabs: const [
            Tab(icon: Icon(Icons.groups)),
            Tab(text: 'الدردشات'),
            Tab(text: 'الحالات'),
            Tab(text: 'المكالمات'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // شاشة المجتمعات / المجموعات
          const Center(
            child: Text(
              'المجتمعات والمجموعات',
              style: TextStyle(color: AppTheme.textPrimary, fontSize: 16),
            ),
          ),
          // شاشة المحادثات الرئيسية
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.chat_bubble_outline, size: 60, color: AppTheme.primary),
                SizedBox(height: 15),
                Text(
                  'مرحباً بك في واتساب جمال كنبه',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'نسخة متطورة بطراز واتساب عمر',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
                ),
              ],
            ),
          ),
          // شاشة الحالات
          const Center(
            child: Text(
              'الحالات / الاستوري',
              style: TextStyle(color: AppTheme.textPrimary, fontSize: 16),
            ),
          ),
          // شاشة المكالمات
          const Center(
            child: Text(
              'سجل المكالمات',
              style: TextStyle(color: AppTheme.textPrimary, fontSize: 16),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primary,
        onPressed: () {},
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}