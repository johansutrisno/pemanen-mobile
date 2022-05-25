import 'package:flutter/material.dart';

import '../../../theme/theme.dart';

class RowSpinner extends StatelessWidget {
  const RowSpinner({
    Key? key,
    required this.selectedIndex,
    required this.onPageChanged,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: primary100,
        borderRadius: BorderRadius.circular(4),
      ),
      height: 96,
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: primary,
                  width: 2,
                ),
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              height: 64,
              child: const Visibility(
                child: Text(
                  'xxx',
                  style: TextStyle(
                    color: Colors.transparent,
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          PageView.builder(
            pageSnapping: true,
            itemCount: 30,
            controller: PageController(viewportFraction: 0.2),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              if (index > selectedIndex) {
                return Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      color: index == (selectedIndex + 1)
                          ? mediumEmphasis
                          : lowEmphasis,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }
              if (index < selectedIndex) {
                return Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(
                      color: index == (selectedIndex - 1) ? error500 : error300,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }
              return Center(
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    color: highEmphasis,
                    fontSize: 31,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
            },
            onPageChanged: onPageChanged,
          ),
        ],
      ),
    );
  }
}
