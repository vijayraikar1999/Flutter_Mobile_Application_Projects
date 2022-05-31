import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(29.5),
        color: Colors.white,
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          hintText: 'Search',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
