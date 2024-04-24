class FileDataModel {
  final String fileName;
  final String fileUrl;
  final String iconPath;
  final CategoryFile category;

  FileDataModel({
    required this.category,
    required this.iconPath,
    required this.fileName,
    required this.fileUrl,
  });
}

enum CategoryFile {
  all,
  traffic,
  improve,
  language,
  programming,
}
