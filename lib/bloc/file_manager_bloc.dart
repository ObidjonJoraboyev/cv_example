import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/file_data_model.dart';
import '../data/models/file_status_model.dart';
import '../services/file_maneger_service.dart';

part 'file_manager_event.dart';

part 'file_manager_state.dart';

class FileManagerBloc extends Bloc<FileManagerEvent, FileManagerState> {
  FileManagerBloc()
      : super(
          const FileManagerState(
            progress: 0.0,
            newFileLocation: "",
          ),
        ) {
    on<DownloadFileEvent>(_downloadFile);
  }

  Future<void> _downloadFile(DownloadFileEvent event, emit) async {
    Dio dio = Dio();
    FileStatusModel fileStatusModel =
        await FileManagerService().checkFile(event.fileDataModel);
    if (fileStatusModel.isExist) {
      OpenFilex.open(fileStatusModel.newFileLocation);
    } else {
      await dio.download(
        event.fileDataModel.fileUrl,
        fileStatusModel.newFileLocation,
        onReceiveProgress: (count, total) async {
          emit(state.copyWith(progress: count / total));
        },
      );
      emit(
        state.copyWith(
          progress: 1,
          newFileLocation: fileStatusModel.newFileLocation,
        ),
      );
    }
  }

  Future<Directory?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = await getApplicationCacheDirectory();
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err) {
      debugPrint("Cannot get download folder path");
    }
    return directory;
  }
}
