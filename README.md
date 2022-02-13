
[![](https://img.shields.io/badge/for-MediaQuery-green?style=for-the-badge)]()

1) Get the MediaQuery size

    ```dart
    getSize(context)
    ```
---
[![](https://img.shields.io/badge/for-GridView-green?style=for-the-badge)]()
> Make a `responsive gridview` by using both `1 and 2` 
1) Based on your static design's `width`, calculate the responsive `grid item count`.

    ```dart
    crossAxisCount: getResCrosCountGrid(
        context: context,
        width: 180,
    ),
    ```
2) For responsive grid item `aspect ratio`, it should be derived from your static design based on `height` and `width`.

    ```dart
    childAspectRatio: getResGridRatio(
        context: context,
        height: 165,
        width: 180,
    ),
    ```
3) For normal grid `aspect ratio` 
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

[![](https://img.shields.io/badge/for-color-green?style=for-the-badge)]()

1)  Get color from hash code

    ```dart
    CHColor.fromHex('#fffff')
    ```
2) Get hash code from color

    ```dart
    Color.fromRGBO(250, 250, 250, 0.1).toHex()
    ```
---
[![](https://img.shields.io/badge/for-widgget-green?style=for-the-badge)]()

1) All `(padding/margin)`

    ```dart
    @override
    Widget build(BuildContext context) {
        return Container(
        child: Text('data').cPadAll(10) // cMargAll 
        );
    }
    ```
2) Only `(padding/margin)`

    ```dart
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text('data').cPadOnly(
                l: 10,
                r: 10,
                t: 10,
                b: 10,
            ), // cMargOnly
        );
    }
    ```
3) Symmetric `(padding/margin)`

    ```dart
    @override
    Widget build(BuildContext context) {
        return Container(
            child: Text('data').cPadSymmetric(
                h: 10,
                v: 10,
            ), // cMargSymmetric
        );
    }
    ```
4) Zero `(padding/margin)`

    ```dart
    @override
    Widget build(BuildContext context) {
        return Container(
        child: Text('data').cPadZero, // cMargZero
        );
    }
    ```
5) Allows you to insert widgets inside a `CustomScrollView`
    ```dart
    Text('data').cSliverToBox
    ```
6) Allows you to handle `Visibility` and `Opacity`
    ```dart
    Text('data').cVisible(true)

    Text('data').cOpacity(0.3)
    ```
***
[![](https://img.shields.io/badge/From-RΞPADΓΞCH-blue??style=plastic)](https://repadtech.com/)
[![](https://img.shields.io/badge/@-oms-red??style=plastic)]() [![](https://img.shields.io/badge/@-dc-red??style=plastic)]()



