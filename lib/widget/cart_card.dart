

import 'package:flutter/material.dart';
import 'package:trial/widget/counter.dart';

import '../utils/constants/constants.dart';
import '../utils/constants/styles.dart';

class CartCard extends StatelessWidget {
  final String? image;
  final String? name;
  final int? price;
  final int count;
  final VoidCallback? onRemove;
  final Function(int count) onIncrement, onDecrement;
  const CartCard({Key? key, this.image, this.name, this.price, this.onRemove, required this.onIncrement, required this.onDecrement, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.white38,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Flexible(
            flex: 1,
            child: Container(
              child: FadeInImage(
                fit: BoxFit.contain,
                // height: 100,
                //  width: 180,
                imageErrorBuilder: (_, __, ___) {
                  return Image.network(
                      Base.networkImage!); //this is what will fill the Container in case error happened
                },
                placeholder:  AssetImage(Base.placeHolder!),
                image: NetworkImage(image!),
              ),
            ),
          ),
          Flexible(
            flex:2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name!,style: TextStyles.subHeaderStyle,),
                      Container(
                        width: 35,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[100]),
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.green,
                          ),
                          onPressed: () => onRemove!(),
                        ),
                      ),
                    ],
                  ),
                ),
                Counter(onDecrement: onDecrement,
                  onIncrement: onIncrement,
                  value: count,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Rs.${price!*count }',style: TextStyles.subHeaderStyle,),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
