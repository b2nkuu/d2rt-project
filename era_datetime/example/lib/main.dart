import 'package:era_datetime/era_datetime.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

Future<void> main() async {
  await initializeDateFormatting('en_US');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _currentLocale = const Locale('en', 'US');

  void _changeLocale(Locale locale) {
    setState(() {
      _currentLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get current date
    final now = EraDateTime.now();

    // Fix date
    final fixedDate = EraDateTime(2024, 3, 15);

    // Initialize Intl with the current locale
    Intl.defaultLocale = _currentLocale.toString();

    // Create current date in different eras
    final currentCommonEra = EraDateTime(
      now.year,
      now.month,
      now.day,
      hour: now.hour,
      minute: now.minute,
      second: now.second,
    );
    final currentAnnoDominiEra = EraDateTime(
      now.year,
      now.month,
      now.day,
      hour: now.hour,
      minute: now.minute,
      second: now.second,
      era: Eras.christian,
    );
    final currentBuddhistEra = EraDateTime(
      now.year + 543,
      now.month,
      now.day,
      hour: now.hour,
      minute: now.minute,
      second: now.second,
      era: Eras.buddhist,
    );
    final currentRattanakosinEra = EraDateTime(
      now.year - 1781,
      now.month,
      now.day,
      hour: now.hour,
      minute: now.minute,
      second: now.second,
      era: Eras.rattanakosin,
    );

    // Create different date formatters
    final shortFormatter = DateFormat(
      'G yyyy-MM-dd',
      _currentLocale.toString(),
    );
    final longFormatter = DateFormat(
      'EEEE, dd MMMM yyyy GGGG',
      _currentLocale.toString(),
    );
    final midFormatter = DateFormat(
      'dd MMM GG yyyy',
      _currentLocale.toString(),
    );
    final timeFormatter = DateFormat(
      'G yyyy-MM-dd HH:mm:ss',
      _currentLocale.toString(),
    );

    // Rattanakosin Era (RE)
    final reEraFormatter = DateFormat('G yyy-MM-dd', _currentLocale.toString());
    final reEraLongFormatter = DateFormat(
      'EEEE, dd MMMM yyyy GGGG',
      _currentLocale.toString(),
    );
    final reEraMidFormatter = DateFormat(
      'dd MMM GG yyyy',
      _currentLocale.toString(),
    );
    final reEraTimeFormatter = DateFormat(
      'G yyy-MM-dd HH:mm:ss',
      _currentLocale.toString(),
    );

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan),
      ),
      supportedLocales: const [Locale('en', 'US'), Locale('th', 'TH')],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('EraDateTime Example'),
          actions: [
            PopupMenuButton<Locale>(
              icon: const Icon(Icons.language),
              onSelected: _changeLocale,
              itemBuilder:
                  (context) => [
                    const PopupMenuItem(
                      value: Locale('en', 'US'),
                      child: Text('English (US)'),
                    ),
                    const PopupMenuItem(
                      value: Locale('th', 'TH'),
                      child: Text('ไทย (Thai)'),
                    ),
                  ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Current Date Examples: ${now.toIso8601String()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // print format
                  // Anno Domini (AD) Current Date Group
                  const Text(
                    'Pattern:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Short: ${shortFormatter.pattern ?? ''}'),
                          Text('Mid: ${midFormatter.pattern ?? ''}'),
                          Text('Long: ${longFormatter.pattern ?? ''}'),
                          Text('Time: ${timeFormatter.pattern ?? ''}'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Divider(thickness: 2, height: 32, color: Colors.grey),
                  const SizedBox(height: 16),

                  // Anno Domini (AD) Current Date Group
                  const Text(
                    'Anno Domini (AD) Current Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short format: ${shortFormatter.eraFormat(currentAnnoDominiEra)}',
                          ),
                          Text(
                            'Mid format: ${midFormatter.eraFormat(currentAnnoDominiEra)}',
                          ),
                          Text(
                            'Long format: ${longFormatter.eraFormat(currentAnnoDominiEra)}',
                          ),
                          Text(
                            'With time: ${timeFormatter.eraFormat(currentAnnoDominiEra)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Common Era (CE) Current Date Group
                  const Text(
                    'Common Era (CE) Current Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short format: ${shortFormatter.eraFormat(currentCommonEra)}',
                          ),
                          Text(
                            'Mid format: ${midFormatter.eraFormat(currentCommonEra)}',
                          ),
                          Text(
                            'Long format: ${longFormatter.eraFormat(currentCommonEra)}',
                          ),
                          Text(
                            'With time: ${timeFormatter.eraFormat(currentCommonEra)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Buddhist Era (BE) Current Date Group
                  const Text(
                    'Buddhist Era (BE) Current Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short format: ${shortFormatter.eraFormat(currentBuddhistEra)}',
                          ),
                          Text(
                            'Mid format: ${midFormatter.eraFormat(currentBuddhistEra)}',
                          ),
                          Text(
                            'Long format: ${longFormatter.eraFormat(currentBuddhistEra)}',
                          ),
                          Text(
                            'With time: ${timeFormatter.eraFormat(currentBuddhistEra)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Rattanakosin Era (RE) Current Date Group
                  const Text(
                    'Rattanakosin Era (RE) Current Date:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short format: ${reEraFormatter.eraFormat(currentRattanakosinEra)}',
                          ),
                          Text(
                            'Mid format: ${reEraMidFormatter.eraFormat(currentRattanakosinEra)}',
                          ),
                          Text(
                            'Long format: ${reEraLongFormatter.eraFormat(currentRattanakosinEra)}',
                          ),
                          Text(
                            'With time: ${reEraTimeFormatter.eraFormat(currentRattanakosinEra)}',
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Divider(thickness: 2, height: 32, color: Colors.grey),
                  const SizedBox(height: 16),

                  // Cross-Era Current Date Group
                  const Text(
                    'Cross-Era Current Date Examples:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current CE date in BE: ${shortFormatter.eraFormat(currentCommonEra, formatEra: Eras.buddhist)}',
                          ),
                          Text(
                            'Current BE date in CE: ${shortFormatter.eraFormat(currentBuddhistEra, formatEra: Eras.christian)}',
                          ),
                          Text(
                            'Current RE date in BE: ${shortFormatter.eraFormat(currentRattanakosinEra, formatEra: Eras.buddhist)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 2, height: 32, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text(
                    'Fixed Date Examples: ${fixedDate.toIso8601String()}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Anno Domini (AD) Fixed Date Group
                  const Text(
                    'Anno Domini (AD) Examples:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short format: ${shortFormatter.eraFormat(fixedDate)}',
                          ),
                          Text(
                            'Long format: ${longFormatter.eraFormat(fixedDate)}',
                          ),
                          Text(
                            'With time: ${timeFormatter.eraFormat(fixedDate)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Common Era (CE) Fixed Date Group
                  const Text(
                    'Common Era (CE) Examples:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short format: ${shortFormatter.eraFormat(fixedDate, formatEra: Eras.christian)}',
                          ),
                          Text(
                            'Mid format: ${midFormatter.eraFormat(fixedDate, formatEra: Eras.christian)}',
                          ),
                          Text(
                            'Long format: ${longFormatter.eraFormat(fixedDate, formatEra: Eras.christian)}',
                          ),
                          Text(
                            'With time: ${timeFormatter.eraFormat(fixedDate, formatEra: Eras.christian)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Buddhist Era (BE) Fixed Date Group
                  const Text(
                    'Buddhist Era (BE) Examples:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short format: ${shortFormatter.eraFormat(fixedDate, formatEra: Eras.buddhist)}',
                          ),
                          Text(
                            'Mid format: ${midFormatter.eraFormat(fixedDate, formatEra: Eras.buddhist)}',
                          ),
                          Text(
                            'Long format: ${longFormatter.eraFormat(fixedDate, formatEra: Eras.buddhist)}',
                          ),
                          Text(
                            'With time: ${timeFormatter.eraFormat(fixedDate, formatEra: Eras.buddhist)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Rattanakosin Era (RE) Fixed Date Group
                  const Text(
                    'Rattanakosin Era (RE) Examples:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Short format: ${reEraFormatter.eraFormat(fixedDate, formatEra: Eras.rattanakosin)}',
                          ),
                          Text(
                            'Long format: ${reEraLongFormatter.eraFormat(fixedDate, formatEra: Eras.rattanakosin)}',
                          ),
                          Text(
                            'With time: ${reEraTimeFormatter.eraFormat(fixedDate, formatEra: Eras.rattanakosin)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
