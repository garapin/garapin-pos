part of 'routes.dart';

class RouteNames {
  RouteNames._();

  static const String root = "/";
  static const String login = "/login";
  static const String dashboard = "/dashboard";
  static const String dashboardTeknisi = "/dashboard_teknisi";
  static const String productDetail = "/product_detail";
  static const String addProduct = "/add_product";
  static const String editProduct = "/edit_product";
  static const String addToCart = "/add_to_cart";
  static const String listTransaction = "/list_transaction";
  static const String listTransactionTeknisi = "/list_transaction_teknisi";
  static const String detailTransaction = "/detail_transaction";
  static const String addUser = "/add_user";
  static const String profile = "/profile";
  static const String cart = "/cart";

  //product
  static const String createProduct = "/create_product";

  //teknisi
  static const String listItemInstalation = "/list_item_instalation";
  static const String processInstalationItem = "/process_instalation_item";

  static const String installedVehicle = "/installed_vehicle";

  //vahicle installed
  static const String listVehicleInstalled = "/list_vehicle_installed";

  //customer/mitra
  static const String addCustomer = "/add_customer";
  static const String listCustomer = "/list_customer";
}
