// استيراد حزمة Firebase الأساسية
import 'package:firebase_core/firebase_core.dart';
// استيراد حزمة المواد الخاصة بفلاتر لبناء واجهات المستخدم
import 'package:flutter/material.dart';
// استيراد حزمة التعريب الخاصة بفلاتر لدعم اللغات المختلفة
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:harm/Home/HomePage.dart';
import 'package:harm/authentication/LoginPage.dart';
// استيراد صفحة الاختيار من مجلد المصادقة
import 'package:harm/authentication/chooicePage.dart';
import 'package:harm/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

// استيراد الخيارات الافتراضية ل Firebase
import 'firebase_options.dart';

// نقطة البداية للتطبيق
Future<void> main() async {
  // تأكد من تهيئة عناصر الواجهة قبل تنفيذ العمليات الأساسية
  WidgetsFlutterBinding.ensureInitialized();
  // تهيئة Firebase باستخدام الخيارات الافتراضية للمنصة الحالية
  harm.sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    // تعليق توضيحي: تهيئة Firebase
    options: DefaultFirebaseOptions
        .currentPlatform, // استخدام الخيارات الافتراضية ل Firebase للمنصة الحالية
  );

  // تشغيل التطبيق
  runApp(MyApp());
}

// الفئة الرئيسية للتطبيق وهي بلا حالة
class MyApp extends StatelessWidget {
  @override
  build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // إخفاء شريط التصحيح في الواجهة العلوية
      // ضمان التعريب الصحيح للتطبيق باللغة العربية
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', ''), // تحديد اللغة العربية بدون كود الدولة
      ],
      locale:
          Locale('ar', ''), // تعيين اللغة العربية كلغة افتراضية بدون كود الدولة

      // تعيين اتجاه النص للتطبيق بأكمله إلى اليمين إلى اليسار
      builder: (context, child) {
        return Directionality(
          textDirection:
              TextDirection.rtl, // تحديد اتجاه النص من اليمين إلى اليسار
          child: child!, // تطبيق الاتجاه على كل الويدجتس في التطبيق
        );
      },

      home: LoginPage(), // الصفحة الرئيسية للتطبيق هي صفحة الاختيار
    );
  }
}
