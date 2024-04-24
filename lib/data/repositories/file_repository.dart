import '../models/file_data_model.dart';

class FileRepository {
  List<FileDataModel> files = [
    FileDataModel(
      category: CategoryFile.programming,
      iconPath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Python.svg/1200px-Python.svg.png",
      fileName: "Python Book",
      fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
    ),
  ];
}
