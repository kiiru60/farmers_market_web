import 'package:farmers_market_web/models/product.dart';
import 'package:farmers_market_web/services/firestore_service.dart';

class ClientBloc {
  final db = FirestoreService();

  Stream<List<Product>> get fetchAvailableProducts =>
      db.fetchAvailableProducts();

  dispose() {}
}
