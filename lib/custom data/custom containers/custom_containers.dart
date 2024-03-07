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
    Key? key,
    this.image,
    this.name,
    this.urduName,
    this.price,
    this.count,
    this.totalPrice,
    this.addIcon,
    this.removeIcon,
  }) : super(key: key);

  @override
  State<CustomContainers> createState() => _CustomContainersState();
}

class _CustomContainersState extends State<CustomContainers> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align columns at the top
        children: [
          SizedBox(
            width: width * 0.5, // Adjusted width for the image container
            child: Column(
              children: [
                Container(
                  height: height * 0.2,
                  width: double.infinity,
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
          ),
          SizedBox(
            width:
                width * // Adjusted width for the space between the image and the content column
                    0.05,
          ),
          SizedBox(
            width: width * 0.4, // Adjusted width for the content column
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text("Total:   ",
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                    Text("${widget.totalPrice} RS",
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
