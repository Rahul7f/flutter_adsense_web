class AdModel {
  final String divId;
  final String slotId;
  final int width;
  final int height;

  const AdModel({
    required this.divId,
    required this.slotId,
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'divId': divId,
      'slot': slotId,
      'width': width,
      'height': height,
    };
  }
}