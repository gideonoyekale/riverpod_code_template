class RideRequestParam {
  RideRequestParam({
    this.pickup,
    this.pickupName,
    this.destination,
    this.destinationName,
    this.numberOfPassengers,
    this.userNote,
  });

  RideRequestParam.fromJson(dynamic json) {
    pickup = json['pickup'];
    pickupName = json['pickup_name'];
    destination = json['destination'];
    destinationName = json['destination_name'];
    numberOfPassengers = json['number_of_passengers'];
    userNote = json['user_note'];
  }

  String? pickup;
  String? pickupName;
  String? destination;
  String? destinationName;
  num? numberOfPassengers;
  String? userNote;

  RideRequestParam copyWith({
    String? pickup,
    String? pickupName,
    String? destination,
    String? destinationName,
    num? numberOfPassengers,
    String? userNote,
  }) =>
      RideRequestParam(
        pickup: pickup ?? this.pickup,
        pickupName: pickupName ?? this.pickupName,
        destination: destination ?? this.destination,
        destinationName: destinationName ?? this.destinationName,
        numberOfPassengers: numberOfPassengers ?? this.numberOfPassengers,
        userNote: userNote ?? this.userNote,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pickup'] = pickup;
    map['pickup_name'] = pickupName;
    map['destination'] = destination;
    map['destination_name'] = destinationName;
    map['number_of_passengers'] = numberOfPassengers;
    map['user_note'] = userNote;
    return map;
  }
}
