const mizoguchiPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  data:
  {
    // Tiger Bazooka Input ID Change
    // "113836": ["00"],

    // Koryuusai Input ID Change (RDP)
    "113912": ["05"],

    // Kuuchuu Renzoku Keri ID Change (QCF)
    "113998": ["00"],



    // Throw Strong Kick vs Zazie Bug Fix
    // From F206 to F208
    // Translation distance changed by 2 pixels to fix throwing Zazie as P2
    "399786": ["00", "02"],

    // Close Strong Kick Active Animation Chunk Behavior Changed
    // From 0802 to 0002
    // 1st hit is not cancelable anymore
    "379730": ["00", "02"],

    // Tiger Bazooka Startup Animation Chunk Behavior Changed
    // From 020C to 020B
    // Startup chunk reduced from 12 to 11 (Full was 21, now it is 20)
    "380094": ["02", "0B"],

    // Tiger Bazooka Recovery Animation Chunk Behavior Changed
    // From 021A to 0219
    // Recovery chunk reduced from 26 to 25 (Full was 30, now it is 29)
    "380106": ["02", "19"],

    // Kuuchuu Renzoku Keri Startup Animation Chunk Behavior Changed
    // From 1002 to 1003
    // Startup chunk increased from 2 to 3 (Full was 8, now it is 10)
    "384198": ["10", "03"],

    // Kuuchuu Renzoku Keri Startup Animation Chunk Behavior Changed
    // From 0002 to 0003
    // Startup chunk increased from 2 to 3 (Full was 8, now it is 10)
    "384202": ["00", "03"],

    // Kuuchuu Renzoku Keri Animation Behavior Changed
    // From 8357 1130 to 8367 1130
    // It is now an overhead
    "411320": ["83", "67", "11", "30"],

    // Koryuusai Light Version Recovery Animation Chunk Behavior Changed
    // From 3203 to 3207
    // Recovery chunk increased from 03 to 07 (Full was 11, now it is 15)
    "380142": ["32", "07"],

    // Koryuusai Strong Version Active Animation Chunk Behavior Changed
    // From 5F06 to 5E06
    // Replaced the animation with hurtboxes with an animation without hurtboxes
    "380172": ["5E", "06"],

    // Koryuusai Strong Version Active Animation Chunk Behavior Changed
    // From 1002 to 1004
    // Active chunk increased from 02 to 04 (Full was 3, now it is 5)
    "380174": ["10", "04"],

    // Koryuusai Strong Version Animation Behavior Changed
    // From 83D2 1118 to 8312 1118
    // Pushback reduced to help all hits to connect better
    "411296": ["83", "12", "11", "18"],

    // Tsuutensai Startup Animation Chunk Behavior Changed
    // From 1B0B 8002 1C0B 4002 to 1B0B 9002 1C0B 5002
    // The first 4 frames now also moves forward.
    "390732": ["1B", "0B", "90", "02", "1C", "0B", "50", "02"],

    // Tsuutensai Active Animation Chunk Behavior Changed
    // From 1002 to 100E
    // Active chunk increased, it now travels forward for more time
    "390758": ["10", "0E"],

    // Tsuutensai Animation Behavior Changed
    // From 8112 9312 to 8112 9320
    // Damage increased from 18 to 32
    "411332": ["81", "12", "93", "20"],

    // Tsuutensai Animation Behavior Changed
    // From 8352 1118 to 8352 112A
    // Damage increased from 24 to 42
    "411336": ["83", "52", "11", "30"],

    // Tsuutensai Animation Behavior Changed
    // From 8132 0D08 to 8132 0D01
    // Damage decreased from 8 to 1
    "411340": ["81", "32", "0D", "01"],

    // Tsuutensai Code Behavior Changed from 1A494 to FF2E0
    // It activates the DM executed flag and jumps to 1A494
    "48762": ["0F", "00", "E0", "F2"],

    // Gottsui Tiger Bazooka Code Behavior Changed From 1A982 to FF320
    // It activates the DM executed flag and jumps to 1A982
    "48758": ["0F", "00", "20", "F3"],



    // Disables Default Gottsui Tiger Bazooka Interpretation
    "113852":
    [
      "71", "4E", "71", "4E", "71", "4E", "71", "4E",
      "71", "4E", "71", "4E"
    ],

    // Disables Default Gottsui Tiger Bazooka Interpretation
    "113928":
    [
      "71", "4E", "71", "4E", "71", "4E", "71", "4E",
      "71", "4E", "71", "4E"
    ],

    // Add Support To New Moves Inputs
    "113836":
    [
      "F9", "4E", "0F", "00", "00", "E6", "00", "7C",
      "00", "61", "F2", "A9", "86", "4A"
    ],

    // New Gottsui Tiger Bazooka Interpretation
    "1041920":
    [
      "28", "0C", "7F", "00", "47", "01", "18", "62",
      "28", "4A", "FF", "01", "12", "66", "0C", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "06", "66", "F9", "4E", "01", "00", "EC", "BC",
      "F9", "4E", "0F", "00", "80", "E6"
    ],

    // New Tsuutensai Interpretation
    "1042048":
    [
      "28", "0C", "7F", "00", "47", "01", "26", "62",
      "28", "4A", "FF", "01", "20", "66", "0D", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "14", "66", "7C", "31", "00", "08", "F0", "01",
      "A8", "42", "F2", "01", "68", "42", "FC", "01",
      "F9", "4E", "01", "00", "38", "BD", "F9", "4E",
      "01", "00", "B2", "BC"
    ]
  }
}