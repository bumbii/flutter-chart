
import 'package:demographics/chart/donut_chart.dart';
import 'package:demographics/chart/followers_text.dart';
import 'package:demographics/chart/gender_chart.dart';
import 'package:demographics/chart/pie_chart.dart';
import 'package:demographics/graphics/follower_career_industries_card.dart';
import 'package:demographics/graphics/follower_cities_card.dart';
import 'package:demographics/graphics/follower_countries_card.dart';
import 'package:demographics/graphics/follower_languages_card.dart';
import 'package:demographics/graphics/follower_personality_card.dart';
import 'package:demographics/graphics/follower_regions_card.dart';
import 'package:demographics/graphics/influencer_mentions_card.dart';
import 'package:demographics/graphics/influencer_profile_card.dart';
import 'package:demographics/graphics/influencer_recent_location_card.dart';
import 'package:demographics/graphics/influencer_sentiment_distribution_card.dart';
import 'package:demographics/graphics/influencer_statistics_card.dart';
import 'package:demographics/graphics/what_influencer_post_card.dart';
import 'package:demographics/model/chart_data.dart';
import 'package:demographics/model/city_data.dart';
import 'package:demographics/model/country_data.dart';
import 'package:demographics/model/hash_tag.dart';
import 'package:demographics/model/industry_data.dart';
import 'package:demographics/model/interest_data.dart';
import 'package:demographics/model/language_data.dart';
import 'package:demographics/model/personality.dart';
import 'package:demographics/model/profile.dart';
import 'package:demographics/model/region_data.dart';
import 'package:demographics/model/stats_gender.dart';
import 'package:demographics/utils/colors.dart';
import 'package:demographics/utils/dimens.dart';
import 'package:flutter/material.dart';

class DemoGraphicsScreen extends StatefulWidget {
  @override
  _DemoGraphicsScreenState createState() => _DemoGraphicsScreenState();
}

class _DemoGraphicsScreenState extends State<DemoGraphicsScreen> {

  Profile profile = Profile(
      totalReach: 2200000,
      rate: 2000,
      username: '@therock',
      firstName: 'Dwayne',
      lastName: 'Johnson',
      city: 'California',
      country: 'United States',
      bio: 'Chivalrous gentleman.. just add fine tequila. ila.',
      profileImageUrl:
      'http://www.gstatic.com/tv/thumb/persons/235135/235135_v9_ba.jpg',
      instagramReach: 1000000,
      facebookReach: 1200000,
      koliReach: 2424,
      engagementRate: 1.6,
      followers: 159000000,
      totalPosts: 14100,
      engagementsPerPost: 141000,
      likesPerPost: 11000,
      commentsPerPost: 12000,
      commonTags: [
        CommonData(name: '# beauty'),
        CommonData(name: '# travel')]);

  final List<ChartData> relationshipData = [
    ChartData(name: 'Single at Heart', number: 0.82),
    ChartData(name: 'Relationship Oriented', number: 0.11),
    ChartData(name: 'Family Oriented', number: 0.07)
  ];

  final List<ChartData> educationLevelData = [
    ChartData(name: 'College', number: 0.55, isHighlighted: true),
    ChartData(name: 'Undergraduate', number: 0.3),
    ChartData(name: 'School', number: 0.15)
  ];

  final List<ChartData> incomeLevelData = [
    ChartData(name: 'General', number: 0.4, isHighlighted: true),
    ChartData(name: 'Less wealthy', number: 0.17),
    ChartData(name: 'Above average', number: 0.3),
    ChartData(name: 'Wealthy', number: 0.13)
  ];

  final List<ChartData> ageGroupsData = [
    ChartData(name: 'Young Adults', number: 8.0),
    ChartData(name: 'Youngsters', number: 16.0),
    ChartData(name: 'Mature', number: 64.0),
    ChartData(name: 'Senior', number: 12.0),
  ];

  final List<Language> languages = [
    Language('English'),
    Language('Vietnamese'),
    Language('French'),
  ];

  final List<HashTag> mentions = [
    HashTag('appsolutely', 11.4),
    HashTag('facebook', 23.4),
    HashTag('todaydreamer', 5.4),
    HashTag('fashion', 56.4),
    HashTag('success', 33.4),
    HashTag('happiness', 20.4),
    HashTag('family', 47.4),
    HashTag('social', 33.4),
    HashTag('vietnam', 18.4),
    HashTag('singapore', 22.4),
    HashTag('travel', 14.4),
    HashTag('rich', 18.4),
  ];

  final List<CountryData> followerCountries = [
    CountryData('Singapore', 22.4),
    CountryData('Vietnam', 15.6),
    CountryData('Thailand', 35.7),
    CountryData('Indonesia', 13.7),
    CountryData('Hongkong', 24.7),
    CountryData('Japan', 38.7),
    CountryData('USA', 66.7),
  ];

  final List<RegionData> followerRegions = [
    RegionData('Central, Singapore', 32.4),
    RegionData('Ho Chi Minh, Vietnam', 55.6),
    RegionData('Bankok, Thailand', 15.7),
    RegionData('East, Singapore', 13.7),
    RegionData('Hanoi, Vietnam', 24.7),
    RegionData('Tokyo, Japan', 28.7),
    RegionData('Newyork, USA', 26.7),
  ];

