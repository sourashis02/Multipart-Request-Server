class UplaodFile {
  UplaodFile({required this.size, required this.name, required this.path});
  final String name;
  final int size;
  final String path;
  String getShowableSize() {
    String toShow;
    if ((size / (1024 * 1024)) > 1) {
      // If the size is greater than
      toShow = (size ~/ (1024 * 1024)).toString() + " MB";
    } else if (size / 1024 > 1) {
      toShow = (size ~/ 1024).toString() + " KB";
    } else {
      toShow = size.toString() + " B";
    }
    return toShow;
  }
}
