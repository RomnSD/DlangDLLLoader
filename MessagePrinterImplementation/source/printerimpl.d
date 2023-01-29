module printerimpl;

import std.stdio : writeln;
import printer   : MessagePrinter;

class Printer : MessagePrinter {
    override void print(string msg) {
        writeln(msg);
    }
}

// Avoid name mangling
extern (C) {
    export MessagePrinter createMessagePrinter() {
        return new Printer();
    }
}

void main() {
    // If this method is missing, a bunch of errors will occur  
}