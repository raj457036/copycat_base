import 'package:copycat_base/common/failure.dart';
import 'package:purchases_flutter/models/customer_info_wrapper.dart';

abstract class SubscriptionRepository {
  FailureOr<CustomerInfo?> get();
  FailureOr<CustomerInfo?> applyPromoCoupon(String code);
}
