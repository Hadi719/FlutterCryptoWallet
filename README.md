# Flutter Crypto Wallet

A crypto wallet with Flutter.

## Auth

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
