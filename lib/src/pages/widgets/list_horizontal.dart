import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/models/pelicula_model.dart';

class ListHorizontal extends StatelessWidget {
  final List<ResultPelicula>? peliculas;
  const ListHorizontal({required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return SizedBox(
      
      height: _screenSize.height * 0.30,
      child: PageView(
        pageSnapping: false,
        scrollDirection: Axis.horizontal, 
        controller: PageController(
          initialPage: 1,
        viewportFraction: 0.3
        ),
        children: _tarjetas(context)
        ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
   return peliculas!.map((pelicula) {
     return Container(
       padding: const EdgeInsets.only(top:10.0),
       margin: const EdgeInsets.only(right:3.0),
       child: Column(children: [
         ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child:   FadeInImage(placeholder: 
              const AssetImage('assets/img/preloader.gif'), 
              image: NetworkImage(pelicula.getPosterImg()),
              fit: BoxFit.cover,
              height: 130.0,
          ),
         ),
         const SizedBox(height:5.0),
         Text(pelicula.title.toString(),overflow: TextOverflow.ellipsis,
         style: Theme.of(context).textTheme.caption),
       
       ],
       )
     );
   }).toList();
  }
}
