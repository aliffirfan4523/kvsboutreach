import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomSliverAppBar extends StatefulWidget {

	final GlobalKey<ScaffoldState> scaffoldKey;
	final String primary_title;
	final double expandedTitleScaleRadius;

	double firstTitleFontSize;
	bool isPinned;
	Widget? background;
	Color textColor;

	CustomSliverAppBar({
		super.key, 
		required this.scaffoldKey, 
		required this.primary_title, 
		required this.expandedTitleScaleRadius,
		this.isPinned = true,
		this.firstTitleFontSize = 20,
		this.background,
		this.textColor = const Color(0xff042100),
	
	});

	@override
	State<CustomSliverAppBar> createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
	@override
	Widget build(BuildContext context) {
		return SliverAppBar(
			snap: false,
			pinned: widget.isPinned,
			floating: false,
			shadowColor: Color(0xffF8FAF0),
			shape: ContinuousRectangleBorder(
				borderRadius: BorderRadius.only(
					bottomLeft: Radius.circular(80),
					bottomRight: Radius.circular(80),
					topLeft: Radius.circular(40),
					topRight: Radius.circular(40),
				),
			),
			flexibleSpace: FlexibleSpaceBar(
				expandedTitleScale: widget.expandedTitleScaleRadius,
				collapseMode: CollapseMode.pin,
				centerTitle: false,
				titlePadding: EdgeInsets.only(left: 50, bottom: 15),
				title: Text(
					widget.primary_title,
					style: TextStyle(
						color: widget.textColor,
						fontSize: widget.firstTitleFontSize,
					) //TextStyle
				), //Text
				background: widget.background,
			), //FlexibleSpaceBar
			expandedHeight: 150,
			backgroundColor: Color(0xffF8FAF0),
			actions: <Widget>[
				Padding(
					padding: const EdgeInsets.only(top: 10.0),
					child: Image.network(
						'https://drive.google.com/uc?export=view&id=1iPGwRrH3fKR0AfDjhDYpuCbmuFf9Pw_X',
						width: 100
					),
				),
				
				SizedBox(
					width: 20,
				)
			], //<Widget>[]*/
		); //SliverAppBar
	}
}
