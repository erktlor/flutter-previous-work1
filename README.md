# Tom Panos flutter website

## Development

After each model change need to run:

```
flutter pub run build_runner build --delete-conflicting-outputs
```

## Build

Web:
```
flutter build web --web-renderer html --profile
```

IOS:
```
Xcode - Product - Archive
```

Android:
```
flutter build appbundle
```