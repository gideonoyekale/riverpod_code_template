class RideRequestStatus {
  static const pending = 'pending';
  static const accepted = 'accepted';
  static const cancelled = 'cancelled';
}

class RideStatus {
  static const tripToPickup = 'trip_to_pickup';
  static const waitForPickup = 'wait_for_pickup';
  static const tripToDestination = 'trip_to_destination';
  static const completed = 'completed';
  static const cancelled = 'cancelled';
}
