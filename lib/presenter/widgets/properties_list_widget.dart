import 'package:drible_real_estate_ui/presenter/widgets/property_card.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';

class PropertiesListWidget extends StatelessWidget {
  const PropertiesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: padding8,
        child: const Column(
          children: [
            PropertyCard(
              title: 'GladKova St.25',
              imageUrl: propertyOne,
            ),
            Row(
              children: [
                Expanded(
                  child: PropertyCard(
                    title: 'Trefoleva St. 4',
                    imageUrl: propertyTwo,
                    isVertical: true,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      PropertyCard(
                        imageUrl: propertyThree,
                        title: 'Gubina St., 11',
                      ),
                      PropertyCard(
                        imageUrl: propertyFive,
                        title: 'Sedova St, 22',
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
