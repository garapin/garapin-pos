class Route {
  final double? flatAmount;
  final double? percentAmount;
  final String currency;
  final String destinationAccountId;
  final String referenceId;

  Route({
    this.flatAmount,
    this.percentAmount,
    required this.currency,
    required this.destinationAccountId,
    required this.referenceId,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'currency': currency,
      'destination_account_id': destinationAccountId,
      'reference_id': referenceId,
    };

    if (percentAmount != null) {
      json['percent_amount'] = percentAmount;
    } else {
      json['flat_amount'] = flatAmount;
    }

    return json;
  }

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      flatAmount:
          json['flat_amount'] != null ? json['flat_amount'].toDouble() : null,
      percentAmount: json['percent_amount'] != null
          ? json['percent_amount'].toDouble()
          : null,
      currency: json['currency'],
      destinationAccountId: json['destination_account_id'],
      referenceId: json['reference_id'],
    );
  }
}

class MyDataModel {
  final String name;
  final String description;
  final List<Route> routes;

  MyDataModel({
    required this.name,
    required this.description,
    required this.routes,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> routesJson =
        routes.map((route) => route.toJson()).toList();
    return {
      'name': name,
      'description': description,
      'routes': routesJson,
    };
  }

  factory MyDataModel.fromJson(Map<String, dynamic> json) {
    List<Route> parsedRoutes =
        List<Route>.from(json['routes'].map((route) => Route.fromJson(route)));
    return MyDataModel(
      name: json['name'],
      description: json['description'],
      routes: parsedRoutes,
    );
  }
}
