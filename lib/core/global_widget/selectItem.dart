class EventPrice {
  static String selectedValue1 = '\$90';
  static List<String> items1 = [
    '\$90',
    '\$100',
    '\$200',
    '\$300',
    '\$400',
    '\$500',
  ];

  void onChanged(String? newValue) {
    selectedValue1 = newValue!;
  }
}

class EventType {
  static String eventType = 'Music';
  static List<String> eventType1 = [
    'Music',
    "Rock",
    "Pop",
    "Jazz",
    "Hip-Hop",
    "Classical",
    "Electronic",
    "Reggae",
    "Blues"
  ];

  void onChanged(String? newValue) {
    eventType = newValue!;
  }
}

class EventLocation {
  static String selectedValue1 = 'Florida, USA';
  static List<String> items1 = [
    'Florida, USA',
    'New York, NY',
    'San Jose, CA',
    'Philadelphia, PA',
    'Houston, TX',
    'Los Angeles, CA',
  ];

  void onChanged(String? newValue) {
    selectedValue1 = newValue!;
  }
}

class Status {
  static String selectedValue1 = 'Male';
  static List<String> items1 = [
    'Male',
    'Female',
    'Other',
  ];

  void onChanged(String? newValue) {
    selectedValue1 = newValue!;
  }
}

class CountryName {
  static String selectedValue1 = 'United States';
  static List<String> items1 = [
    'United States',
    'Afghanistan',
    'Albania',
    'Algeria',
  ];

  void onChanged(String? newValue) {
    selectedValue1 = newValue!;
  }
}
