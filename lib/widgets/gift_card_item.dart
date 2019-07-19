import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';

import '../prodivers/gift_card.dart';
// import '../screens/card_detail_screen.dart';
// import '../widgets/scale_route.dart';
// import '../widgets/swipe_detector.dart';
import '../widgets/gift_card_front.dart';
import '../widgets/gift_card_back.dart';

class GiftCardItem extends StatefulWidget {
  @override
  _GiftCardItemState createState() => _GiftCardItemState();
}

class _GiftCardItemState extends State<GiftCardItem> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    final giftCard = Provider.of<GiftCard>(context, listen: false);
    return FlipCard(
      key: cardKey,
      flipOnTouch: true,
      direction: FlipDirection.HORIZONTAL,
      front: GiftCardFront(giftCard: giftCard),
      back: Transform.scale(
        scale: 1,
        child: Transform.scale(
          scale: 1.43,
          child: GiftCardBack(giftCard: giftCard),
        ),
      ),
    );
  }
}
