class Endpoints {
  static const baseUrl = 'https://dev-api.ridejaunt.com';

  ///AUTH
  static const otpAuth = '$baseUrl/otp-auth';
  static const auth = '$baseUrl/auth';
  static const sendOtp = '$otpAuth/send/';
  static const signIn = '$otpAuth/signin/';
  static const editPhone = '$otpAuth/edit-phone/';
  static const verifyToken = '$auth/token/verify/';
  static const refreshToken = '$auth/token/refresh/';

  ///PROFILE
  static const account = '$baseUrl/account';
  static const profile = '$account/my-profile/';

  ///SYSTEM
  static const countries =
      'https://restcountries.com/v3.1/all?fields=name,flags';

  ///CART
  static const cart = '$baseUrl/cart/';
  static const cartOperation = '${cart}operation/';
  static const cartBreak = '${cartOperation}break/';
  static const cartCheckout = '${cartOperation}exit/';

  ///SERVICE-AREA
  static const serviceArea = '$baseUrl/service-area/';
  static const myArea = '${serviceArea}my-area/';

  ///SUBSCRIPTIONS
  static const stripeSubscription = '$baseUrl/stripe-subscription/url/';

  ///RIDE
  static const rideRequest = '$baseUrl/ride/request/';
  static const rateDriver = '$baseUrl/ride/rating/';
  static const rideRequestDriver = '$baseUrl/ride/request/driver/';
  static const allPendingRequests = '${rideRequestDriver}all/';

  static String cancelRideRequest(String id) => '$rideRequest$id/';

  static String driverRiderRequest(String id) => '$rideRequestDriver$id/';

  static String completeRide(String id) => '$rideRequestDriver$id/completed/';

  static String tripToDestination(String id) =>
      '$rideRequestDriver$id/trip-to-destination/';

  static String waitForPickup(String id) =>
      '$rideRequestDriver$id/wait-for-pickup/';

  ///PROMOTION
  static const promotion = '$baseUrl/promotion/';

  ///SAVED PLACES
  static const savedPlace = '$baseUrl/saved-place/';

  static String singleSavedPlace(String id) => '$savedPlace$id/';
}
