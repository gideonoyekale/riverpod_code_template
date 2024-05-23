class AppProviders {
  AppProviders();
  //
  // static List<Provider> providers(LocalStorageService sl) => [
  //       Provider<NavigationService>(
  //         create: (_) => NavigationService(),
  //       ),
  //       Provider<SnackbarService>(
  //         create: (c) => SnackbarService(),
  //       ),
  //       Provider<NetworkService>(
  //         create: (c) => NetworkService(),
  //       ),
  //       Provider<LocalStorageService>(
  //         create: (c) => sl,
  //       ),
  //       Provider<PortfolioLocalStorage>(
  //         create: (c) => PortfolioLocalStorage(
  //           c.read<LocalStorageService>(),
  //         ),
  //       ),
  //       Provider<PortfolioRepository>(
  //         create: (c) => PortfolioRepository(
  //           c.read<PortfolioLocalStorage>(),
  //         ),
  //       ),
  //     ];
  //
  // static final List<BlocProvider> blocProviders = [
  //   BlocProvider(
  //     create: (context) => AppCubit(),
  //   ),
  // ];
}
