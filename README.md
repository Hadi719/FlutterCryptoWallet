# Flutter Crypto Wallet

A crypto wallet with Flutter.

## Setup Firebase
- __Step 1:__ Install Firebase CLI in Linux.
    > [More Detail Info In Firebase Website](https://firebase.google.com/docs/cli?authuser=0)

    - For install `Firebase CLI` in linux, run code below in `Terminal`.
    ```
    curl -sL https://firebase.tools | bash
    ```
    - Login to firebase
    ```
    firebase login
    ```
    - Test that the CLI is properly installed and accessing your account by listing your Firebase projects. Run the following command:
    ```
    firebase projects:list
    ```
    __Note:__ For update to the latest CLI version run:
    ```
    curl -sL https://firebase.tools | upgrade=true bash
    ```
    - Install the FlutterFire CLI by running the following command from any directory:
    ```
    dart pub global activate flutterfire_cli
    ```

- __Step 2:__ Configure your apps to use Firebase:

    - To get `firebase_options.dart` file, run code below on project root directory:
    ```
    flutterfire configure
    ```
    then select your project and wait to file be create.
    - Move `firebase_options.dart` file from `lib/src/` to `lib/src/config/firebase/`

## Firebase Authentication

### Android
> More detail info about Firebase authentication [check firebase auth example readme file here](https://github.com/firebase/flutterfire/blob/master/packages/firebase_auth/firebase_auth/example/README.md).

- Enable authentications in the [Firebase console](https://console.firebase.google.com/u/0/project/_/authentication/providers).
- For Android, follow the instructions below to get your app's SHA-1 fingerprint:

     - Find `gradlew` file in `android/` Right click on `gradlew` and click `Open in Terminal` and run this code.
     ```
     ./gradlew signingReport
     ```

     - if code above doesn't work try this code.
     ```
     gradlew signingReport
     ```

     - Now submit app's package name and SHA1 (and SHA256) fingerprint(s) in [Firebase Settings page](https://console.firebase.google.com/project/_/settings/general).
     > Refer to [Authenticating Your Client](https://developers.google.com/android/guides/client-auth) for details on how to get your app's SHA-1 fingerprint.

- Add `google_service.json` downloaded from firebase to `android/app`.
- Run this in Terminal
```
dart pub global activate flutterfire_cli
```
- Run this in project root directory
```
flutterfire configure --project=<PROJECT_NAME_FROM_FIREBASE>
```
- Move `firebase_options.dart` file from `lib/src/` to `lib/src/config/firebase/`

## Run The Generator 
- run below in `project root` directory for building `Retrofit` files.
```
dart run build_runner build
```
- go to `lib/src/data/datasource/remote/coinex_remote_client.g.dart` file,  
  - go to `getSingleMarketStatistics()` function.
  - change this `final value = SingleMarketStatisticsResponse.fromMap(_result.data!)` to:
  ```dart
  final value = SingleMarketStatisticsResponse.fromMap(_result.data!, marketName);
  ```
- go to `lib/src/data/datasource/remote/coingecko_remote_client.g.dart` file,  
  - go to `getSimpleSupportedVsCurrencies()` function.
    - change this `await _dio.fetch<Map<String, dynamic>>` to:
    ```
    await _dio.fetch<List<String>>
    ```
    - change this `final value = SimpleSupportedVsCurrenciesResponse.fromJson(_result.data!);` to:
    ```dart
    final editedResult = {'currenciesList': _result.data!};
    final value = SimpleSupportedVsCurrenciesResponse.fromJson(editedResult);
    ```  
  - go to `getCoinsMarketsList()` function.
    - change `await _dio.fetch<Map<String, dynamic>>` to:
    ```
    await _dio.fetch<List<dynamic>>
    ```
    - change this `final value = CoinsMarketsListResponse.fromJson(_result.data!);` to:
    ```dart
    final editedResult = {'coinsMarketsDataList': _result.data!};
    final value = CoinsMarketsListResponse.fromJson(editedResult);
    ```  
  - go to `getCoinOHLC()` function.
    - change `await _dio.fetch<Map<String, dynamic>>` to:
    ```
    await _dio.fetch<List<dynamic>>
    ```
    - change `final value = CoinOHLCResponse.fromJson(_result.data!);` to:
    ```dart
    final editedResult = {'ohlcList': _result.data!};
    final value = CoinOHLCResponse.fromJson(editedResult);
    ```

# Release build note
- __Obfuscate Dart code:__
  > ___Flutter’s code obfuscation works only on a release build.___  
  > [see more detail info](https://docs.flutter.dev/deployment/obfuscate)  

  To obfuscate your app, use the `flutter build` command in release mode with the `--obfuscate` and `--split-debug-info` options. The `--split-debug-info` option specifies the directory where Flutter outputs debug files. In the case of obfuscation, it outputs a symbol map. For example:  
  
  ```flutter build apk --obfuscate --split-debug-info=/<project-name>/<directory>```
    - __Tip 1:__ Once you’ve obfuscated your binary, `save the symbols file`. You need this if you later want to de-obfuscate a stack trace.
    - __Tip 2:__ The `--split-debug-info` option can also be used without `--obfuscate` to extract Dart program symbols, reducing code size. To learn more about app size, [see Measuring your app’s size](https://docs.flutter.dev/perf/app-size).
