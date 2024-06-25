[![](https://img.shields.io/pub/publisher/flutter_custom_utils?label=From)](https://repadtech.com/)
[![](https://img.shields.io/github/license/Essentialutils/flutter_custom_utils)](https://github.com/Essentialutils/flutter_custom_utils/blob/main/LICENSE)
[![pub package](https://img.shields.io/pub/v/flutter_custom_utils.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/flutter_custom_utils)
[![](https://img.shields.io/pub/points/flutter_custom_utils?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/flutter_custom_utils)
[![](https://img.shields.io/pub/popularity/flutter_custom_utils?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/flutter_custom_utils)
[![](https://img.shields.io/pub/likes/flutter_custom_utils?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/flutter_custom_utils)
[![](https://badgen.net/pub/flutter-platform/flutter_custom_utils)](https://pub.dev/packages/flutter_custom_utils)

> **Note:** This library seamlessly functions across all platforms, ensuring compatibility without any issues.

---

[![utilities](https://img.shields.io/badge/=>-utilities-green?style=for-the-badge)]()

1. Global Overlay Alert: This alert will remain at the top of the screen at all times until it is closed.

   ```dart
   cShowAlwaysOnTopAlert(
        context: context,
        title: "Alert",
        message: "Testing...............",
        ok: () {
            cCloseAlwaysOnTopAlert();
        },
    );

   ```

1. Opens a file picker dialog allowing the user to select an image file, optionally crop it, and then perform actions based on user interaction.

   ```dart
   cPickAndCropImage(
       context,
       cropDisable: false,
       aspectRatio: 1.7,
       cancelButton: () {
           setState(() {
               croppedImg = null;
           });
           Navigator.of(context).pop();
       },
       okButton: (Uint8List data, String fileName) {
           /// selected file name
           debugPrint(fileName);
           setState(() {
               croppedImg = data;
               /// Load image to ui using 'Image.memory(croppedImg)'
           });
           Navigator.of(context).pop();
       },
   ),
   ```

1. get device id in all available devices platform (**android**, **ios**, **windows**, **linux**, **mac**, **web**(get info details))

   ```dart
    await cGetDeviceId()
   ```

1. Takes a screenshot of a widget using a [**GlobalKey**] and returns it as a [**Uint8List**] (PNG image).

   ```dart
    cTakePicture(GlobalKey);
    // wrap with RepaintBoundary then use key to create image
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

> provide `discardSize` to minus size from calculation

1.  Based on your static design's `width`, calculate the responsive `grid item count`.

    ```dart
    crossAxisCount: cGetResCrossCountGrid(
        context: context,
        width: 180,
    ),
    ```

1.  For responsive grid item `aspect ratio`, it should be derived from your static design based on `height` and `width`.

    ```dart
    childAspectRatio: cGetResGridRatio(
        context: context,
        height: 165,
        width: 180,
    ),
    ```

1.  For normal grid `aspect ratio` > Having this aspect ratio will never break in larger or smaller devices

    ```dart
    crossAxisCount: 2,
    childAspectRatio: cGetGridRatio(
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

1. An extension for nullable [`TimeOfDay`] objects, providing a method to convert them to a formatted string in AM/PM format or display 'Invalid date' if the [`TimeOfDay`] object is null.

   > cTimeOfDayToString()

   ```dart
   TimeOfDay? timeOfDay = TimeOfDay(hour: 14, minute: 30);
   String formattedTime = timeOfDay.cTimeOfDayToString();
   print(formattedTime); // Output: "2:30 PM"

   timeOfDay = null;
   formattedTime = timeOfDay.cTimeOfDayToString();
   print(formattedTime); // Output: "Invalid date"
   ```

1. This method attempts to parse the input string in both 12-hour and 24-hour time formats and returns a [`TimeOfDay`] object if parsing is successful, or null if the string cannot be parsed as a valid time.

   > cToTimeOfDay()

   ```dart
   String timeString = "2:30 PM";
   TimeOfDay? timeOfDay = timeString.cToTimeOfDay();

   if (timeOfDay != null) {
       print("Parsed time: $timeOfDay");
   } else {
       print("Invalid time format");
   }
   ```

1. This method combines the date part of the current [`DateTime`] instance with the hour and minute components from the provided [`time`].

   > cApplied()

   ```dart
   final date = DateTime.now();
   final time = TimeOfDay(hour: 15, minute: 30);
   final combinedDateTime = date.cApplied(time);
   print(combinedDateTime); // Output: 2023-09-15:30:00.000
   ```

1. Optionally, you can provide a custom [`format`] string to specify the desired date format. If [`format`] is not provided, the default format `dd/MM/yyyy` will be used.

   > cGetFormattedDate()

   ```dart
   final date = DateTime.now();
   final formattedDate = date.cGetFormattedDate(format: 'MM-dd-yyyy');
   print(formattedDate); // Output: 09-13-2023
   ```

   ### OR

   ```dart
   String date = '2023-09-13';
   String formattedDate = date.cGetFormattedDate(format: 'MMMM d, y');
   // Result: 'September 13, 2023'
   ```

1. This method calculates the difference between the current [`DateTime`] instance and the current date and time and provides an aging description.

   > cDateToAging()

   ```dart
   final pastDate = DateTime(2022, 3, 10);
   final agingString = pastDate.cDateToAging();
   print(agingString); // Output: "1 year ago"
   ```

   ### OR

   ```dart
   String date = '2023-08-01T12:34:56';
   String agingDescription = date.cDateToAging();
   // Result: '1 month ago'
   ```

1. Converts a string representation of a date and time into a [`DateTime`] object.

   > cGetDateFromString()

   ```Dart
   // Example date and time string
   String dateString = "2023-09-26 14:30:00";
   // Attempt to parse the date string into a DateTime object
   DateTime? dateTime = dateString.cGetDateFromString();
   // Check if parsing was successful
   if (dateTime != null) {
    print("Parsed DateTime: $dateTime");
   } else {
    print("Failed to parse the string as DateTime.");
   }
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
   '1000'.cToCurrencyIND // ₹ 1,000.00
   '1000'.cToCurrency() // ₹ 1,000
    000.0.cToDistance  // (00 km, 00 m available)
    000.0.cToWeight  // (00 g, 00 kg available)
   ```

1. cGetOffer()
   ```dart
    String offer = cGetOffer(offerPrice: 90,ordinalPrice: 100); // 10 %
   ```
1. buildString()
   ```dart
    final word = cBuildString((sb) {
        for (var i = 0; i < 10; i++) {
            sb.write(i);
        }
    });  // 0123456789
   ```

---

[![for-list](https://img.shields.io/badge/for-List-green?style=for-the-badge)]()

1. Get Random item from list

   ```dart
   ['aa', 'bb', 'cc', 'dd'].cRandomSelect.toString()
   ```

1. Get first item from list (if list is empty then result will be null)
   ```dart
   ['aa', 'bb', 'cc', 'dd'].cFirst
   ['aa', 'bb', 'cc', 'dd'].cFirstWhere((e)=>(type your condition here)))
   ```

---

[![for-color](https://img.shields.io/badge/for-color-green?style=for-the-badge)]()

1.  This extension provides a method to convert a Flutter `Color` object to its hexadecimal representation with an optional leading hash sign. The resulting hexadecimal string includes the alpha, red, green, and blue components of the color.

    ```dart
    final color = Color(0xFF42A5F5);
    final hexString = color.cToHex(); // Returns: "#FF42A5F5"
    ```

1.  This extension provides a method to convert a hexadecimal color code represented as a String into a Flutter `Color` object. The color code can optionally include a leading hash sign ('#'). If the input color code has 6 or 7 characters (with or without the hash sign), the method will assume it represents a color with an alpha component and append 'ff' to the color code to make it fully opaque.

    ```dart
    final colorCode = '#FF42A5F5';
    final color = colorCode.cToColor(); // Returns: Color(0xFF42A5F5)
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
   Text('data').cSizedBox(h:10,w:10)
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
   Text('data').cAspectRatio(1.2)
   ```
1. A set of extensions on the base [Widget] class to add custom banner functionality.

   ```dart
   Widget myWidget = ...;
   Widget bannerWidget = myWidget.cBanner(
       disable: false,
       location: BannerLocation.topStart,
       message: 'Custom Banner',
       color: Colors.red
   );
   ```

## Contributers

- Nasif A ( Developer )
- Abdulla Ramees PK ( Developer )
- Fasna sherin P ( Developer )
- Sharun MP ( Developer )
- Shimna AO ( Developer )
- Nashwa K ( Developer )
- Sharafas OM ( Maintainer and Publisher )

---

![Alt](https://repobeats.axiom.co/api/embed/2101af02ba767cc668c359f4f1167731c55e3e87.svg "Activity graph")
