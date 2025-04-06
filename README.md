# flutter_adsense_web

A Flutter Web plugin to seamlessly integrate Google AdSense banner ads into your Flutter web applications.  
This package helps developers render AdSense ads using a simple widget and custom JavaScript logic.

---

## 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_adsense_web: latest_version
```

---

## ⚙️ Setup

1. **Add the GPT script in your `web/index.html`(in head tag) file**:

```html
<script async src="https://securepubads.g.doubleclick.net/tag/js/gpt.js" crossorigin="anonymous"></script>
```


2. **Register Gpt AdLoader in your main function**:

```js
void main() {
  // Initialize the GPT ad loader listener
  GptAdLoader().registerGptAdLoader();
  runApp(MyApp());
}

```

---

## 🚀 Usage

```js
import 'package:flutter_adsense_web/flutter_adsense.dart';

AdsenseBanner(
  adModel: AdModel(
    divId: 'flutter-banner-ad',
    slot: '/6355419/Travel/Europe/France/Paris',
    width: 300,
    height: 250,
  ),
)
```

---

## 📝 Notes

- Only works on **Flutter Web**.
- Make sure your AdSense account has the correct ad slot IDs.
- Ensure the GPT and ad manager JS scripts are correctly included in `index.html`.

---

## 🤝 Contributions Welcome!

Feel free to open issues or pull requests to improve this package.

---

## 📄 License

[MIT](LICENSE)