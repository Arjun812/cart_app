import 'package:flutter/material.dart';
import 'package:trial/utils/constants/styles.dart';

import '../utils/constants/constants.dart';

class ProductCard extends StatefulWidget {
  final String? price;
  final String? title;
  final String? image;
  final GestureTapCallback? cartAdd;
  final GestureTapCallback? onTap;
  final EdgeInsetsGeometry? padding;
  const ProductCard({Key? key, this.price, this.title, this.image, this.onTap,required this.padding, this.cartAdd}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding!,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration:  BoxDecoration(
              color: Colors.white,
              boxShadow: [  BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(3, 3),
              ),]
          ),
          margin: EdgeInsets.all(0),
          child: Stack(
            children:[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    margin: EdgeInsets.all(0),
                    elevation: 4,
                    clipBehavior: Clip.hardEdge,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      height: 140,
                      width: 180,
                      imageErrorBuilder: (_, __, ___) {
                        return Image.network(
                            Base.networkImage!); //this is what will fill the Container in case error happened
                      },
                      placeholder:  AssetImage(Base.placeHolder!),
                      image: NetworkImage(widget.image!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      widget.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${widget.price}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),


                ],
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: widget.cartAdd,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: const BoxDecoration(
                          color: Colors.green,
                          boxShadow: [Shadows.primaryShadow],
                          shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.add_shopping_cart_outlined,color: Colors.white,),
                    ),
                  )
              ),
            ]

          ),
        ),
      ),
    );
  }
}
