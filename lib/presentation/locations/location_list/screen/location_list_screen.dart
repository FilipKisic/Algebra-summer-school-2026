import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:urban_explorer/ad_helper.dart';
import 'package:urban_explorer/di.dart';
import 'package:urban_explorer/domain/model/location.dart';
import 'package:urban_explorer/presentation/app_router.dart';
import 'package:urban_explorer/presentation/locations/location_list/controller/state/location_list_state.dart';
import 'package:urban_explorer/presentation/locations/widget/location_card.dart';

class LocationListScreen extends ConsumerWidget {
  const LocationListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationListControllerProvider);
    return Scaffold(
      body: switch (state) {
        LoadingState() => Center(child: Lottie.asset('assets/animations/loading_sights.json', width: 60)),
        EmptyState() => EmptyStateWidget(),
        LoadedState(locations: final locationList) => LocationList(locationList),
        ErrorState() => ErrorStateWidget(),
      },
    );
  }
}

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Places',
                  style: TextStyle(fontSize: 40, fontWeight: .bold),
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/images/no_locations_found.png', width: 200),
            const SizedBox(height: 40),
            Text(
              'No places found',
              style: TextStyle(fontSize: 18, fontWeight: .bold),
            ),
            Text(
              'Try to refresh the screen or check later.',
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class LocationList extends StatefulWidget {
  final List<Location> locations;

  const LocationList(this.locations, {super.key});

  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(() => _bannerAd = ad as BannerAd),
        onAdFailedToLoad: (ad, err) => ad.dispose(),
      ),
    ).load();

    _loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            if (_bannerAd != null)
              Align(
                alignment: .topCenter,
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            Text(
              'Places',
              style: TextStyle(fontSize: 40, fontWeight: .bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: widget.locations.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    _interstitialAd?.show();
                    Navigator.of(context).pushNamed(AppRouter.locationDetails, arguments: widget.locations[index]);
                  },
                  child: LocationCard(location: widget.locations[index]),
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {},
          );

          setState(() => _interstitialAd = ad);
        },
        onAdFailedToLoad: (err) => print('Failed to load an interstitial ad: ${err.message}'),
      ),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Places',
                  style: TextStyle(fontSize: 40, fontWeight: .bold),
                ),
              ],
            ),
            const Spacer(),
            Image.asset('assets/images/error_image.png', width: 250),
            Text(
              'There was an error.',
              style: TextStyle(fontWeight: .bold, fontSize: 18),
            ),
            Text(
              'Please try again later or check\nyour internet connection.',
              style: TextStyle(fontSize: 16),
              textAlign: .center,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
