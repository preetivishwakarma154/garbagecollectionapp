class registerModal {
  String? qrcode;
  String? parcelno;
  String? username;
  String? fathername;
  String? identityno;
  String? mobileno;
  String? wardno;
  String? propertyno;
  String? propertytype;
  String? noofmembers;
  String? propertytaxno;
  String? watertaxno;
  String? electricityconnectionno;
  String? paidpropertytax;
  String? buildingpermission;

  registerModal(bool bool, jsonDecode, 
      {this.qrcode,
      this.parcelno,
      this.username,
      this.fathername,
      this.identityno,
      this.mobileno,
      this.wardno,
      this.propertyno,
      this.propertytype,
      this.noofmembers,
      this.propertytaxno,
      this.watertaxno,
      this.electricityconnectionno,
      this.paidpropertytax,
      this.buildingpermission});

  registerModal.fromJson(Map<String, dynamic> json) {
    qrcode = json['qrcode'];
    parcelno = json['parcelno'];
    username = json['username'];
    fathername = json['fathername'];
    identityno = json['identityno'];
    mobileno = json['mobileno'];
    wardno = json['wardno'];
    propertyno = json['propertyno'];
    propertytype = json['propertytype'];
    noofmembers = json['noofmembers'];
    propertytaxno = json['propertytaxno'];
    watertaxno = json['watertaxno'];
    electricityconnectionno = json['electricityconnectionno'];
    paidpropertytax = json['paidpropertytax'];
    buildingpermission = json['buildingpermission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qrcode'] = this.qrcode;
    data['parcelno'] = this.parcelno;
    data['username'] = this.username;
    data['fathername'] = this.fathername;
    data['identityno'] = this.identityno;
    data['mobileno'] = this.mobileno;
    data['wardno'] = this.wardno;
    data['propertyno'] = this.propertyno;
    data['propertytype'] = this.propertytype;
    data['noofmembers'] = this.noofmembers;
    data['propertytaxno'] = this.propertytaxno;
    data['watertaxno'] = this.watertaxno;
    data['electricityconnectionno'] = this.electricityconnectionno;
    data['paidpropertytax'] = this.paidpropertytax;
    data['buildingpermission'] = this.buildingpermission;
    return data;
  }
}
