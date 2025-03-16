class VoucherModel {
  final String title;
  final String validUntil;
  final String merchant;
  final String qrCode;
  final String logo;
  final String redeemDate;
  final String status; // Active, Used, Expired

  VoucherModel({
    required this.title,
    required this.validUntil,
    required this.merchant,
    required this.qrCode,
    required this.logo,
    required this.redeemDate,
    required this.status,
  });
}
