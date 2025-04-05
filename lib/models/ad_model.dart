/// A model representing the configuration of a Google AdSense banner.
class AdModel {
  /// The HTML `div` element ID where the ad will be rendered.
  final String divId;

  /// The Google AdSense slot ID for the ad.
  final String slotId;

  /// The width of the ad in pixels.
  final int width;

  /// The height of the ad in pixels.
  final int height;

  /// Creates an [AdModel] with the given parameters.
  ///
  /// [divId] is the HTML element ID where the ad will be inserted.
  /// [slotId] is the AdSense slot identifier.
  /// [width] and [height] define the ad size.
  const AdModel({
    required this.divId,
    required this.slotId,
    required this.width,
    required this.height,
  });

  /// Converts this [AdModel] into a `Map` representation.
  Map<String, dynamic> toMap() {
    return {
      'divId': divId,
      'slot': slotId,
      'width': width,
      'height': height,
    };
  }
}
