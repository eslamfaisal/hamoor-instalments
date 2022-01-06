import 'package:instalment/screens/base_view.dart';
import 'package:instalment/screens/home/viewmodel/home_view_model.dart';
import 'package:instalment/screens/home/widgets/drawer_item.dart';
import 'package:instalment/utils/extensions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            key: _key,
            drawer: getDrawerView(),
            body: Center(
              child: Text(
                'Home Screen',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            // bottomNavigationBar: BottomAppBar(
            //   color: Colors.transparent,
            //   notchMargin: 10,
            //   clipBehavior: Clip.antiAlias,
            //   shape: const CircularNotchedRectangle(),
            //   child: BottomNavigationBar(
            //     items: viewModel.nacBarItems,
            //     selectedItemColor: greenMedium,
            //     currentIndex: viewModel.currentIndex,
            //     unselectedItemColor: Colors.grey[400],
            //     showSelectedLabels: true,
            //     showUnselectedLabels: true,
            //     type: BottomNavigationBarType.fixed,
            //     onTap: (index) {
            //       viewModel.changeNavBarIndex(index);
            //     },
            //   ),
            // ),
          ),
        );
      },
    );
  }

  Widget getDrawerView() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        children: [
          SizedBox(
            width: 180,
            height: 180,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Divider(
              height: 1,
              color: Colors.grey,
            ),
          ),
          DrawerItem('assets/icons/ic_sadqa.png', 'ايتم').onTap(() {
            print("eslam");
          }),
        ],
      ),
    );
  }
}
