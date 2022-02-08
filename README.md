
[![](https://img.shields.io/badge/for-GridView-green?style=for-the-badge)]()
> Use `both 1 and 2` for a `responsive gridview` 
1) For responsive `grid item count` based on your static design `width`.

    ```dart
    crossAxisCount: getResCrosCountGrid(
        context: context,
        width: 180,
    ),
    ```
2) For responsive grid item `aspect ratio` based on your static design `height` and `width`.

    ```dart
    childAspectRatio: getResGridRatio(
        context: context,
        height: 165,
        width: 180,
    ),
    ```
3) For normal grid `aspect ratio` 
    > this will provide you aspect ratio whitch never barake in biger or smaller devise

    ```dart
    crossAxisCount: 2,
    childAspectRatio: getGridRatio(
        crossAxisCount: 2,
        context: context,
        height: 165,
        width: 180,
    ),
    ```
> Provide same `height` or `width` in both methods
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

***
[![](https://img.shields.io/badge/RΞPADΓΞCH-blue??style=plastic)](https://repadtech.com/)
[![](https://img.shields.io/badge/@-oms-red??style=plastic)]()
