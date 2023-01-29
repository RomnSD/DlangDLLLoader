import std.stdio : stderr, writeln;
import core.sys.windows.winbase : LoadLibrary, FreeLibrary, GetProcAddress;
import printer : MessagePrinter;

alias PRINTER_PROVIDER = MessagePrinter function();

void main() {
	void* library = LoadLibrary("./MessagePrinterImplementation/messageprinterimplementation.dll");

	if (library is null) {
		stderr.writeln("library was not found!");
		return;
	}

	PRINTER_PROVIDER provider = cast(PRINTER_PROVIDER)GetProcAddress(library, "createMessagePrinter");

	if (provider is null) {
		stderr.writeln("createMessagePrinter was not found!");
		return;
	}

	MessagePrinter printer = provider();
	printer.print("Hello world!");

	FreeLibrary(library);
}
