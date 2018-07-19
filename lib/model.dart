class PageModel {
  final String assetImagePath;
  final String text;
  PageModel({this.assetImagePath, this.text});
}

List<PageModel> pages = [
  PageModel(
    assetImagePath: 'assets/First.png',
    text: 'Want to take up a strength or weight lifting program ',
  ),
  PageModel(
    assetImagePath: 'assets/Middle.png',
    text: 'Crank up the intensity and revitalize your training',
  ),
  PageModel(
      assetImagePath: 'assets/Third.png',
      text: 'Track your progress and get stronger'),
];
