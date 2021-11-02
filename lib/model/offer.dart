class Offer {
  String aol, aod;
  double af, cw;
  double oc, ocpkg, dc, dcpkg, otc, otcpkg;
  double value;
  List<Offer>? offerList;

  Offer({required this.aol, required this.aod, required this.af, required this.cw, required this.oc, required this.ocpkg, required this.dc,
    required this.dcpkg, required this.otc, required this.otcpkg, required this.value});

}

List<Offer> offerList = [
  Offer(aol: "SJJ", aod: "LAX", af: 2, cw: 1, oc: 1, ocpkg: 1, dc: 1, dcpkg: 1, otc: 1, otcpkg: 1, value: 110),
];
