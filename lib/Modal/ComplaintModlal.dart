class ComplaintModal {
  int? complaintId;
  String? date;
  String? complaintType;
  String? complaint;
  int? customerid;

  ComplaintModal(
      {this.complaintId,
        this.date,
        this.complaintType,
        this.complaint,
        this.customerid});

  ComplaintModal.fromJson(Map<String, dynamic> json) {
    complaintId = json['complaint_id'];
    date = json['date'];
    complaintType = json['complaint_type'];
    complaint = json['complaint'];
    customerid = json['customerid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['complaint_id'] = this.complaintId;
    data['date'] = this.date;
    data['complaint_type'] = this.complaintType;
    data['complaint'] = this.complaint;
    data['customerid'] = this.customerid;
    return data;
  }
}
