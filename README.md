# Flutter Spin Wheel Menu

[![pub package](https://img.shields.io/pub/v/flutter_zoom_drawer.svg)](https://pub.dev/packages/flutter_zoom_drawer) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Flutter package with custom implementation of the Side Menu (Drawer)

## 🌟 Getting Started

To start using this package, add `flutter_spin_wheel_menu` dependency to your `pubspec.yaml`

```yaml
dependencies:
  flutter_spin_wheel_menu: "<latest_release>"
```

## 💪 Features

- Simple sliding drawer
- Sliding drawer with shadows
- Sliding drawer with rotation
- Sliding drawer with rotation and shadows
- Support for both LTR & RTL

## 📌 Simple Example (Thanks to @JesusHdezWaterloo)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_spin_wheel_menu/flutter_spin_wheel_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterSpinWheelMenu Example'),
      ),
      body: Center(
        child: FlutterSpinWheelMenu(
          rotationDuration: Duration(seconds: 10),
          radius: 80.0,
          perspective: 0.01,
          backgroundColor: Colors.blue,
          onTap: (index) {
            // Add your logic here
          },
          cardTitles: ['Item 1', 'Item 2', 'Item 3'],
          cardDescriptions: ['Description 1', 'Description 2', 'Description 3'],
          cardIcons: [Icons.star, Icons.favorite, Icons.star_border],
          numCards: 3,
        ),
      ),
    );
  }
}

```

## 📝 Documentation

```dart
    FlutterSpinWheelMenu(
        rotationDuration: Duration(seconds: 10),
        radius: 80.0,
        perspective: 0.01,
        backgroundColor: Colors.blue,
        onTap: (index) {
        print('Card clicked: $index');
          // Add your logic here
        },
        cardTitles: ['Item 1', 'Item 2', 'Item 3'],
        cardDescriptions: ['Description 1', 'Description 2', 'Description 3'],
        cardIcons: [Icons.star, Icons.favorite, Icons.star_border],
        numCards: 3,
    ),
```

## Screens

![Example app Image](https://drive.google.com/file/d/1JYM_rl9qmK_cuHMb8-ZKZy_Bm2egUjSm/view?usp=sharing)

![Example app Demo](https://drive.google.com/file/d/1JZZJm-0KnGwxNWMdcm-gAn_irP_7piDQ/view?usp=sharing)


## Issues

Please file any issues, bugs or feature request as an issue on our [GitHub](https://github.com/medyas/flutter_spin_wheel_menu/issues) page.

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our [contribution guide](CONTRIBUTING.md) and send us your [pull request](https://github.com/fussion-integrator/flutter_spin_wheel_menu/pulls).

## Credits

Credits goes to [FussionTech](https://github.com/fussion-integrator) as most of this package comes from his implementation.
