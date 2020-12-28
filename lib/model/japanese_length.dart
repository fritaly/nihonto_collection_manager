class JapaneseLength {

  final int shaku, sun, bu, rin;

  JapaneseLength(this.shaku, this.sun, this.bu, this.rin) {
  }

  String toText() {
    var list = [];

    if (shaku > 0) {
      list.add("${shaku} shaku");
    }
    if (sun > 0) {
      list.add("${sun} sun");
    }
    if (bu > 0) {
      list.add("${bu} bu");
    }
    if (rin > 0) {
      list.add("${rin} rin");
    }

    return list.join(' ');
  }
}