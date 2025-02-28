class DetailedSettings {
  double switchDelay = 0.3;

  DetailedSettings({
    required this.switchDelay,
  });

  factory DetailedSettings.fromJson(Map<String, dynamic> json) {
    return DetailedSettings(
      switchDelay: (json['switchDelay'] as num?)?.toDouble() ?? 0.3,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'switchDelay': switchDelay,
    };
  }
}