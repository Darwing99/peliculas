import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/models/pelicula_model.dart';
import 'package:peliculas/src/pages/providers/peliculas_provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:peliculas/src/pages/widgets/card_widget.dart';
import 'package:peliculas/src/pages/widgets/list_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculas = PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: false,
          title: const Text("Peliculas en Cine"),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(onPressed: () => {}, icon: const Icon(Icons.search))
          ]),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarget(),
            _footerPopulares(context),
            //  _listTarget()
          ]),
    );
  }

  Widget _swiperTarget() {
    return FutureBuilder(
        future: peliculas.getEnCines(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ResultPelicula>> datos) =>
                datos.hasData
                    ? CardSwiper(
                        listaItems: datos.data,
                      )
                    : const SizedBox(
                        height: 400.0,
                        child: Center(child: CircularProgressIndicator()),
                      ));
  }

  Widget _footerPopulares(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text("Populares", style: Theme.of(context).textTheme.headline5)),
          
          FutureBuilder(
            future: peliculas.getPopulares(),
            builder: (BuildContext context, AsyncSnapshot<List<ResultPelicula>> populares) =>
             populares.hasData ? ListHorizontal(peliculas: populares.data) : const Center( child: CircularProgressIndicator())
            
             
          
          ),
        ],
      ),
    );
  }
}
