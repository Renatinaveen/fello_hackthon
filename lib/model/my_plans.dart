class MyPlansModel {
  List<Plans>? plans;

  MyPlansModel({this.plans});

  MyPlansModel.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  String? name;
  String? lottieFile;
  int? amount;
  int? duration;
  int? interest;
  String? startDate;
  String? endDate;
  String? status;
  List<Payments>? payments;

  Plans(
      {this.name,
      this.lottieFile,
      this.amount,
      this.duration,
      this.interest,
      this.startDate,
      this.endDate,
      this.status,
      this.payments});

  Plans.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lottieFile = json['lottie_file'];
    amount = json['amount'];
    duration = json['duration'];
    interest = json['interest'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
    if (json['payments'] != null) {
      payments = <Payments>[];
      json['payments'].forEach((v) {
        payments!.add(new Payments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lottie_file'] = this.lottieFile;
    data['amount'] = this.amount;
    data['duration'] = this.duration;
    data['interest'] = this.interest;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    if (this.payments != null) {
      data['payments'] = this.payments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Payments {
  String? date;
  int? amount;
  String? status;

  Payments({this.date, this.amount, this.status});

  Payments.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    amount = json['amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['amount'] = this.amount;
    data['status'] = this.status;
    return data;
  }
}
