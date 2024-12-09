fun main() {
    var r: Int = 0;
    var a: Int = 5;
    var b: Int = 10;

    while (b != 0) {
        r = a%b;
        a = b;
        b = r;
    }

}