  final List<CityData> followerCities = [
    CityData('Ho Chi Minh', 22.4),
    CityData('Hanoi', 15.6),
    CityData('Muang Chiang Mai', 35.7),
    CityData('Muang Chon Buri', 13.7),
    CityData('Thoen', 24.7)
  ];

  // Interest
  List<InterestData> whatInfluencerPost = [
    InterestData('Motivation', 35),
    InterestData('Shopping and fashion', 67),
    InterestData('Health', 84),
    InterestData('Sports', 56),
    InterestData('Happiness', 33),
    InterestData('Movie', 69),
    InterestData('Entertainment', 73),
  ];

  List<InterestData> specificInterests = [
    InterestData('Clothing', 35),
    InterestData('Design', 34),
    InterestData('Shopping', 44),
    InterestData('Muusic', 25),
    InterestData('Music', 38),
    InterestData('Travel', 79),
    InterestData('TV', 55),
  ];

  List<IndustryData> followerIndustries = [
    IndustryData('Management', 35),
    IndustryData('Design, Entertainment, Sports', 67),
    IndustryData('Education, Training, Library', 84),
    IndustryData('Architecture & engineering', 56),
    IndustryData('Protective service', 33),
    IndustryData('Community & social service', 69),
    IndustryData('Construction & extraction', 73),
  ];

  List<LanguageData> followerLanguages = [
    LanguageData('English', 0.57),
    LanguageData('Spanish', 0.10),
    LanguageData('Chinese', 0.13),
    LanguageData('French', 0.20),
  ];

  final List<Personality> personalities = [
    Personality('Introversion'),
    Personality('Intuition'),
    Personality('Thinking'),
    Personality('Perceiving'),
  ];

  List<Personality> followerPersonalities = [
    Personality('INFP', value: 33.47),
    Personality('ENFP', value: 19.67),
    Personality('ENTJ', value: 10.74),
    Personality('INTJ', value: 10.6),
    Personality('INTP', value: 9.34),
    Personality('ENTP', value: 5.72),
    Personality('INFJ', value: 2.37),
    Personality('ISTJ', value: 1.67),
    Personality('ENFJ', value: 1.26),
    Personality('ESTJ', value: 1.26),
    Personality('ISFP', value: 1.26),
    Personality('ESTJ', value: 0.84),
    Personality('ISFP', value: 0.7),
    Personality('ISTP', value: 0.56),
    Personality('ISFJ', value: 0.28),
    Personality('ESFJ', value: 0.28),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demographics'),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.only(left: Dimens.screenPadding, right: Dimens.screenPadding),
          child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 15.0,
        ),
//          InfluencerGlobalScore(
//            globalScore: 0.3,
//          ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        InfluencerRecentLocationCard(
          country: 'Singapore',
          region: 'Central',
          city: 'Central',
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        InfluencerProfileCard(
          personalities: this.personalities,
          languages: this.languages,
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        InfluencerStatisticsCard(
          followers: 14100,
          suspiciousFollowers: 15.8,
          activeFollowers: 55.8,
          activeFollowersLevels: 43.2,
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        InfluencerSentimentDistributionCard(
          low: 0.45,
          medium: 0.3,
          high: 0.25,
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        WhatInfluencerPostCard(
          interests: this.whatInfluencerPost,
          influencerUsername: 'therock',
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        WhatInfluencerPostCard(
          title: 'Specific Interests',
          interests: this.specificInterests,
          influencerUsername: 'username',
        ),
        const SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        InfluencerMentionsCard(
          mentions: mentions,
          barColor: AppColors.chartColors[5],
        ),
        const SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        FollowerCountriesCard(
          countries: this.followerCountries,
          influencerUsername: 'username',
          barColor: AppColors.chartColors[1],
        ),
        const SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        FollowerRegionsCard(
          regions: this.followerRegions,
          influencerUsername: 'username',
          barColor: AppColors.chartColors[2],
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        FollowerCitiesCard(
          cities: this.followerCities,
          influencerUsername: 'username',
          barColor: AppColors.chartColors[5],
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        FollowerCareerIndustriesCard(
          industries: this.followerIndustries,
          influencerUsername: 'username',
          barColor: AppColors.chartColors[1],
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        FollowerLanguagesCard(
          followers: 14100,
          languages: this.followerLanguages,
          username: 'username',
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        GenderChart(
          statsGender:
          StatsGender(femalePercentages: 52, malePercentages: 48),
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        PieChart(
          chartName: 'Education Levels',
          data: educationLevelData,
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        FollowerPersonalityCard(
            personalities: followerPersonalities
        ),
        SizedBox(
          height: Dimens.formMarginTop / 2,
        ),
        DonutChart(
          chartName: 'Relationship Status',
          data: relationshipData,
          centerWidget: FollowersText(
            followersNumber: 12000,
          ),
        ),
      ],
    );
  }
}

class Language {
  final String name;

  Language(this.name);
}