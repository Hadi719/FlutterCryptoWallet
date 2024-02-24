import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../config/utils/constants/firebase_strings.dart';

abstract final class FirestoreRef {
  final String id;
  final String path;
  final FirestoreRefType type;

  const FirestoreRef({
    required this.id,
    required this.path,
    required this.type,
  });

  dynamic ref(FirebaseFirestore firestore) {
    if (type == FirestoreRefType.collection) return firestore.collection(path);
    if (type == FirestoreRefType.doc) return firestore.doc(path);
  }

  // CollectionReference
  // DocumentReference
}

class FirestoreAppDatabase {
  static const FirestoreAPIsData apisData = FirestoreAPIsData();
}

final class FirestoreAPIsData extends FirestoreRef {
  final FirestoreGecko gecko = const FirestoreGecko();

  const FirestoreAPIsData({
    super.id = kFirestoreAPIsDataId,
    super.path = kFirestoreAPIsDataPath,
    super.type = FirestoreRefType.collection,
  });

  @override
  CollectionReference<Map<String, dynamic>> ref(FirebaseFirestore firestore) {
    return super.ref(firestore);
  }
}

final class FirestoreGecko extends FirestoreRef {
  final FirestoreGeckoCoins coins = const FirestoreGeckoCoins();

  final FirestoreGeckoSimple simple = const FirestoreGeckoSimple();
  final FirestoreGeckoOthers others = const FirestoreGeckoOthers();
  const FirestoreGecko({
    super.id = kFirestoreGeckoId,
    super.path = kFirestoreGeckoPath,
    super.type = FirestoreRefType.doc,
  });
}

final class FirestoreGeckoCoins extends FirestoreRef {
  final FirestoreGeckoCoinsHistory history = const FirestoreGeckoCoinsHistory();

  final FirestoreGeckoCoinsMarketChart marketChart =
      const FirestoreGeckoCoinsMarketChart();
  final FirestoreGeckoCoinsMarketChartRange marketChartRange =
      const FirestoreGeckoCoinsMarketChartRange();
  final FirestoreGeckoCoinsMetaData metaData =
      const FirestoreGeckoCoinsMetaData();
  final FirestoreGeckoCoinsOHLC ohlc = const FirestoreGeckoCoinsOHLC();
  final FirestoreGeckoCoinsMarketsList marketsList =
      const FirestoreGeckoCoinsMarketsList();
  const FirestoreGeckoCoins({
    super.id = kFirestoreCoinsId,
    super.path = kFirestoreCoinsPath,
    super.type = FirestoreRefType.collection,
  });
}

final class FirestoreGeckoCoinsHistory extends FirestoreRef {
  const FirestoreGeckoCoinsHistory({
    super.id = kFirestoreHistoryId,
    super.path = kFirestoreHistoryPath,
    super.type = FirestoreRefType.doc,
  });
}

final class FirestoreGeckoCoinsMarketChart extends FirestoreRef {
  const FirestoreGeckoCoinsMarketChart({
    super.id = kFirestoreMarketChartId,
    super.path = kFirestoreMarketChartPath,
    super.type = FirestoreRefType.doc,
  });
}

final class FirestoreGeckoCoinsMarketChartRange extends FirestoreRef {
  const FirestoreGeckoCoinsMarketChartRange({
    super.id = kFirestoreMarketChartRangeId,
    super.path = kFirestoreMarketChartRangePath,
    super.type = FirestoreRefType.doc,
  });
}

final class FirestoreGeckoCoinsMarketsList extends FirestoreRef {
  const FirestoreGeckoCoinsMarketsList({
    super.id = kFirestoreMarketsListId,
    super.path = kFirestoreMarketsListPath,
    super.type = FirestoreRefType.doc,
  });

  @override
  DocumentReference<Map<String, dynamic>> ref(FirebaseFirestore firestore) {
    return super.ref(firestore);
  }
}

final class FirestoreGeckoCoinsMetaData extends FirestoreRef {
  const FirestoreGeckoCoinsMetaData({
    super.id = kFirestoreMetaDataId,
    super.path = kFirestoreMetaDataPath,
    super.type = FirestoreRefType.doc,
  });
}

final class FirestoreGeckoCoinsOHLC extends FirestoreRef {
  const FirestoreGeckoCoinsOHLC({
    super.id = kFirestoreOHLCId,
    super.path = kFirestoreOHLCPath,
    super.type = FirestoreRefType.doc,
  });
}

final class FirestoreGeckoOthers extends FirestoreRef {
  const FirestoreGeckoOthers({
    super.id = kFirestoreOthersId,
    super.path = kFirestoreOthersPath,
    super.type = FirestoreRefType.collection,
  });
}

final class FirestoreGeckoSimple extends FirestoreRef {
  const FirestoreGeckoSimple({
    super.id = kFirestoreSimpleId,
    super.path = kFirestoreSimplePath,
    super.type = FirestoreRefType.collection,
  });
}

enum FirestoreRefType { collection, doc }
