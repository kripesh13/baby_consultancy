// import 'package:intl/intl.dart';

// class DateFormatter {
//   /// Format a [DateTime], timestamp (int), or date string into the given [pattern].
//   /// Example: DateFormatter.format(DateTime.now(), pattern: 'yyyy-MM-dd')
//   static String format(dynamic date, {String pattern = 'yyyy-MM-dd'}) {
//     if (date == null) return '';

//     try {
//       DateTime parsed;

//       if (date is DateTime) {
//         parsed = date;
//       } else if (date is int) {
//         // Handle int as timestamp
//         // Detect if seconds or milliseconds (timestamp before year 3000 check)
//         if (date.toString().length == 10) {
//           // Seconds
//           parsed = DateTime.fromMillisecondsSinceEpoch(date * 1000);
//         } else {
//           // Milliseconds
//           parsed = DateTime.fromMillisecondsSinceEpoch(date);
//         }
//       } else if (date is String) {
//         // Try parsing string as ISO or other format
//         parsed = DateTime.tryParse(date) ?? DateTime.now();
//       } else {
//         return date.toString();
//       }

//       return DateFormat(pattern).format(parsed);
//     } catch (e) {
//       return date.toString();
//     }
//   }

//   static DateTime? parse(String? dateString) {
//     if (dateString == null || dateString.isEmpty) return null;
//     try {
//       return DateTime.parse(dateString);
//     } catch (_) {
//       return null;
//     }
//   }

//   static String yyyyMMdd(dynamic date) =>
//       format(date, pattern: 'yyyy-MM-dd');
//   static String ddMMyyyy(dynamic date) =>
//       format(date, pattern: 'dd/MM/yyyy');
//   static String readable(dynamic date) =>
//       format(date, pattern: 'MMM dd, yyyy');
//   static String full(dynamic date) =>
//       format(date, pattern: 'EEEE, MMM dd, yyyy');
//   static String formatLongDate(dynamic date) =>
//       format(date, pattern: 'd MMMM, yyyy');
// }
