import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class MiniCards extends StatefulWidget {
  const MiniCards({
    required this.time,
    required this.conditionIcon,
    required this.temperature,
    Key? key,
  }) : super(key: key);

  final List time;
  final List conditionIcon;
  final List temperature;

  @override
  State<MiniCards> createState() => _MiniCardsState();
}

class _MiniCardsState extends State<MiniCards> {
  final ScrollController _controller = ScrollController();

// This is what you're looking for!
  void _scrollDown() {
    _controller
        .animateTo(
      _controller.position.maxScrollExtent,
      duration: const Duration(seconds: 4),
      curve: Curves.slowMiddle,
    )
        .then((value) {
      _controller.animateTo(
        _controller.position.minScrollExtent,
        duration: const Duration(seconds: 4),
        curve: Curves.slowMiddle,
      );
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      _scrollDown();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.time.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 8.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFF326CEE),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.time[index],
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(height: 8.0),
                WebsafeSvg.asset(
                  'assets/svg/${widget.conditionIcon[index]}.svg',
                  width: 32.0,
                  height: 32.0,
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${widget.temperature[index].round()}°',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          );
        });
  }
}
