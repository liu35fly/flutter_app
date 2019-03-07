import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:flutter_app/route_config/application.dart';
import 'package:flutter_app/data/book_store/banner_data.dart';

class BannerPage extends StatefulWidget {
  final List<BannerData> listBanner;

  BannerPage({Key key, this.listBanner}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BannerPageState(listBanner);
  }
}

class BannerPageState extends State<BannerPage> {
  final List<BannerData> list;

  BannerPageState(this.list);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Swiper(
        itemCount: list.length,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        control: SwiperControl(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) {
          onClik(index);
        },
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return Image.network(list[index].iconUrl, fit: BoxFit.fill);
  }

  void onClik(int index) {
    Application.router
        .navigateTo(context, "/detailPage", clearStack: false)
        .then((value) {
      if (list[index] == null) {
        return;
      }
      value = list[index].id;
    });
  }
}
