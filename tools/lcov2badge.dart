// ignore_for_file: avoid_print

import 'dart:io';

void main(List<String> args) {
  if (args.length < 2) {
    print('Usage: dart run tools/lcov2badge.dart <lcovFile> <svgOutput>');
    exit(1);
  }

  final lcovPath = args[0];
  final svgPath = args[1];

  final file = File(lcovPath);
  if (!file.existsSync()) {
    print('\x1B[31m[coverage] ✖ ERROR\x1B[0m lcov.info not found at $lcovPath');
    exit(1);
  }

  int totalLines = 0;
  int coveredLines = 0;

  // Parse LCOV
  for (final line in file.readAsLinesSync()) {
    if (line.startsWith('DA:')) {
      // Example: DA:56,3 → line 56, executed 3 times
      final parts = line.substring(3).split(',');
      final executionCount = int.tryParse(parts[1]) ?? 0;

      totalLines++;
      if (executionCount > 0) coveredLines++;
    }
  }

  if (totalLines == 0) {
    print('\x1B[31m[coverage] ✖ ERROR\x1B[0m No coverage data found.');
    exit(1);
  }

  final percent = ((coveredLines / totalLines) * 100).round();

  // Color thresholds
  final color = (percent >= 90)
      ? '#4c1'
      : (percent >= 70)
      ? '#dfb317'
      : (percent >= 50)
      ? '#fe7d37'
      : '#e05d44';

  final label = "coverage";

  final svgContent =
      '''
<svg xmlns="http://www.w3.org/2000/svg" width="140" height="20" role="img" aria-label="$label: $percent%">
  <linearGradient id="b" x2="0" y2="100%">
    <stop offset="0" stop-color="#fff" stop-opacity=".7"/>
    <stop offset=".1" stop-opacity=".1"/>
  </linearGradient>
  <mask id="a">
    <rect width="140" height="20" rx="3" fill="#fff"/>
  </mask>
  <g mask="url(#a)">
    <rect width="80" height="20" fill="#555"/>
    <rect x="80" width="60" height="20" fill="$color"/>
    <rect width="140" height="20" fill="url(#b)"/>
  </g>
  <g fill="#fff" text-anchor="middle"
     font-family="Verdana,DejaVu Sans,Geneva,sans-serif" font-size="11">
    <text x="40" y="14">$label</text>
    <text x="110" y="14">$percent%</text>
  </g>
</svg>
''';

  File(svgPath).writeAsStringSync(svgContent);

  print(
    '\x1B[32m[coverage] ✔ SUCCESS\x1B[0m Coverage badge generated → $svgPath ($percent%)',
  );
}
