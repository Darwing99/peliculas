import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/pages/models/pelicula_model.dart';

// ignore: must_be_immutable
class CardSwiper extends StatelessWidget {
  final List<ResultPelicula>? listaItems;
  const CardSwiper({required this.listaItems});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      width: double.infinity,
      height: _screenSize.height*0.40,
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: 
                  FadeInImage(
                    image: NetworkImage(listaItems![index].getPosterImg()),
                    placeholder: const AssetImage('assets/img/no-profile.png'),
                    fit: BoxFit.cover,
                  ),
                
            );
          },
          itemCount: listaItems?.length,
          itemWidth: _screenSize.width * 0.5,

          //pagination: const SwiperPagination(),
          //control: const SwiperControl(),
          layout: SwiperLayout.STACK),
    );
  }
}
