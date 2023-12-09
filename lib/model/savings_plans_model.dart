class AllPlans {
  List<SavingsPlansModel>? _savingsPlans;

  AllPlans({List<SavingsPlansModel>? savingsPlans}) {
    if (savingsPlans != null) {
      savingsPlans = savingsPlans;
    }
  }

  List<SavingsPlansModel>? get savingsPlans => _savingsPlans;
  set savingsPlans(List<SavingsPlansModel>? savingsPlans) =>
      _savingsPlans = savingsPlans;

  AllPlans.fromJson(Map<String, dynamic> json) {
    if (json['savings_plans'] != null) {
      _savingsPlans = <SavingsPlansModel>[];
      json['savings_plans'].forEach((v) {
        _savingsPlans!.add(SavingsPlansModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_savingsPlans != null) {
      data['savings_plans'] = _savingsPlans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SavingsPlansModel {
  String? _ageGroup;
  List<PlansModel>? _plans;
  List<Vouchers>? _vouchers;

  SavingsPlansModel(
      {String? ageGroup, List<PlansModel>? plans, List<Vouchers>? vouchers}) {
    if (ageGroup != null) {
      _ageGroup = ageGroup;
    }
    if (plans != null) {
      _plans = plans;
    }
    if (vouchers != null) {
      _vouchers = vouchers;
    }
  }

  String? get ageGroup => _ageGroup;
  set ageGroup(String? ageGroup) => _ageGroup = ageGroup;
  List<PlansModel>? get plans => _plans;
  set plans(List<PlansModel>? plans) => _plans = plans;
  List<Vouchers>? get vouchers => _vouchers;
  set vouchers(List<Vouchers>? vouchers) => _vouchers = vouchers;

  SavingsPlansModel.fromJson(Map<String, dynamic> json) {
    _ageGroup = json['age_group'];
    if (json['plans'] != null) {
      _plans = <PlansModel>[];
      json['plans'].forEach((v) {
        _plans!.add(PlansModel.fromJson(v));
      });
    }
    if (json['vouchers'] != null) {
      _vouchers = <Vouchers>[];
      json['vouchers'].forEach((v) {
        _vouchers!.add(Vouchers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age_group'] = _ageGroup;
    if (_plans != null) {
      data['plans'] = _plans!.map((v) => v.toJson()).toList();
    }
    if (_vouchers != null) {
      data['vouchers'] = _vouchers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlansModel {
  String? _name;
  String? _lottieFile;
  String? _duration;
  dynamic _totalAmountNeeded;
  dynamic _monthlyContribution;

  PlansModel(
      {String? name,
      String? lottieFile,
      String? duration,
      int? totalAmountNeeded,
      double? monthlyContribution}) {
    if (name != null) {
      _name = name;
    }
    if (lottieFile != null) {
      _lottieFile = lottieFile;
    }
    if (duration != null) {
      _duration = duration;
    }
    if (totalAmountNeeded != null) {
      _totalAmountNeeded = totalAmountNeeded;
    }
    if (monthlyContribution != null) {
      _monthlyContribution = monthlyContribution;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get lottieFile => _lottieFile;
  set lottieFile(String? lottieFile) => _lottieFile = lottieFile;
  String? get duration => _duration;
  set duration(String? duration) => _duration = duration;
  dynamic get totalAmountNeeded => _totalAmountNeeded;
  set totalAmountNeeded(dynamic totalAmountNeeded) =>
      _totalAmountNeeded = totalAmountNeeded;
  dynamic get monthlyContribution => _monthlyContribution;
  set monthlyContribution(dynamic monthlyContribution) =>
      _monthlyContribution = monthlyContribution;

  PlansModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _lottieFile = json['lottie_file'];
    _duration = json['duration'];
    _totalAmountNeeded = json['total_amount_needed'];
    _monthlyContribution = json['monthly_contribution'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['lottie_file'] = _lottieFile;
    data['duration'] = _duration;
    data['total_amount_needed'] = _totalAmountNeeded;
    data['monthly_contribution'] = _monthlyContribution;
    return data;
  }
}

class Vouchers {
  String? _brand;
  String? _discount;
  String? _voucherCode;
  String? _conditions;

  Vouchers(
      {String? brand,
      String? discount,
      String? voucherCode,
      String? conditions}) {
    if (brand != null) {
      _brand = brand;
    }
    if (discount != null) {
      _discount = discount;
    }
    if (voucherCode != null) {
      _voucherCode = voucherCode;
    }
    if (conditions != null) {
      _conditions = conditions;
    }
  }

  String? get brand => _brand;
  set brand(String? brand) => _brand = brand;
  String? get discount => _discount;
  set discount(String? discount) => _discount = discount;
  String? get voucherCode => _voucherCode;
  set voucherCode(String? voucherCode) => _voucherCode = voucherCode;
  String? get conditions => _conditions;
  set conditions(String? conditions) => _conditions = conditions;

  Vouchers.fromJson(Map<String, dynamic> json) {
    _brand = json['brand'];
    _discount = json['discount'];
    _voucherCode = json['voucher_code'];
    _conditions = json['conditions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brand'] = _brand;
    data['discount'] = _discount;
    data['voucher_code'] = _voucherCode;
    data['conditions'] = _conditions;
    return data;
  }
}
