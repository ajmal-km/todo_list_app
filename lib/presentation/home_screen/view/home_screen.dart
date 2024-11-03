import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import '../../todo_screen/view/todo_screen.dart';
import '../controller/home_controller.dart';
import '../widgets/task_container.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        ref.read(homeScreenProvider.notifier).getUsername();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeSreenState = ref.watch(homeScreenProvider);
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: ColorConstants.cyan,
        surfaceTintColor: ColorConstants.cyan,
        title: Text(
          "Hi, ${homeSreenState.name}",
          style: GoogleFonts.poppins(
            color: ColorConstants.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(
              Icons.library_add_check_rounded,
              size: 30,
              color: ColorConstants.white,
            ),
          ),
          SizedBox(width: 5),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(14, 22, 14, 14),
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemCount: 5,
        itemBuilder: (context, index) => TaskContainer(),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoScreen(),
            ),
          );
        },
        child: Container(
          height: 57,
          width: 57,
          decoration: BoxDecoration(
            color: ColorConstants.cyan,
            borderRadius: BorderRadius.circular(10),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 12,
                color: ColorConstants.black.withOpacity(0.11),
              ),
              BoxShadow(
                offset: Offset(-3, -3),
                blurRadius: 12,
                color: ColorConstants.black.withOpacity(0.11),
              ),
            ],
          ),
          child: Icon(
            Icons.add,
            size: 40,
            color: ColorConstants.white,
          ),
        ),
      ),
    );
  }
}
