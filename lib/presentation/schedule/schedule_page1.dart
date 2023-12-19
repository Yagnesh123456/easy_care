import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_easy_care/presentation/adapter/dashboard_adapter.dart';
import 'package:go_easy_care/presentation/schedule/schedule.dart';
import 'package:go_easy_care/presentation/schedule/schedule_all_details.dart';
import 'package:go_easy_care/presentation/widget/calender_custom_view.dart';
import 'package:go_easy_care/routes/app_routes.dart';

import '../adapter/schedule_adapter.dart';
import 'dart:math' as math;

class SchedulePage1 extends StatelessWidget {
   SchedulePage1({Key? key}) : super(key: key);

  final _controller = ScrollController();

 // double get maxHeight => 200 + MediaQuery.of(Get.context!).padding.top;

 // double get minHeight => kToolbarHeight + MediaQuery.of(Get.context!).padding.top;

  bool isEmpty = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 32;

    return Scaffold(
      body:  CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // Your appbar goes here
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(
              widget: Row(
                // Format this to meet your need
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Hello World'),
                  Text('Hello World'),
                  Text('Hello World'),
                ],
              ),
            ),
          ),
        ],
      ), /*CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
       // controller: _controller,
        slivers: [
          SliverAppBar(
            // this is where I would like to set some minimum constraint
            expandedHeight: 300,
            floating: false,
            pinned: false,
            // bottom: PreferredSize(                       // Add this code
            //   preferredSize: Size.fromHeight(60.0),      // Add this code
            //   child: Text(''),                           // Add this code
            // ),                                           // Add this code
            flexibleSpace: CalenderCustomView() *//*Container(
              padding: EdgeInsets.all(10),
              height: 340,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 40,
                  ),
                  Container(
                    height: 60,
                  ),
                  Expanded(child: Container()),
                  Text('TEST'),
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/400/400'),
                      fit: BoxFit.cover)),
            ),*//*
          ),
          // SliverAppBar(
          //   pinned: false,
          //   stretch: false,
          //   flexibleSpace: Header(
          //     maxHeight: 100,
          //     minHeight: 0.0,
          //   ),
          // //  expandedHeight: maxHeight - MediaQuery.of(context).padding.top,
          //   expandedHeight: 146,
          // ),


          // Expanded(
          //   child:  ListView.builder(
          //       shrinkWrap: true,
          //       physics: const AlwaysScrollableScrollPhysics(),
          //       itemBuilder: (BuildContext context, int index) {
          //         // return  DashboardAdapter();
          //         return  ScheduleAdapter(onTapCallBack: onCardTap,);
          //       },
          //       itemCount: 10),
          // )


          if (!isEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _buildCard(index);
                },
              ),
            )
          else
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  "List is empty",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ],
      ),*/

      // body: NestedScrollView(
      //   floatHeaderSlivers: true,
      //     headerSliverBuilder:
      //       (BuildContext context, bool innerBoxIsScrolled) {
      //     return <Widget>[
      //      // ElSliverPersistentHeader(delegate: ElSliverPersistentHeaderDelegate()),
      //
      //       SliverPersistentHeader(
      //         floating: true,
      //         pinned: false,
      //         delegate: _SliverAppBarDelegate(
      //           minHeight: 0.0,
      //           maxHeight: 132,
      //           child: Container(
      //             child: Stack(
      //               alignment: Alignment.topRight,
      //               children: <Widget>[
      //                 // new Container(
      //                 //   color: Colors.green,
      //                 //   height: 60,
      //                 // ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ];
      //   },
      //   body: Stack(
      //     alignment: Alignment.bottomCenter,
      //     children: <Widget>[
      //
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.only(left: 18.0,right: 16.0,bottom: 4.0,top:8.0),
      //             child: RichText(text: TextSpan(
      //                 text: "My Schedule",
      //                 style: Theme.of(context).textTheme.labelSmall?.copyWith(
      //                   color: Theme.of(context).colorScheme.onSurface
      //                 )),
      //             ),
      //           ),
      //           ScheduleAdapter(),
      //
      //           Padding(
      //             padding: const EdgeInsets.only(left: 22.0,right: 16.0,bottom: 4.0,top:8.0),
      //             child: RichText(text: TextSpan(
      //                 text: "Location  Schedule",
      //                 style: Theme.of(context).textTheme.labelSmall?.copyWith(
      //                     color: Theme.of(context).colorScheme.onSurface
      //                 )),
      //             ),
      //           ),
      //
      //           Expanded(
      //             child:  ListView.builder(
      //                 shrinkWrap: true,
      //                 physics: const AlwaysScrollableScrollPhysics(),
      //                 itemBuilder: (BuildContext context, int index) {
      //                   // return  DashboardAdapter();
      //                   return  ScheduleAdapter(onTapCallBack: onCardTap,);
      //                 },
      //                 itemCount: 10),
      //           )
      //
      //         ],
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }

  onCardTap() {
    //  Get.to(ScheduleInformation());
    Get.to(ScheduleAllDetails());
  }

   Card _buildCard(int index) {
     return Card(
       elevation: 4,
       margin: EdgeInsets.only(left: 12, right: 12, top: 12),
       child: Container(
         margin: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
         child: Text("Item $index"),
       ),
     );
   }

   // void _snapAppbar() {
   //   final scrollDistance = maxHeight - minHeight;
   //
   //   if (_controller.offset > 0 && _controller.offset < scrollDistance) {
   //     final double snapOffset =
   //     _controller.offset / scrollDistance > 0.5 ? scrollDistance : 0;
   //
   //     Future.microtask(() => _controller.animateTo(snapOffset,
   //         duration: Duration(milliseconds: 200), curve: Curves.easeIn));
   //   }
   // }
}

