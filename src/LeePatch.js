const leePatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Long Ti), New Move 2 (Chou Shinchuu Tetsuzankou)"],
  data:
  {
    // Chou Shinchuu, Tetsuzankou Input ID Change (F-F)
    "113510": ["08"],

    // Zesshouhohou, Super Zesshouhohou Input ID Change (QCF)
    "113562": ["00"],

    // Mouko Kouhazan Input ID Change (2x QCB)
    "113654": ["0D"],

    // Senkyuutai Input ID Change
    // "113692": ["04"],



    // Animation 871 Hitboxes Changed (Far Strong Punch)
    // Strikebox reduced from C213 1640 to DCE8 163C
    // Reduced 4 pixels and moved backward 5 pixels 
    // "293204": ["C2", "0E", "16", "3C"],

    // Animation 856 Hitboxes Changed (Crouch Strong Punch)
    // Strikebox reduced from D030 0C29 to D02C 0C24
    // Reduced 5 pixels and moved backward 4 pixels 
    // "293924": ["D0", "2C", "0C", "24"],

    // Super Zesshouhohou Strong Version Recovery Animation Chunk Behavior Changed
    // From 0202 to 0204
    // Recovery Chunk increased from 2 to 4 (Full was 12, now it is 14)
    "388770": ["02", "04"],

    // Super Zesshouhohou Code Behavior Changed from 1A5B8 to FF2B0
    // Translation changes from 1000 1000 to 0B00 0B00 for the strong version only.
    // Strong version now travels a shorter distance.
    "48526": ["0F", "00", "B0", "F2"],

    // Mouko Kouhazan Code Behavior Changed From 1A982 to FF320
    // It activates the DM executed flag and jumps to 1A982
    "48542": ["0F", "00", "20", "F3"],



    // New Moves Behavior Code Offsets
    "48566":
    [
      // New Move 2 Light Version (FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 2 Strong Version (Unused, FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 1 Light Version (FF000, 1A49A)
      "0F", "00", "D0", "F4",

      // New Move 1 Strong Version (Unused, FF000, 1A49A)
      "0F", "00", "D0", "F4"
    ],

    // New Moves Animations Offsets
    "369760":
    [
      // New Move 2 Light Version (5FCD0)
      "D0", "5C",

      // New Move 2 Strong Version (Unused, 5FCD0)
      "D0", "5C",

      // New Move 1 Light Version (5FCD0)
      "E0", "5E",

      // New Move 1 Strong Version (Unused, 5FCD0)
      "E0", "5E"
    ],

    // New Moves Behavior 1 Data
    "411136":
    [
      // New Move 2 Light Version
      "83", "12", "11", "1F",
      
      // New Move 2 Strong Version (Unused)
      "83", "12", "11", "1F",
      
      // New Move 1 Light Version
      "83", "62", "11", "10",
      
      // New Move 1 Strong Version (Unused)
      "83", "62", "11", "10"
    ],

    // New Moves Behavior 2 Data
    "93908":
    [
      // New Move 2 Light Version
      "A5", "82", "00", "00",

      // New Move 2 Strong Version (Unused)
      "A5", "82", "00", "00",

      // New Move 1 Light Version
      "9D", "12", "00", "00",

      // New Move 1 Strong Version (Unused)
      "9D", "12", "00", "00"
    ],

    // New Move 1 Light Version Animation
    "392928":
    [
      "55", "05", "00", "02", "A4", "05", "10", "06",
      "A5", "05", "90", "60", "37", "05", "22", "01",
      "37", "05", "03", "01",
    ],

    // New Move 2 Light Version Animation
    "392400":
    [
      "C5", "05", "10", "02", "C6", "05", "10", "04",
      "C7", "05", "90", "06", "C8", "05", "10", "03",
      "75", "05", "00", "03",

                              "7B", "05", "10", "02",
      "C9", "05", "90", "04", "79", "05", "10", "08",
      "C9", "05", "10", "04", "79", "05", "10", "08",
      "C9", "05", "10", "04", "79", "05", "12", "08",
      "7B", "05", "32", "04", "77", "05", "32", "06",
      "34", "05", "03", "06", "FF", "FF", "FF", "FF"
    ],



    // Removes Air Execution Restriction (Kick Button Move)
    "113464":
    [
      "07", "10", "7C", "C0", "03", "00", "00", "67",
      "D2", "00", "28", "08", "03", "00", "BF", "00",
      "00", "66", "C8", "00"
    ],

    // Add Support To New Moves Inputs (Punch Button)
    // Remove Mouko Kouhazan 2 Punch Restriction
    "113642":
    [
      "F9", "4E", "0F", "00", "70", "E5", "71", "4E",
      "71", "4E", "71", "4E"
    ],

    // Add Support To New Moves Inputs (Kick Button)
    "113692":
    [
      "F9", "4E", "0F", "00", "00", "E5", "04", "7C",
      "00", "61", "82", "AA", "86", "4A"
    ],

    // Handles If Air Or Ground Move Should Be Interpreted
    "1041664":
    [
      "28", "08", "03", "00", "BF", "00", "06", "66",
      "F9", "4E", "0F", "00", "A0", "E5", "F9", "4E",
      "0F", "00", "30", "E5"
    ],

    // New Move 1 Interpretation
    "1041712":
    [
      "01", "7C", "B9", "4E", "01", "00", "A8", "66",
      "86", "4A", "12", "66", "3C", "3E", "32", "01",
      "25", "7C", "00", "61", "0C", "0F", "40", "DC",
      "F9", "4E", "01", "00", "50", "BC", "F9", "4E",
      "01", "00", "82", "BC"
    ],

    // Adds Super Restriction For Mouko Kouhazan
    "1041776":
    [
      "28", "0C", "7F", "00", "47", "01", "0C", "62",
      "28", "4A", "FF", "01", "06", "66", "F9", "4E",
      "01", "00", "F6", "BB", "F9", "4E", "01", "00",
      "12", "BC"
    ],

    // New Move 2 Interpretation
    "1041824":
    [
      "28", "0C", "7F", "00", "47", "01", "32", "62",
      "28", "4A", "FF", "01", "2C", "66", "0D", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "20", "66", "3C", "3E", "30", "01", "36", "7C",
      "7C", "31", "00", "06", "F0", "01", "7C", "31",
      "05", "A0", "F2", "01", "68", "42", "F4", "01",
      "68", "42", "FC", "01", "F9", "4E", "01", "00",
      "50", "BC", "F9", "4E", "01", "00", "22", "BC"      
    ]
  }
}