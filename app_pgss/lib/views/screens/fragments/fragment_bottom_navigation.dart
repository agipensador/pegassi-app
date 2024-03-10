import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/viewmodels/home_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/screens/fragments/fragment_card_transfer_offline.dart';
import 'package:app_pgss/views/screens/screen_1.dart';
import 'package:app_pgss/views/screens/screen_2.dart';
import 'package:app_pgss/views/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FragmentBottomNavigation extends GetView {
  FragmentBottomNavigation({super.key});

  final ManagerController controllerManager = Get.put(ManagerController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // final Brightness brightness = MediaQuery.platformBrightnessOf(context);
    return Obx(() {
      return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Container(
            color:
                // brightness == Brightness.dark
                //     ? AppColors.primaryColorDark :
                AppColors.primaryColor,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox.shrink(),
              ),
              bottomNavigationBar: controllerManager.isPayAccount.value
                  ? bottomNavigation([
                      buildItem(0, Icons.workspace_premium, 'Premium'),
                      buildItem(1, Icons.home_filled, 'Início'),
                      buildItem(2, Icons.people, 'Artistas'),
                      buildItem(3, Icons.store, 'Loja'),
                    ])
                  : bottomNavigation([
                      buildItem(0, Icons.people, 'Artistas'),
                      buildItem(1, Icons.home_filled, 'Início'),
                      buildItem(2, Icons.store, 'Loja'),
                    ]),
              backgroundColor: Colors.transparent,
              body: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: AppColors.primaryColor,
                body: controllerManager.isPayAccount.value
                    ? PageView(
                        controller: controllerManager.pageController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        onPageChanged: controllerManager.pageChanged,
                        children: [const Tela1(), ScreenHome(), const Tela2()],
                      )
                    : PageView(
                        controller: controllerManager.pageController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        onPageChanged: controllerManager.pageChanged,
                        children: [ScreenHome(), const Tela1(), const Tela2()],
                      ),
                bottomNavigationBar: const SizedBox.shrink(),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget bottomNavigation(List<BottomNavigationBarItem> bottomItems) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: Container(
        color: Colors.transparent, // Cor de fundo do Container
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          selectedLabelStyle: const TextStyle(height: 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: controllerManager.currentPageIndex.value,
          onTap: controllerManager.bottomTapped,
          items: bottomItems,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }

  BottomNavigationBarItem buildItem(int index, IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ), // Ajuste o espaçamento vertical conforme necessário
        decoration: BoxDecoration(
          color: controllerManager.currentPageIndex.value == index
              ? Colors.white
                  .withOpacity(0.2) // Cor de fundo para o item selecionado
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30), // Borda arredondada
        ),
        child: controllerManager.isPayAccount.value
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: 24,
                        color: Colors.white, // Cor do ícone
                      ),
                    ),
                    if (controllerManager.currentPageIndex.value == index)
                      const SizedBox(
                          height: 4), // Espaçamento entre o ícone e o rótulo
                    if (controllerManager.currentPageIndex.value == index)
                      FittedBox(
                        child: Text(
                          label,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: Colors.white, // Cor do ícone
                  ),
                  if (controllerManager.currentPageIndex.value == index)
                    const SizedBox(
                        width: 4), // Espaçamento entre o ícone e o rótulo
                  if (controllerManager.currentPageIndex.value == index)
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
      ),
      label: '',
    );
  }
}
