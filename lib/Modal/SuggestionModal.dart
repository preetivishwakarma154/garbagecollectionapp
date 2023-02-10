class suggestionReport {
  String? username;
  int? propertyNo;
  String? date;
  String? suggestion;
  int? suggestionId;

  suggestionReport(
      {this.username,
        this.propertyNo,
        this.date,
        this.suggestion,
        this.suggestionId});

  suggestionReport.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    propertyNo = json['property_no'];
    date = json['date'];
    suggestion = json['suggestion'];
    suggestionId = json['suggestion_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['property_no'] = this.propertyNo;
    data['date'] = this.date;
    data['suggestion'] = this.suggestion;
    data['suggestion_id'] = this.suggestionId;
    return data;
  }
}
