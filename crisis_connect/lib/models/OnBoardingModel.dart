
class OnBoardingContent {
  final String title;
  final String description;

  OnBoardingContent({
    required this.title,
    required this.description,
  });
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: "ALERTS",
      description: "Receive alerts about any natural disasters likely to happen in your neighbourhood."
  ),
  OnBoardingContent(
      title: "CONNECT",
      description: "Easily contact nearby rescue services and/or emergency contacts in the case of a disaster. Also share your live location with them."
  ),
  OnBoardingContent(
      title: "LEARN",
      description: "Stay updated on how to respond to different natural disasters."
  ),

];