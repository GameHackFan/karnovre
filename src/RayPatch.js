const rayPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Dynamite Rush)"],
  data:
  {
    // Dynamite Tackle Input ID Change (F-F)
    "111406": ["08"],

    // Wheel Kick Input ID Change (RDP)
    // "111516": ["05"],



    // Animation 1F3 Hitboxes Changed, Added a Foot Hurtbox (Wheel Kick)
    // "249264": ["DC", "E8", "0E", "0E"],

    // Animation 28C Hitboxes Changed, Added a Foot Hurtbox (Wheel Kick)
    // "256608": ["DC", "E8", "0E", "0E"],

    // Animation 28D Hitboxes Changed, Added a Foot Hurtbox (Wheel Kick)
    // "256656": ["E6", "04", "14", "10"],

    // New Animation B75 Identical to 291 But Without The Strikebox (New Move 1)
    "366080":
    [
      "22", "01", "F4", "0B", "E6", "00", "1A", "0E",
      "C0", "0E", "09", "11", "D5", "06", "0A", "19",
      "DB", "03", "10", "1C", "F7", "FF", "09", "18", 
      "00", "00", "00", "00", "00", "00", "00", "00",
      "D1", "0B", "08", "08", "00", "00", "00", "00",
      "00", "00", "00", "00", "24", "01", "00", "00"
    ],



    // Dynamite Tackle Light Version Animation Behavior Changed
    // From 0354 1F18 to 0354 1F1E
    // Damage increased from 24 to 30
    // "410140": ["03", "54", "1F", "1E"],

    // Dynamite Tackle Strong Version Animation Behavior Changed
    // From 0354 1F18 to 0354 1F1E
    // Damage increased from 24 to 30
    // "410144": ["03", "54", "1F", "1E"],

    // Wheel Kick Light Version Landing Recovery Animation Chunk Behavior Changed
    // From 2202 to 2203, Recovery chunk increased from 2 to 3 (Full was 6, now it is 10)
    "391102": ["22", "03"],
    
    // Wheel Kick Light Version Landing Recovery Animation Chunk Behavior Changed
    // From 0202 to 0203
    // Recovery chunk increased from 2 to 3 (Full was 6, now it is 10)
    "391106": ["02", "03"],

    // Wheel Kick Light Version Landing Recovery Animation Chunk Behavior Changed
    // From 0302 to 0304
    // Recovery chunk increased from 2 to 4 (Full was 6, now it is 10)
    "391110": ["03", "04"],

    // Air Wheel Kick Light Version Landing Recovery Animation Chunk Behavior Changed
    // From 2202 to 2203
    // Recovery chunk increased from 2 to 3 (Full was 6, now it is 10)
    "391154": ["22", "03"],
    
    // Air Wheel Kick LK Landing Recovery Animation Chunk Behavior Changed
    // From 0202 to 0203, Recovery chunk increased from 2 to 3 (Full was 6, now it is 10)
    "391158": ["02", "03"],

    // Air Wheel Kick Light Version Landing Recovery Animation Chunk Behavior Changed
    // From 0302 to 0304
    // Recovery chunk increased from 2 to 4 (Full was 6, now it is 10)
    "391162": ["03", "04"],

    // Thunder Dynamite Tackle Code Behavior Changed
    // From 8352 5F18 to 8352 5F1A
    // Damage increased from 24 to 26
    "410164": ["83", "52", "5F", "1A"],

    // Thunder Dynamite Tackle Code Behavior Changed From 1A49A to FF2E0
    // It activates the DM executed flag and jumps to 1A49A
    "47594": ["0F", "00", "E0", "F2", "0F", "00", "E0", "F2"],



    // New Moves Behavior Code Offsets
    "47614":
    [
      // New Move 1 Light Version (1A49A)
      "01", "00", "9A", "A4",

      // New Move 1 Strong Version (Unused, 1A49A)
      "01", "00", "9A", "A4",

      // New Move 2 Light Version (Unused, 1A49A)
      "01", "00", "9A", "A4",

      // New Move 2 Strong Version (Unused, 1A49A)
      "01", "00", "9A", "A4"
    ],

    // New Moves Animations Offsets
    "368804":
    [
      // New Move 1 Light Version (5FEC0)
      "C0", "5E",

      // New Move 1 Strong Version (Unused, 5FEC0)
      "C0", "5E",

      // New Move 2 Light Version (Unused, 5FEC0)
      "C0", "5E",

      // New Move 2 Strong Version (Unused, 5FEC0)
      "C0", "5E"
    ],

    // New Moves Behavior 1 Data
    "410184":
    [
      // New Move 1 Light Version
      "03", "54", "1F", "01",
      
      // New Move 1 Strong Version (Unused)
      "03", "54", "1F", "01",
      
      // New Move 2 Light Version (Unused)
      "03", "54", "1F", "01",
      
      // New Move 2 Strong Version (Unused)
      "03", "54", "1F", "01"
    ],

    // New Moves Behavior 2 Data
    "92956":
    [
      // New Move 1 Light Version
      "5F", "82", "64", "32",

      // New Move 1 Strong Version (Unused)
      "5F", "82", "64", "32",

      // New Move 2 Light Version (Unused)
      "5F", "82", "64", "32",

      // New Move 2 Strong Version (Unused)
      "5F", "82", "64", "32"
    ],

    // New Move 1 Light Version Animation
    "392896":
    [
      "F1", "01", "80", "04", "8E", "02", "00", "04",
      "90", "02", "10", "02", "75", "0B", "52", "06",
      "90", "02", "32", "06", "05", "02", "03", "02"
    ],



    // Add Support To New Moves Inputs (Punch Button)
    "111358":
    [
      "F9", "4E", "0F", "00", "00", "E0", "00", "7C",
      "00", "61", "A0", "B3", "86", "4A"
    ],

    // Add Support To New Moves Inputs (Kick Button)
    "111516":
    [
      "F9", "4E", "0F", "00", "40", "E0", "05", "7C",
      "00", "61", "02", "B3", "86", "4A"
    ],
    
    // Disables Default Thunder Dynamite Tackle Interpretation
    "111422":
    [
      "71", "4E", "71", "4E", "71", "4E", "71", "4E",
      "71", "4E", "71", "4E", "71", "4E", "71", "4E",
      "71", "4E"
    ],
    
    // New Thunder Dynamite Tackle Interpretation
    "1040384":
    [
      "28", "0C", "7F", "00", "47", "01", "18", "62",
      "28", "4A", "FF", "01", "12", "66", "0D", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "06", "66", "F9", "4E", "01", "00", "70", "B3",
      "F9", "4E", "01", "00", "04", "B3"
    ],

    // New Move 1 Interpretation
    "1040448":
    [
      "28", "08", "03", "00", "BF", "00", "1E", "66",
      "08", "7C", "B9", "4E", "01", "00", "A8", "66",
      "86", "4A", "12", "66", "3C", "3E", "42", "00",
      "04", "7C", "00", "61", "F4", "13", "40", "DC",
      "F9", "4E", "01", "00", "DA", "B3", "F9", "4E",
      "01", "00", "A2", "B3"
    ]
  }
}