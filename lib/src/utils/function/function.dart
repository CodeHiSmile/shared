// ignore_for_file:avoid-dynamic
class Func0<R> {
  Func0(this.function);

  final R Function() function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func0<R> && other.function == function);
  }

  R call() => function();
}

class Func1<P0, R> {
  Func1(this.function);

  final R Function(P0) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Func1<P0, R> && other.function == function;
  }

  R call(P0 p0) => function(p0);
}

class Func2<P0, P1, R> {
  Func2(this.function);

  final R Function(P0, P1) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func2<P0, P1, R> && other.function == function);
  }

  R call(P0 p0, P1 p1) => function(p0, p1);
}

class Func3<P0, P1, P2, R> {
  Func3(this.function);

  final R Function(P0, P1, P2) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func3<P0, P1, P2, R> && other.function == function);
  }

  R call(P0 p0, P1 p1, P2 p2) => function(p0, p1, p2);
}

class Func4<P0, P1, P2, P3, R> {
  Func4(this.function);

  final R Function(P0, P1, P2, P3) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func4<P0, P1, P2, P3, R> && other.function == function);
  }

  R call(P0 p0, P1 p1, P2 p2, P3 p3) => function(p0, p1, p2, p3);
}

class Func5<P0, P1, P2, P3, P4, R> {
  Func5(this.function);

  final R Function(P0, P1, P2, P3, P4) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func5<P0, P1, P2, P3, P4, R> && other.function == function);
  }

  R call(P0 p0, P1 p1, P2 p2, P3 p3, P4 p4) => function(p0, p1, p2, p3, p4);
}

class Func6<P0, P1, P2, P3, P4, P5, R> {
  Func6(this.function);

  final R Function(P0, P1, P2, P3, P4, P5) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func6<P0, P1, P2, P3, P4, P5, R> &&
            other.function == function);
  }

  R call(P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) =>
      function(p0, p1, p2, p3, p4, p5);
}

class Func7<P0, P1, P2, P3, P4, P5, P6, R> {
  Func7(this.function);

  final R Function(P0, P1, P2, P3, P4, P5, P6) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func7<P0, P1, P2, P3, P4, P5, P6, R> &&
            other.function == function);
  }

  R call(P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6) =>
      function(p0, p1, p2, p3, p4, p5, p6);
}

class Func8<P0, P1, P2, P3, P4, P5, P6, P7, R> {
  Func8(this.function);

  final R Function(P0, P1, P2, P3, P4, P5, P6, P7) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func8<P0, P1, P2, P3, P4, P5, P6, P7, R> &&
            other.function == function);
  }

  R call(P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7) =>
      function(p0, p1, p2, p3, p4, p5, p6, p7);
}

class Func9<P0, P1, P2, P3, P4, P5, P6, P7, P8, R> {
  Func9(this.function);

  final R Function(P0, P1, P2, P3, P4, P5, P6, P7, P8) function;

  @override
  int get hashCode => function.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Func9<P0, P1, P2, P3, P4, P5, P6, P7, P8, R> &&
            other.function == function);
  }

  R call(P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5, P6 p6, P7 p7, P8 p8) =>
      function(p0, p1, p2, p3, p4, p5, p6, p7, p8);
}
