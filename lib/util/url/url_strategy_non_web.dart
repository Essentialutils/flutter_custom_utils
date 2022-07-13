/// Sets the URL strategy of your web app to using paths instead of a leading
/// hash (`#`).
///
/// You can safely call this on all platforms, i.e. also when running on mobile
/// or desktop. In that case, it will simply be a noop.
///
/// See also:
///  * [cSetHashUrl], which will use a hash URL strategy instead.
void cSetPathUrl() {
  // Noop.
}

/// Sets the URL strategy of your web app to using a leading has (`#`) instead
/// of paths.
///
/// You can safely call this on all platforms, i.e. also when running on mobile
/// or desktop. In that case, it will simply be a noop.
///
/// See also:
///  * [cSetPathUrl], which will use a path URL strategy instead.
void cSetHashUrl() {
  // Noop.
}
