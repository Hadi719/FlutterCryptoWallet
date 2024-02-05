import 'package:equatable/equatable.dart';

class CoinMetadataResponse extends Equatable {
  const CoinMetadataResponse({
    this.id,
    this.symbol,
    this.name,
    this.webSlug,
    this.assetPlatformId,
    this.platforms = const {},
    this.detailPlatforms = const {},
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories = const [],
    this.previewListing,
    this.publicNotice,
    this.additionalNotices,
    this.localization = const {},
    this.description = const {},
    this.links = const {},
    this.image = const {},
    this.countryOrigin,
    this.genesisDate,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.watchlistPortfolioUsers,
    this.marketCapRank,
    this.marketData = const {},
    this.communityData = const {},
    this.developerData = const {},
    this.statusUpdates = const [],
    this.lastUpdated,
    this.tickers = const [],
  });

  final String? id;
  final String? symbol;
  final String? name;
  final String? webSlug;
  final dynamic assetPlatformId;
  final Map<String, dynamic> platforms;
  final Map<String, dynamic> detailPlatforms;
  final int? blockTimeInMinutes;
  final String? hashingAlgorithm;

  // List<dynamic>
  final List<String> categories;
  final bool? previewListing;
  final dynamic publicNotice;
  final dynamic additionalNotices;
  final Map<String, dynamic> localization;
  final Map<String, dynamic> description;
  final Map<String, dynamic> links;
  final Map<String, dynamic> image;
  final String? countryOrigin;
  final String? genesisDate;
  final double? sentimentVotesUpPercentage;
  final double? sentimentVotesDownPercentage;
  final int? watchlistPortfolioUsers;
  final int? marketCapRank;
  final Map<String, dynamic> marketData;
  final Map<String, dynamic> communityData;
  final Map<String, dynamic> developerData;
  final List<dynamic> statusUpdates;
  final String? lastUpdated;
  final List<dynamic> tickers;

  factory CoinMetadataResponse.fromMap(Map<String, dynamic> mapData) {
    return CoinMetadataResponse(
      id: mapData['id'],
      symbol: mapData['symbol'],
      name: mapData['name'],
      webSlug: mapData['web_slug'],
      assetPlatformId: mapData['asset_platform_id'],
      platforms: mapData['platforms'],
      detailPlatforms: mapData['detail_platforms'],
      blockTimeInMinutes: mapData['block_time_in_minutes'],
      hashingAlgorithm: mapData['hashing_algorithm'],
      categories: List.from(mapData['categories'])
          .map(
            (e) => e as String,
          )
          .toList(),
      previewListing: mapData['preview_listing'],
      publicNotice: mapData['public_notice'],
      additionalNotices: mapData['additional_notices'],
      localization: mapData['localization'],
      description: mapData['description'],
      links: mapData['links'],
      image: mapData['image'],
      countryOrigin: mapData['country_origin'],
      genesisDate: mapData['genesis_date'],
      sentimentVotesUpPercentage: mapData['sentiment_votes_up_percentage'],
      sentimentVotesDownPercentage: mapData['sentiment_votes_down_percentage'],
      watchlistPortfolioUsers: mapData['watchlist_portfolio_users'],
      marketCapRank: mapData['market_cap_rank'],
      marketData: mapData['market_data'],
      communityData: mapData['community_data'],
      developerData: mapData['developer_data'],
      statusUpdates: mapData['status_updates'],
      lastUpdated: mapData['last_updated'],
      tickers: mapData['tickers'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        webSlug,
        assetPlatformId,
        platforms,
        detailPlatforms,
        blockTimeInMinutes,
        hashingAlgorithm,
        categories,
        previewListing,
        publicNotice,
        additionalNotices,
        localization,
        description,
        links,
        image,
        countryOrigin,
        genesisDate,
        sentimentVotesUpPercentage,
        sentimentVotesDownPercentage,
        watchlistPortfolioUsers,
        marketCapRank,
        marketData,
        communityData,
        developerData,
        statusUpdates,
        lastUpdated,
        tickers,
      ];

  @override
  bool get stringify => true;
}
