import 'package:flutter/material.dart';

class CustomContainers extends StatefulWidget {
  final Image? image;
  final String? name;
  final String? urduName;
  final int? price;
  final int? count;
  final int? totalPrice;
  final Icon? addIcon;
  final Icon? removeIcon;

  const CustomContainers({
    super.key,
    this.image,
    this.name,
    this.urduName,
    this.price,
    this.count,
    this.totalPrice,
    this.addIcon,
    this.removeIcon,
  });

  @override
  State<CustomContainers> createState() => _CustomContainersState();
}

class _CustomContainersState extends State<CustomContainers> {
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(children: [
            Column(
              children: [
                Container(
                  height: hight * 0.2,
                  width: width * 0.6,
                  child: widget.image ??
                      Text(
                        "Image not found",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                )
              ],
            ),
            SizedBox(
              width: 2,
            ),
            Column(
              children: [
                Text(
                  "${widget.name}",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Text("${widget.urduName}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    )),
                Text("${widget.price}    RS",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    )),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: widget.addIcon!,
                      iconSize: 33,
                    ),
                    Text("${widget.count}",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    IconButton(
                      onPressed: () {},
                      icon: widget.removeIcon!,
                      iconSize: 33,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Total Price",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    Text("${widget.totalPrice}    RS",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            )
          ])
        ],
      ),
    );
  }
}
