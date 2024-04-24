import 'package:cv_example/bloc/file_manager_bloc.dart';
import 'package:cv_example/data/repositories/file_repository.dart';
import 'package:cv_example/screen/tab/feedback.dart';
import 'package:cv_example/screen/tab/first.dart';
import 'package:cv_example/screen/tab/next.dart';
import 'package:cv_example/screen/tab/settings.dart';
import 'package:cv_example/screen/tab/teach.dart';
import 'package:cv_example/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:open_filex/open_filex.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  final List<Widget> screens = [
     FirstScreen(),
    const TeachScreen(),
    const NextScreen(),
    const SettingsScreen(),
    const FeedBackScreen(),
  ];

  int index = 0;

  FileManagerBloc fileManagerBloc = FileManagerBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: fileManagerBloc,
      child: BlocBuilder<FileManagerBloc, FileManagerState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xffFDFDFD),
              title: const Text(
                "CV",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () async {
                    if (state.newFileLocation.isEmpty) {
                      fileManagerBloc.add(
                        DownloadFileEvent(
                          fileDataModel:
                              context.read<FileRepository>().files.first,
                        ),
                      );
                    } else {
                      await OpenFilex.open(state.newFileLocation);
                    }
                  },
                  icon: state.newFileLocation.isEmpty
                      ? SvgPicture.asset(
                          AppImages.pdf,
                        )
                      : Icon(Icons.check),
                ),
              ],
              leading: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  AppImages.menu,
                ),
              ),
            ),
            body: screens[index],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle:
                  const TextStyle(color: Colors.white, fontSize: 0),
              unselectedLabelStyle:
                  const TextStyle(color: Colors.white, fontSize: 0),
              backgroundColor: const Color(0xff000072),
              currentIndex: index,
              onTap: (v) {
                index = v;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color:
                            index == 0 ? Colors.white : const Color(0xff000072),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      AppImages.fast,
                      colorFilter: ColorFilter.mode(
                          index != 0 ? Colors.white : const Color(0xff000072),
                          BlendMode.srcIn),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color:
                            index == 1 ? Colors.white : const Color(0xff000072),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      AppImages.study,
                      colorFilter: ColorFilter.mode(
                          index != 1 ? Colors.white : const Color(0xff000072),
                          BlendMode.srcIn),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color:
                            index == 2 ? Colors.white : const Color(0xff000072),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      AppImages.arrow,
                      colorFilter: ColorFilter.mode(
                          index != 2 ? Colors.white : const Color(0xff000072),
                          BlendMode.srcIn),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color:
                            index == 3 ? Colors.white : const Color(0xff000072),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      AppImages.settings,
                      colorFilter: ColorFilter.mode(
                          index != 3 ? Colors.white : const Color(0xff000072),
                          BlendMode.srcIn),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color:
                            index == 4 ? Colors.white : const Color(0xff000072),
                        shape: BoxShape.circle),
                    child: SvgPicture.asset(
                      AppImages.contact,
                      colorFilter: ColorFilter.mode(
                          index != 4 ? Colors.white : const Color(0xff000072),
                          BlendMode.srcIn),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
