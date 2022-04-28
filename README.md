[![for-GridView](https://img.shields.io/badge/for-GridView-green?style=for-the-badge)]()
> Make a `responsive gridview` by using both `1 and 2` 
1) Based on your static design's `width`, calculate the responsive `grid item count`.

    ```dart
    crossAxisCount: getResCrosCountGrid(
        context: context,
        width: 180,
    ),
    ```
1) For responsive grid item `aspect ratio`, it should be derived from your static design based on `height` and `width`.

    ```dart
    childAspectRatio: getResGridRatio(
        context: context,
        height: 165,
        width: 180,
    ),
    ```
1) For normal grid `aspect ratio` 
    > Having this aspect ratio will never break in larger or smaller devices

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

1) For duration and delay
    
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

1) add TimeOfDay to DateTime
    
    ```dart
       DateTime.now().cApplied(TimeOfDay.now())
    ```
---
[![for-MediaQuery](https://img.shields.io/badge/for-MediaQuery-green?style=for-the-badge)]()

1) Get the MediaQuery

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
[![for-String](https://img.shields.io/badge/for-String-green?style=for-the-badge)]()

1) Get the MediaQuery

    ```dart
    'text'.cToCapitalized()
    'text'.cToTitleCase()
    'text'.cIsLowerCase()
    'text'.cIsAllCap()
    'text'.cReverse()
    'text'.cIsDigit()
    'text'.cIsEmail()
    'text'.cIsAlphabetOnly()
    'text'.cIsPhoneIND()
    ```
---

[![for-color](https://img.shields.io/badge/for-color-green?style=for-the-badge)]()

1)  Get color from hash code

    ```dart
    CHColor.fromHex('#fffff')
    ```
1) Get hash code from color

    ```dart
    Color.fromRGBO(250, 250, 250, 0.1).toHex()
    ```
---
[![for-widget](https://img.shields.io/badge/for-widget-green?style=for-the-badge)]()

1) Allows you to handle `(padding/margin)`

    ```dart
    Text('data').cPadZero // cMargZero 
    Text('data').cPadAll(10) // cMargAll
    Text('data').cPadOnly(l: 10, r: 10, t: 10, b: 10,) // cMargOnly
    Text('data').cPadSymmetric(h: 10, v: 10,), // cMargSymmetric
    ```
1) Allows you to handle `ClipRRect`

    ```dart
    Container().cClipAll(10) 
    Container().cClipHorizontal(l:10, r:10,) 
    Container().cClipVertical(t:10, b:10,) 
    Container().cClipOnly(tl: 10, tr: 10, bl: 10, br: 10,) 
    ```
1) Allows you to insert widgets inside a `CustomScrollView`
    ```dart
    Text('data').cToSliver
    ```
1) Allows you to handle `Visibility`, `Opacity`, `AbsorbPointer` and `PhysicalModel`
    ```dart
    Text('data').cVisible(true)
    Text('data').cOpacity(0.3)
    Text('data').cAbsorb(true)
    Text('data').cShadow()
    ```
1) Allows you to handle Alignment
    ```dart
    Text('data').cAlignment(Alignment.topCenter)
    Text('data').cPosition(l: 10, r: 10, t: 10, b: 10,)
    Text('data').cToCenter
    Text('data').cExpand(2)
    ```
1) For PreferredSize
    ```dart
    Text('data').cPreferSize(20)
    ```
***

[![](https://img.shields.io/badge/From-RΞPADΓΞCH-blue??style=plastic)](https://repadtech.com/)
[![pub package](https://img.shields.io/pub/v/flutter_custom_utils.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/flutter_custom_utils)

![Alt](https://repobeats.axiom.co/api/embed/2101af02ba767cc668c359f4f1167731c55e3e87.svg "Activity graph")

