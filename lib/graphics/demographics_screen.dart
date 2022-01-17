//import 'dart:async';
//import 'dart:convert';
//import 'dart:core';
//import 'dart:io';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter_inapp_purchase/flutter_inapp_purchase.dart';
//import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:koli/localization/flutter_localizations.dart';
//import 'package:koli/model/influencer_statistic_data/interest_data.dart';
//import 'package:koli/model/profile.dart';
//import 'package:koli/res/images/images.dart';
//import 'package:koli/res/strings/text_names.dart';
//import 'package:koli/router/routes.dart';
//import 'package:koli/store/profile_store.dart';
//import 'package:koli/store/purchase_store.dart';
//import 'package:koli/theme/colors.dart';
//import 'package:koli/utils/dialog_manager.dart';
//import 'package:koli/utils/ui_utils.dart';
//import 'package:koli/widget/appbar/appbar_title_text.dart';
//import 'package:koli/widget/appbar/custom_app_bar.dart';
//import 'package:koli/widget/button/back_button.dart';
//import 'package:koli/widget/card/new_profile_card.dart';
//import 'package:koli/widget/card/shimmer_loading_graphics_card.dart';
//import 'package:koli/widget/card/shimmer_loading_profile_card.dart';
//import 'package:koli/widget/container/loading_container.dart';
//import 'package:koli/widget/profile/user_profile_state_1.dart';
//import 'package:koli/widget/profile/user_profile_state_2.dart';
//import 'package:koli/widget/profile/user_profile_state_3.dart';
//import 'package:koli/widget/profile/user_profile_state_4.dart';
//import 'package:shimmer/shimmer.dart';
//
//import 'demographics_follower.dart';
//import 'demographics_influencer.dart';
//
//class DemoGraphicsScreen extends StatefulWidget {
//  final String igId;
//  final String igUserName;
//
//  const DemoGraphicsScreen({Key key, this.igId, this.igUserName})
//      : super(key: key);
//
//  @override
//  _DemoGraphicsScreenState createState() => _DemoGraphicsScreenState();
//}
//
//class _DemoGraphicsScreenState extends State<DemoGraphicsScreen>
//    with SingleTickerProviderStateMixin {
//  final key = new GlobalKey<_TestHeightState>();
//
//  /// demo influencer
//  static const DEMO_INFLUENCER_ID = 'SW5mbHVlbmNlcjoxMjg0OTg=';
//  static const DEMO_INFLUENCER_USERNAME = 'aommy_abriana';
//
//  /// init store
//  ProfileStore _profileStore = ProfileStore();
//  InAppPurchaseStore _purchaseStore = InAppPurchaseStore();
//
//  TabController _tabController;
//  List listLanguageCode = new List();
//  bool isOrderExist = true;
//  bool isPurchaseLoading = false;
//  String price = '';
//  String currency = '';
//  num profileHeight = 0.0;
//  // Timer timer;
//  bool isSaveOrder = false;
//
//  /// in app purchase
//  /// flutter in app purchase
//  final List<String> _productLists = ['unlock_full_analysis_consumable'];
//  StreamSubscription _purchaseUpdatedSubscription;
//  StreamSubscription _purchaseErrorSubscription;
//  StreamSubscription _conectionSubscription;
//
//  @override
//  void initState() {
//    super.initState();
//    _tabController = TabController(
//      vsync: this,
//      length: 2,
//    );
//    _parseLanguageJson();
////    _checkOrder();
//    if (widget.igId != null && widget.igId.isNotEmpty) {
//      _getInfluencerData();
//    } else {
//      _getInstagramData();
//    }
//
//    // initPlatformState();
//  }
//
//  @override
//  void dispose() {
//    if (_conectionSubscription != null) {
//      _conectionSubscription.cancel();
//      _conectionSubscription = null;
//    }
////    if (timer != null) {
////      timer.cancel();
////    }
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    FlutterLocalizations _localizations = FlutterLocalizations.of(context);
//    _localizations = FlutterLocalizations.of(context);
//    String influencerGraphics =
//        _localizations.getString(context, TextName.influencerDemographics);
//    String followerGraphics =
//        _localizations.getString(context, TextName.followerDemographics);
//
//    List<Tab> tabs = List();
//    tabs.add(Tab(
//      child: Center(
//        child: Text(
//          influencerGraphics.toUpperCase(),
//          textAlign: TextAlign.center,
//        ),
//      ),
//    ));
//    tabs.add(Tab(
//      child: Center(
//        child: Text(
//          followerGraphics.toUpperCase(),
//          textAlign: TextAlign.center,
//        ),
//      ),
//    ));
//
//    return Scaffold(body: Observer(
//      builder: (BuildContext context) {
//        return SafeArea(
//            bottom: true,
//            child: LoadingContainer(
//              isLoading: isPurchaseLoading,
//              child: Stack(
//                children: <Widget>[
//                  _profileStore.influencerProfile == null
//                      ? Container()
//                      : _buildDataToGetHeight(),
//                  NestedScrollView(
//                    headerSliverBuilder:
//                        (BuildContext context, bool innerBoxIsScrolled) {
//                      return [
//                        SliverAppBar(
//                          leading: CustomBackButton(
//                            backIconColor: Colors.black,
//                          ),
//                          brightness: Brightness.light,
//                          backgroundColor: AppColors.white,
//                          expandedHeight:
//                              profileHeight == 0 ? 400.0 : profileHeight,
//                          floating: false,
//                          pinned: true,
//                          centerTitle: true,
//                          title: AppBarTitleText(
//                            text: '@${widget.igUserName}',
//                          ),
//                          flexibleSpace: FlexibleSpaceBar(
//                              collapseMode: CollapseMode.pin,
//                              background: _buildProfileCardShimmer()),
//                          bottom: new TabBar(
//                            tabs: <Tab>[
//                              Tab(
//                                child: Center(
//                                  child: Text(
//                                    influencerGraphics.toUpperCase(),
//                                    textAlign: TextAlign.center,
//                                  ),
//                                ),
//                              ),
//                              Tab(
//                                child: Center(
//                                  child: Text(
//                                    followerGraphics.toUpperCase(),
//                                    textAlign: TextAlign.center,
//                                  ),
//                                ),
//                              )
//                            ],
//                            controller: _tabController,
//                            indicatorColor: AppColors.black,
//                            indicatorSize: TabBarIndicatorSize.tab,
//                            labelColor: AppColors.textBlack,
//                            unselectedLabelColor: AppColors.textGray,
//                          ),
//                        ),
//                      ];
//                    },
//                    body: _buildGraphicsCardShimmer(),
//                  ),
//                  Container(
//                    height: AppBar().preferredSize.height,
//                    width: getScreenWidth(context),
//                    color: AppColors.red,
//                    child: CustomAppBar(
//                      leadingIconName: Images.icBack,
//                      leadingIconColor: AppColors.white,
//                      centerTitle: AppBarTitleText(
//                        text: '@${widget.igUserName}',
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ));
//      },
//    ));
//  }
//
//  _buildDataToGetHeight() {
//    if (profileHeight == 0) {
//      if (widget.igId != null && widget.igId.isNotEmpty) {
//        return TestHeight(
//          key: key,
//          profile: _profileStore.influencerProfile,
//          listInterest: _profileStore.data.influencerProfile.interests,
//        );
//      } else {
//        return TestHeight(
//          key: key,
//          profile: _profileStore.influencerProfile,
//          listInterest: [],
//        );
//      }
//    } else {
//      return Container();
//    }
//  }
//
//  /// influencer profile
//  _buildProfileCardShimmer() {
//    if (profileHeight == 0.0) {
//      return Shimmer.fromColors(
//          child: ShimmerLoadingProfileCard(),
//          baseColor: Colors.grey[300],
//          highlightColor: Colors.grey[100]);
//    } else {
//      return Padding(
//          padding: EdgeInsets.only(top: AppBar().preferredSize.height),
//          child: widget.igId != null && widget.igId.isNotEmpty
//              ? NewProfileCard(
//                  profile: this._profileStore.influencerProfile,
//                  listInterest: _profileStore.data.influencerProfile.interests)
//              : NewProfileCard(
//                  profile: this._profileStore.influencerProfile,
//                  listInterest: []));
//    }
//  }
//
//  /// influencer graphics
//  _buildGraphicsCardShimmer() {
//    if (_profileStore.isShowLoading || _purchaseStore.isShowLoading) {
//      return ListView.builder(
//          shrinkWrap: true,
//          itemCount: 5,
//          itemBuilder: (context, position) {
//            return Padding(
//              padding:
//                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
//              child: Card(
//                elevation: 2,
//                child: Shimmer.fromColors(
//                    child: ShimmerLoadingGraphicsCard(),
//                    baseColor: Colors.grey[300],
//                    highlightColor: Colors.grey[100]),
//              ),
//            );
//          });
//    } else {
//      double paddingTop = getScreenHeight(context) * 0.05;
//      double paddingEdges = getScreenWidth(context) * 0.05;
//      if (widget.igId.isEmpty) {
//        if (_profileStore.igData.igJson != null &&
//            _profileStore.igData.igJson.isNotEmpty) {
//          return Padding(
//            padding: EdgeInsets.only(
//                top: paddingTop, left: paddingEdges, right: paddingEdges),
//            child: isOrderExist
//                ? UserProfileState4(
//                    onViewDemoPressed: _navigateToDemoGraphic,
//                  )
//                : UserProfileState2(
//                    onViewDemoPressed: _navigateToDemoGraphic,
//                    onUnlockAnalysisPressed: _getProduct,
//                  ),
//          );
//        } else {
//          return Padding(
//            padding: EdgeInsets.only(
//                top: paddingTop, left: paddingEdges, right: paddingEdges),
//            child: UserProfileState1(
//              onPressed: _navigateToDemoGraphic,
//            ),
//          );
//        }
//      } else {
//        if (widget.igId == DEMO_INFLUENCER_ID) {
//          return _buildInfluencerGraphic();
//        } else {
//          return isOrderExist
//              ? _buildInfluencerGraphic()
//              : Padding(
//                padding: EdgeInsets.only(left: paddingEdges, right: paddingEdges),
//                child: UserProfileState3(
//                    onViewDemoPressed: _navigateToDemoGraphic,
//                    onUnlockAnalysisPressed: _getProduct,
//                  ),
//              );
//        }
//      }
//    }
//  }
//
//  _buildInfluencerGraphic() {
//    return TabBarView(
//      controller: _tabController,
//      children: <Widget>[
//        InfluencerDemographics(
//          data: _profileStore.data,
//        ),
//        FollowerDemographics(
//          data: _profileStore.data,
//          listLanguageCode: listLanguageCode,
//        )
//      ],
//    );
//  }
//
//  _checkOrder() async {
//    await _purchaseStore.checkOrder(widget.igId);
//    _purchaseStore.onGetOrderSuccess = _onOrderExist();
//  }
//
//  _onOrderExist() {
//    if (widget.igId != null && widget.igId.isNotEmpty) {
//      _getInfluencerData();
//    } else {
//      _getInstagramData();
//    }
//    if (_purchaseStore.listCheckOrder.length != 0) {
//      setState(() {
//        isOrderExist = true;
//      });
//    } else {
//      setState(() {
//        isOrderExist = false;
//      });
//    }
//  }
//
//  _getInfluencerData() async {
//    await _profileStore.getInfluencerProfile(
//        userId: widget.igId, onGetProfileSuccess: _onGetInfluencerProfile);
//  }
//
//  _getInstagramData() async {
//    await _profileStore.getInstagramData(widget.igUserName,
//        onProfileSuccess: _onGetInfluencerProfile);
//  }
//
//  _onGetInfluencerProfile() async {
////    timer = Timer.periodic(Duration(milliseconds: 100), (timer) async {
////      if (profileHeight == 0.0) {
////        //returns null:
////        final State state = key.currentState;
////        //returns null:
////        final BuildContext context = key.currentContext;
////
////        //Error: The getter 'context' was called on null.
////        final RenderBox box = state.context.findRenderObject();
////
////        setState(() {
////          profileHeight = box.size.height + 50.0;
////        });
////        print(box.size.height);
////        print(context.size.height);
////      }
////    });
//    Future.delayed(Duration(milliseconds: 100)).then((_) {
//      if (profileHeight == 0.0) {
//        //returns null:
//        final State state = key.currentState;
//        //returns null:
//        final BuildContext context = key.currentContext;
//
//        //Error: The getter 'context' was called on null.
//        final RenderBox box = state.context.findRenderObject();
//
//        setState(() {
//          profileHeight = box.size.height + 50.0;
//        });
//        print(box.size.height);
//        print(context.size.height);
//      }
//    });
//
//  }
//
//  /// init in app purchase
//  initPlatformState() async {
//    // prepare
//    var result = await FlutterInappPurchase.instance.initConnection;
//    print('result: $result');
//
//    // If the widget was removed from the tree while the asynchronous platform
//    // message was in flight, we want to discard the reply rather than calling
//    // setState to update our non-existent appearance.
//    if (!mounted) return;
//
//    // refresh items for android
//    try {
//      String msg = await FlutterInappPurchase.instance.consumeAllItems;
//      print('consumeAllItems: $msg');
//    } catch (err) {
//      print('consumeAllItems error: $err');
//    }
//
//    /**
//     * We have to finish the purchased transaction to re-buy/re-purchased.
//     * Missing this finish step, we will get error:
//     * "This In-App purchase has already been bought. It will be restored for free." on  iOS
//     */
//    FlutterInappPurchase.instance
//        .getAvailablePurchases()
//        .then((purchasedItems) {
//      if (purchasedItems != null) {
//        purchasedItems.forEach((item) {
//          _finisTransaction(item);
//        });
//      }
//    });
//
//    _purchaseUpdatedSubscription =
//        FlutterInappPurchase.purchaseUpdated.listen((productItem) {
//      if (!isSaveOrder && widget.igId != DEMO_INFLUENCER_ID) {
//        _purchaseStore.saveOrder(widget.igId, productItem.transactionId,
//            _profileStore.data, price, currency);
//        isSaveOrder = true;
//      }
//      _finisTransaction(productItem);
//      _purchaseStore.onPurchaseSuccess = _onPurchaseSuccess();
//    });
//
//    _purchaseErrorSubscription =
//        FlutterInappPurchase.purchaseError.listen((purchaseError) {
//      setState(() {
//        isPurchaseLoading = false;
//      });
//      showMaterialDialog(context,
//          title: 'Error!',
//          message: purchaseError.message,
//          positiveButtonText: 'Ok',
//          onPositiveButtonPressed: () {});
//    });
//    setState(() {
//      isPurchaseLoading = false;
//    });
//  }
//
//  _getProduct() async {
//    setState(() {
//      isPurchaseLoading = true;
//    });
//    List<IAPItem> items;
//    if (Platform.isAndroid) {
//      items = await FlutterInappPurchase.instance.getProducts(_productLists);
//    } else {
//      // Get list of products
//      items =
//          await FlutterInappPurchase.instance.getAppStoreInitiatedProducts();
//      if (items.length == 0) {
//        items = await FlutterInappPurchase.instance.getProducts(_productLists);
//      }
//    }
//    price = items[0].price;
//    currency = items[0].currency;
//    FlutterInappPurchase.instance.requestPurchase(items[0].productId); //
//  }
//
//  _onPurchaseSuccess() {
//    setState(() {
//      isOrderExist = true;
//      isPurchaseLoading = false;
//    });
//  }
//
//  _finisTransaction(PurchasedItem productItem) {
//    if (Platform.isAndroid) {
//      FlutterInappPurchase.instance
//          .finishTransaction(productItem, isConsumable: true);
//    } else {
//      FlutterInappPurchase.instance
//          .finishTransactionIOS(productItem.purchaseToken);
//    }
//  }
//
//  /// other functions
//  _parseLanguageJson() async {
//    String data = await DefaultAssetBundle.of(context)
//        .loadString('assets/language_code.json');
//    listLanguageCode = json.decode(data);
//  }
//
//  _navigateToDemoGraphic() {
//    navigateTo(context,
//        '${Routes.demographicsScreen}?${Routes.userId}=$DEMO_INFLUENCER_ID&${Routes.userName}=$DEMO_INFLUENCER_USERNAME');
//  }
//}
//
//class TestHeight extends StatefulWidget {
//  final Profile profile;
//  final List<InterestData> listInterest;
//
//  TestHeight({Key key, this.profile, this.listInterest}) : super(key: key);
//
//  @override
//  _TestHeightState createState() => _TestHeightState();
//}
//
//class _TestHeightState extends State<TestHeight> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: Padding(
//            padding: EdgeInsets.only(top: AppBar().preferredSize.height),
//            child: NewProfileCard(
//              profile: widget.profile,
//              listInterest: widget.listInterest,
//            )));
//  }
//}
