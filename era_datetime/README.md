# era_datetime

A Flutter library for handling date and time in different chronologies within the Gregorian calendar. This package provides a flexible way to work with various era systems while maintaining compatibility with the standard Gregorian calendar.

## Features

- 🎗️ Support for multiple era systems
- 🕔 Seamless integration with Flutter's DateTime
- 📅 Custom formatting options for era dates
- 🛟 Type-safe era handling
- 🚀 Compatible with Flutter 3.3.0 and above

## Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  era_datetime: ^0.0.1
```

## Usage

```dart
import 'package:era_datetime/era_datetime.dart';

// Format dates with standard DateFormat
final shortFormat = DateFormat('yyyy-MM-dd'); 

// Create EraDateTime instances with sampleDate
final sampleDate = EraDateTime(2023, 5, 15); 


print(shortFormat.eraFormat(sampleDate); // 2024-05-15
print(shortFormat.eraFormat(sampleDate, Eras.buddhist)); // 2566-05-15


// Create EraDateTime instances with sampleDate at buddhist era
final sampleBuddhistDate = EraDateTime(2566, 5, 15, era: Eras.buddhist); 
 
print(shortFormat.eraFormat(sampleBuddhistDate); // 2566-05-15
print(shortFormat.eraFormat(sampleBuddhistDate, Eras.common)); // 2024-05-15

```

## API Reference

### EraDateTime

The main class for handling dates with era information.

### EraDateFormat

Utility class for formatting dates with era information.

### Eras

Constants defining different era systems.

## Requirements

- Dart SDK: ^3.7.0
- Flutter: >=3.3.0

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License, See the LICENSE file in the repository for full details.

## Support

If you find this package helpful, please give it a star on [GitHub](https://github.com/b2nkuu/d2rt-project).
