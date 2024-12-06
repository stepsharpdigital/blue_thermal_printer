abstract class PrinterType {
  String get type;

  void execute();

  Map<String, dynamic> toMap();

  PrinterType copyWith();
}

typedef PrinterTypeFactory = PrinterType Function(Map<String, dynamic>? data);

class PrinterTypeRegistry {
  static final Map<String, PrinterTypeFactory> _registry = {};
  static Map<String, PrinterTypeFactory> get registry => _registry;

  static void register(String type, PrinterTypeFactory factory) {
    _registry[type] = factory;
  }

  static PrinterType? getPrintType(String type, [Map<String, dynamic>? data]) {
    final factory = _registry[type];
    if (factory != null) {
      return factory(data);
    }
    return null;
  }
}
