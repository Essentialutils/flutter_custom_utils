class ID {
  static const int EPOCH = 1625097600000;
  static const int MACHINE_ID_BITS = 5;
  static const int SEQUENCE_BITS = 12;

  static final int MAX_MACHINE_ID = (1 << MACHINE_ID_BITS) - 1;
  static final int MAX_SEQUENCE = (1 << SEQUENCE_BITS) - 1;

  static int lastTimestamp = -1;
  static int sequence = 0;

  final int machineId;

  ID(this.machineId) {
    if (machineId < 0 || machineId > MAX_MACHINE_ID) {
      throw Exception("Machine ID should be between 0 and $MAX_MACHINE_ID");
    }
  }

  static int waitNextMillis(int lastTimestamp) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    while (timestamp <= lastTimestamp) {
      timestamp = DateTime.now().millisecondsSinceEpoch;
    }
    return timestamp;
  }

  String getSnowflakeID() {
    int timestamp = DateTime.now().millisecondsSinceEpoch - EPOCH;

    if (timestamp < lastTimestamp) {
      throw Exception("Clock moved backwards. Rejecting request.");
    }

    if (timestamp == lastTimestamp) {
      sequence = (sequence + 1) & MAX_SEQUENCE;
      if (sequence == 0) {
        timestamp = waitNextMillis(lastTimestamp);
      }
    } else {
      sequence = 0;
    }

    lastTimestamp = timestamp;

    BigInt id = (BigInt.from(timestamp) << (MACHINE_ID_BITS + SEQUENCE_BITS)) |
        (BigInt.from(machineId) << SEQUENCE_BITS) |
        BigInt.from(sequence);

    return id.toString();
  }

  String getUniqueID([int length = 4, bool timeStamp = true]) {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    String randomStr(int length) {
      const characters =
          "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
      String randomString = "";
      for (int i = 0; i < length; i++) {
        int randomIndex =
            DateTime.now().millisecondsSinceEpoch % characters.length;
        randomString += characters[randomIndex];
      }
      return randomString;
    }

    return "${timeStamp ? timestamp.toRadixString(36) : ""}${randomStr(length)}";
  }
}
