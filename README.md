# Flutter Crypto Wallet

A crypto wallet with Flutter.

## Setup Firebase

### __Step 1:__ Install Firebase CLI in Ubuntu:

> More Detail Info In [Firebase Website](https://firebase.google.com/docs/cli?authuser=0)

- Install `Firebase CLI` in ubuntu, run command below in `Terminal`.
  ```shell
  curl -sL https://firebase.tools | bash
  ```
- Login to firebase
  ```shell
  firebase login
  ```
- Test that the CLI is properly installed and accessing your account by listing your Firebase
  projects. Run the following command:
  ```shell
  firebase projects:list
  ```
- __Note:__ Update to the latest CLI version run
  ```shell
  curl -sL https://firebase.tools | upgrade=true bash
  ```  

### __Step 2:__ Active the FlutterFire CLI

- Run the following command from any directory:
  ```shell
  dart pub global activate flutterfire_cli
  ```

  - If you get this error:
  > Warning: Pub installs executables into $HOME/.pub-cache/bin, which is not on your path.  
  > You can fix that by adding this to your shell's config file (.bashrc, .bash_profile, etc.):
  >
  > export PATH="$PATH":"$HOME/.pub-cache/bin"

  - __Ubuntu:__ run these commands separately:
    ```shell
     echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >>~/.bash_profile
    ```
    ```shell
     echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >>~/.bashrc
    ```  
    ```shell
    source .bashrc
    ```  
    ```shell
    source .bash_profile
    ```  
    - ___IF___ you're using `zsh` you should do this:  
      if you don't know what `zsh` is skip this.
      ```shell
      echo 'export PATH="$PATH":"$HOME/.pub-cache/bin"' >>~/.zshrc
      ```  
      ```shell
      exec zsh
      ```  
- Restart your VSCode or Android Studio

### __Step 3:__ Configure your apps to use Firebase:

- To get `firebase_options.dart` file, run code below on project root directory:
  ```shell
  flutterfire configure
  ```
  then select your project and wait to file be create.
- Move `firebase_options.dart` file from [lib/src/](lib/src)
  to [lib/src/config/firebase](lib/src/config/firebase).

## Firebase Authentication

### Android

> More detail info about Firebase authentication [check firebase auth example readme file here](https://github.com/firebase/flutterfire/blob/master/packages/firebase_auth/firebase_auth/example/README.md).

- Enable authentications in the [Firebase console](https://console.firebase.google.com/u/0/project/_/authentication/providers).
- For Android, follow the instructions below to get your app's SHA-1 fingerprint:
  > Refer to [Authenticating Your Client](https://developers.google.com/android/guides/client-auth)
  for details on how to get your app's SHA-1 fingerprint.

  - Find `gradlew` file in [android/](android) Right click on `gradlew` and click `Open in Terminal`
    and run this code.
     ```shell
     ./gradlew signingReport
     ```  

     - if code above doesn't work try this code.
     ```shell
     gradlew signingReport
     ```  

     - Now submit app's package name and SHA1 (and SHA256) fingerprint(s) in [Firebase Settings page](https://console.firebase.google.com/project/_/settings/general).

- Add `google_service.json` downloaded from firebase to [android/app](android/app).
  - if you have problems with firebase repeat___Setup Firebase
    ___ [Step 2](#step-2-active-the-flutterfire-cli)
    and [Step 3](#step-3-configure-your-apps-to-use-firebase).

## Run The Generator

- run below in `project root` directory for building `Retrofit` and `Freezed` files.
  ```shell
  dart run build_runner build --delete-conflicting-outputs
  ```
- go to [coinex_remote_client.g.dart](lib/src/data/datasource/remote/coinex_remote_client.g.dart)
  file,
  - search for `getSingleMarketStatistics()` function.
  - change this `final value = SingleMarketStatisticsResponse.fromMap(_result.data!)` to:
    ```dart
    final value = SingleMarketStatisticsResponse.fromMap(_result.data!, marketName);
    ```
- go
  to [coingecko_remote_client.g.dart](lib/src/data/datasource/remote/coingecko_remote_client.g.dart)
  file,
  - search for these functions:
    - `getSimpleSupportedVsCurrencies()`
    - `getCoinsMarketsList()`
    - `getCoinOHLC()`
    - `getAssetPlatformsList()`

  - change `await _dio.fetch<Map<String, dynamic>>` to:
      ```dart
      await _dio.fetch<List<dynamic>>
      ```  
  - change `final value = $ResponseName.fromJson(_result.data!);` to:
      ```dart
      final editedResult = {'data': _result.data!};
      final value = $ResponeName.fromJson(editedResult);
      ```  

# Release build note
- __Obfuscate Dart code:__
  > ___Flutter’s code obfuscation works only on a release build.___  
  > [see more detail info](https://docs.flutter.dev/deployment/obfuscate)  

  To obfuscate your app, use the `flutter build` command in release mode with the `--obfuscate` and `--split-debug-info` options. The `--split-debug-info` option specifies the directory where Flutter outputs debug files. In the case of obfuscation, it outputs a symbol map. For example:  
  
  ```flutter build apk --obfuscate --split-debug-info=/<project-name>/<directory>```
    - __Tip 1:__ Once you’ve obfuscated your binary, `save the symbols file`. You need this if you later want to de-obfuscate a stack trace.
    - __Tip 2:__ The `--split-debug-info` option can also be used without `--obfuscate` to extract Dart program symbols, reducing code size. To learn more about app size, [see Measuring your app’s size](https://docs.flutter.dev/perf/app-size).
