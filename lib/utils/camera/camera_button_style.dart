import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class CameraButtonStyle extends Equatable {
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? labelColor;

  const CameraButtonStyle({
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.labelColor,
  });

  CameraButtonStyle copyWith({
    Color? backgroundColor,
    double? fontSize,
    FontWeight? fontWeight,
    Color? labelColor,
  }) {
    return CameraButtonStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      labelColor: labelColor ?? this.labelColor,
    );
  }

  @override
  List<Object?> get props => [
        backgroundColor,
        fontSize,
        fontWeight,
        labelColor,
      ];
}
