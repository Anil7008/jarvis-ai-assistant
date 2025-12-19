import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  TextStyle get bodyMedium;
  TextStyle get headlineMedium;
  TextStyle get displaySmall;
}

class LightModeTheme extends FlutterFlowTheme {
  @override
  TextStyle get bodyMedium => GoogleFonts.poppins(
    color: Color(0xFF1F2937),
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );

  @override
  TextStyle get headlineMedium => GoogleFonts.poppins(
    color: Color(0xFF111827),
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle get displaySmall => GoogleFonts.poppins(
    color: Color(0xFF111827),
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );
}
