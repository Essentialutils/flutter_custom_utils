[![utilities](https://img.shields.io/badge/=>-utilities-green?style=for-the-badge)]()

1. get device id in all available devices platform (android, ios, windows, linux, mac, web(get info details))

   ```dart
    await getDeviceId()
   ```

1. Widget to png

   ```dart
    cTakePicture(GlobalKey);
    // wrap with RepaintBoundary then use kry to create image
    RepaintBoundary(
        key: GlobalKey,
        child:Text('data'),
    )
   ```

1. flutter platform
   > just call these functions anywhere
   ```dart
    cIsAndroid
    cIsIOS
    cIsLinux
    cIsWindows
    cIsMacOS
    cIsWeb
    cIsFuchsia
   ```
1. flutter url structure

   > https://repad.dev/splash remove hash from url (https://repad.dev/#/splash)

   ```dart
   void main(){
       // Here we set the URL strategy for our web app.
       cSetPathUrl();
       runApp(MyApp());
   }
   ```

---

[![for-GridView](https://img.shields.io/badge/for-GridView-green?style=for-the-badge)]()

> Make a `responsive gridView` by using both `1 and 2`

1.  Based on your static design's `width`, calculate the responsive `grid item count`.

    ```dart
    crossAxisCount: getResCrossCountGrid(
        context: context,
        width: 180,
    ),
    ```

1.  For responsive grid item `aspect ratio`, it should be derived from your static design based on `height` and `width`.

    ```dart
    childAspectRatio: getResGridRatio(
        context: context,
        height: 165,
        width: 180,
    ),
    ```

1.  For normal grid `aspect ratio` > Having this aspect ratio will never break in larger or smaller devices

        ```dart
        crossAxisCount: 2,
        childAspectRatio: getGridRatio(
            crossAxisCount: 2,
            context: context,
            height: 165,
            width: 180,
        ),
        ```

    > Your provided `height` and `width` determine how it works

---

[![for-GridView](https://img.shields.io/badge/for-application/x_www_form_urlencoded-green?style=for-the-badge)]()

```dart
    cFormUrlEncode({'':''});
```

---

[![for-duration, delay](https://img.shields.io/badge/for-duration,_delay-green?style=for-the-badge)]()

1. For duration and delay

   ```dart
       void splash() {
           // cDays, cHours, cMinutes, cSeconds, cMilliseconds
           2.cSeconds.cDelay(() {
               // code here
           });

           // given number in seconds
           3.cDelay(() {
               // code here
           });
       }
   ```

---

[![for-date time](https://img.shields.io/badge/for-Date_time-green?style=for-the-badge)]()

1. add TimeOfDay to DateTime
   ```dart
      DateTime.now().cApplied(TimeOfDay.now())
   ```

---

[![for-MediaQuery](https://img.shields.io/badge/for-MediaQuery-green?style=for-the-badge)]()

1. Get the MediaQuery

   ```dart
   context.cIsTablet
   context.cSize    // getSize(context)
   context.cMQuery  // mQuery(context)
   context.cWidth
   context.cHeight
   context.cTheme
   context.cIsDarkMode
   context.cIconColor
   context.cTextTheme
   context.cOrient   // orientation
   context.cIsLand   // landscape
   context.cIsPort   // portrait
   context.cDevicePixelRatio
   ```

---

[![more-Utils](https://img.shields.io/badge/more-Utils-green?style=for-the-badge)]()

1. utils

   ```dart
   'text'.cToCapitalized
   'text'.cToTitleCase
   'text'.cIsLowerCase
   'text'.cIsAllCap
   'text'.cReverse
   'text'.cIsDigit
   'text'.cIsEmail
   'text'.cIsAlphabetOnly
   'text'.cIsPhoneIND
   'text'.cIsURL
   'text'.cIsPhoneNumber
   'true'.cToBoolean  // 0,1 also available
   '1000'.cToCurrencyIND
    1500.1.cToDistance  // (00 km, 00 m available)
   ```

   ```dart
    String offer = cGetOffer(offerPrice: 90,ordinalPrice: 100); // 10 %
   ```

---

[![for-list](https://img.shields.io/badge/for-List-green?style=for-the-badge)]()

1. Get Random item from list

   ```dart
   ['aa', 'bb', 'cc', 'dd'].cRandomSelect.toString()
   ```

---

[![for-color](https://img.shields.io/badge/for-color-green?style=for-the-badge)]()

1.  Get color from hash code

    ```dart
    CHColor.fromHex('#fffff')
    ```

1.  Get hash code from color

    ```dart
    Color.fromRGBO(250, 250, 250, 0.1).toHex()
    ```

---

[![for-widget](https://img.shields.io/badge/for-widget-green?style=for-the-badge)]()

1. Allows you to handle `(padding/margin)`

   ```dart
   Text('data').cPadZero // cMargZero
   Text('data').cPadAll(10) // cMargAll
   Text('data').cPadOnly(l: 10, r: 10, t: 10, b: 10,) // cMargOnly
   Text('data').cPadSymmetric(h: 10, v: 10,), // cMargSymmetric
   ```

1. Allows you to handle `ClipRRect`

   ```dart
   Container().cClipAll(10)
   Container().cClipHorizontal(l:10, r:10,)
   Container().cClipVertical(t:10, b:10,)
   Container().cClipOnly(tl: 10, tr: 10, bl: 10, br: 10,)
   ```

1. Allows you to insert widgets inside a `CustomScrollView`
   ```dart
   Text('data').cToSliver
   ```
1. More widgets
   ```dart
   Text('data').cVisible(true)
   Text('data').cOpacity(0.3)
   Text('data').cAbsorb(true)
   Text('data').cShadow()
   Text('data').cHero(tag)
   ```
1. Allows you to handle Alignment
   ```dart
   Text('data').cAlignment(Alignment.topCenter)
   Text('data').cPosition(l: 10, r: 10, t: 10, b: 10,)
   Text('data').cToCenter
   Text('data').cExpand(2)
   ```
1. For PreferredSize
   ```dart
   Text('data').cPreferSize(20)
   ```

---

[![](https://img.shields.io/badge/From-RΞPADΓΞCH-blue??style=plastic)](https://repadtech.com/)
[![pub package](https://img.shields.io/pub/v/flutter_custom_utils.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/flutter_custom_utils)

![Alt](https://repobeats.axiom.co/api/embed/2101af02ba767cc668c359f4f1167731c55e3e87.svg "Activity graph")
