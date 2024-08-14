import 'dart:collection';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:swiper/controller/controller_events.dart';
import 'package:swiper/controller/swiper_controller.dart';
import 'package:swiper/properties/properties.dart';
import 'package:swiper/utils/cache_state.dart';
import 'package:swiper/utils/enums.dart';
import 'package:swiper/utils/number_extensions.dart';
import 'package:swiper/utils/typedefs.dart';
import 'package:swiper/widgets/card_animation.dart';
import 'package:flutter/widgets.dart';

part 'card_swiper_state.dart';

class CardSwiper extends StatefulWidget {

  final NullableCardBuilder cardBuilder;

  final int cardsCount;

  final int initialIndex;

  final CardController? controller;

  final Duration duration;

  final EdgeInsetsGeometry padding;

  final int threshold;

  final double scale;

  final bool isDisabled;

  final CardSwiperOnSwipe? onSwipe;

  final CardSwiperOnEnd? onEnd;

  final AllowedSwipeDirections allowedSwipeDirection;

  final bool isLoop;

  final int numberOfCardsDisplayed;

  final CardSwiperDirectionChange? onSwipeDirectionChange;

  final Offset backCardOffset;

  const CardSwiper({
    required this.cardBuilder,
    required this.cardsCount,
    this.controller,
    this.initialIndex = 0,
    this.padding = EdgeInsets.zero,
    this.duration = const Duration(milliseconds: 200),
    this.threshold = 50,
    this.scale = 0.8,
    this.isDisabled = false,
    this.onSwipe,
    this.onEnd,
    this.onSwipeDirectionChange,
    this.allowedSwipeDirection = const AllowedSwipeDirections.all(),
    this.isLoop = true,
    this.numberOfCardsDisplayed = 2,
    this.backCardOffset = const Offset(0, 40),
    super.key
  }) : assert(
    threshold >= 1 && threshold <= 100,
    'Threshold must be between 1 and 100'
  ), assert(
    scale >= 0 && scale <= 1,
    'Scale must be between 0 and 1'
  ),
  assert(
    numberOfCardsDisplayed >= 1 && numberOfCardsDisplayed <= cardsCount,
    'Number of cards displayed must be between 1 and [cardCount]'
  ),
  assert(
    initialIndex >= 0 && initialIndex < cardsCount,
    'Initial index must be between 0 and [cardsCount]'
  );

  @override
  State createState() => _CardSwiperState();

}