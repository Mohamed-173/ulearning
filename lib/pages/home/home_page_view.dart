import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uleaningapp/common/values/colors.dart';
import 'package:uleaningapp/pages/home/widgets/widgets_homepage.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryBackground,
          appBar: buildAppBar(),
          body: Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
            child: CustomScrollView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              slivers: [
                // first child  big text
                SliverToBoxAdapter(
                  child: homePageText(
                    "Hello",
                    color: AppColors.primaryThirdElementText,
                  ),
                ),
                //second child  big text
                SliverToBoxAdapter(
                  child: homePageText(
                    "Mohamed",
                    marginTop: 5.h,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 20.h),
                ),
                //third child search view
                SliverToBoxAdapter(child: searchView(context: context)),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(child: SliderView(context)),
                SliverToBoxAdapter(child: MenuView()),
                SliverPadding(
                  padding:
                      EdgeInsets.symmetric(vertical: 18.h, horizontal: 0.w),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      childCount: 4,
                      (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: courseGrid(
                            imagePath: index.isOdd
                                ? "assets/icons/Image1.png"
                                : "assets/icons/Image2.png",
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