class Header extends StatelessWidget {
  double maxHeight = 0.0;
  double minHeight = 0.0;

  Header({Key? key, this.maxHeight = 0.0, this.minHeight = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final expandRatio = _calculateExpandRatio(constraints);
        final animation = AlwaysStoppedAnimation(expandRatio);

        return Stack(
          fit: StackFit.expand,
          children: [
            CalenderCustomView()
            // Container(
            //   //width: 200,
            //     height: 150,
            //     child:  Image.asset('asset/images/logo_splash_light.png')/*SvgPicture.asset(
            //                       'asset/images/ic_flutter_logo.svg',
            //                       semanticsLabel: 'Acme Logo'),*/
            // ),
           // _buildImage(),
          //  _buildGradient(animation),
           // _buildTitle(animation),
          ],
        );
      },
    );
  }
  double _calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio =
        (constraints.maxHeight - minHeight!) / (maxHeight - minHeight);
    if (expandRatio > 1.0) expandRatio = 1.0;
    if (expandRatio < 0.0) expandRatio = 0.0;
    return expandRatio;
  }

  Align _buildTitle(Animation<double> animation) {
    return Align(
      alignment: AlignmentTween(
          begin: Alignment.bottomCenter, end: Alignment.bottomLeft)
          .evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(bottom: 12, left: 12),
        child: Text(
          "THE WEEKEND",
          style: TextStyle(
            fontSize: Tween<double>(begin: 18, end: 36).evaluate(animation),
            color: Colors.white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }

  Container _buildGradient(Animation<double> animation) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            // ColorTween(begin: Colors.black87, end: Colors.black38)
            //     .evaluate(animation)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Image _buildImage() {
    return Image.network(
      "https://www.rollingstone.com/wp-content/uploads/2020/02/TheWeeknd.jpg",
      fit: BoxFit.cover,
    );
  }

}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget? widget;

  PersistentHeader({this.widget});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      height: 56.0,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Colors.white,
        elevation: 5.0,
        child: Center(child: widget),
      ),
    );
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}


