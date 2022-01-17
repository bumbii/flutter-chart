//import 'package:flutter/material.dart';
//import 'package:koli/localization/flutter_localizations.dart';
//import 'package:koli/model/influencer.dart';
//import 'package:koli/res/strings/text_names.dart';
//import 'package:koli/screen/demographics/influencer_profile_card.dart';
//import 'package:koli/screen/demographics/influencer_recent_location_card.dart';
//import 'package:koli/screen/demographics/influencer_statistics_card.dart';
//import 'package:koli/screen/demographics/what_influencer_post_card.dart';
//import 'package:koli/theme/dimens.dart';
//import 'package:koli/utils/number_utils.dart';
//
//class InfluencerDemographics extends StatelessWidget {
//  final InfluencerData data;
//
//  const InfluencerDemographics({Key key, this.data}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    /// localization
//    FlutterLocalizations _localizations = FlutterLocalizations.of(context);
//    String specificInterest =
//    _localizations.getString(context, TextName.specificInterest);
//
//    return Column(
//      children: <Widget>[
//        Expanded(
//          child: ListView(
//            shrinkWrap: true,
//            padding: EdgeInsets.symmetric(horizontal: Dimens.formPaddingSmall),
//            children: <Widget>[
//              SizedBox(
//                height: Dimens.formMarginTop,
//              ),
////              InfluencerGlobalScore(
////                globalScore: convertToDecimal(data.globalScore),
////              ),
////              SizedBox(
////                height: Dimens.formMarginTop / 2,
////              ),
//              InfluencerRecentLocationCard(
//                country: data.influencerProfile.location.country,
//                region: data.influencerProfile.location.region,
//                city: data.influencerProfile.location.city,
//              ),
//              SizedBox(
//                height: Dimens.formMarginTop / 2,
//              ),
//              _influencerProfileCard(),
//              SizedBox(
//                height: Dimens.formMarginTop / 2,
//              ),
//              InfluencerStatisticsCard(
//                followers: data.influncerStatistic.followersCount,
//                suspiciousFollowers: convertToPercent(
//                    data.influncerStatistic.fakeFollowers),
//                activeFollowers: convertToPercent(
//                    data.influncerStatistic.activeFollowers),
//                activeFollowersLevels: convertToPercent(
//                    data.influncerStatistic.activeFollowersLevel),
//              ),
//              SizedBox(
//                height: Dimens.formMarginTop / 2,
//              ),
//              WhatInfluencerPostCard(
//                interests: data.influencerProfile.interests,
//                influencerUsername: data.userName,
//              ),
//              WhatInfluencerPostCard(
//                title: specificInterest,
//                interests: data.influencerProfile.specialInterests,
//                influencerUsername: data.userName,
//              ),
////              InfluencerMentionsCard(
////                mentions: data.influncerStatistic.hashTags,
////                barColor: AppColors.chartColors[5],
////              ),
//            ],
//          ),
//        ),
//      ],
//    );
//  }
//
//  _influencerProfileCard() {
//    if (data.influencerProfile.personalities.length == 0 &&
//        data.influencerProfile.languages.length == 0) {
//      return Container();
//    }
//    return InfluencerProfileCard(
//      personalities: data.influencerProfile.personalities,
//      languages: data.influencerProfile.languages,
//    );
//  }
//}
