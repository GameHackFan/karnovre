const ryokoPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 ()"],
  data:
  {
    // Chou Yama Arashi, Ippon Seoi, Kuuchuu Ippon Seoi Input ID Change (HCF)
    "112094": ["02"],

    // Chou Yama Arashi, Ippon Seoi, Kuuchuu Ippon Seoi Input ID Change (HCB)
    "112110": ["03"],

    // Kataguruma Input ID Change (DP)
    "112156": ["04"],

    // Kataguruma Input ID Change (RDP)
    "112172": ["05"],

    // Tateshihou Gatame ID Change
    // "112226": ["00"],

    // Zenten Ukemi Input ID Change (B-F)
    "112320": ["06"],



    // Animation 3E3 Hitbox Changed (Zenten Ukemi)
    // From F1F1 0909 D408 0915 0000 0000 E408 0915
    // To 0000 0000 0000 0000 0000 0000 0000 0000
    // Removed top hurtboxes, it can now go under fireballs
    "273064":
    [
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00"
    ],

    // Animation 3E4 Hitbox Changed (Zenten Ukemi)
    // From CFF4 0909 D408 0915 0000 0000 E408 0915 F808 0815 0000 0000 EDF1 0509
    // To 0000 0000 0000 0000 0000 0000 E408 0915 F808 0815 0000 0000 EDF1 0509
    // Removed top hurtboxes, it can now go under fireballs
    "273112":
    [
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "E4", "08", "09", "15",
      "F8", "08", "08", "15", "00", "00", "00", "00",
      "00", "00", "00", "00"
    ],

    // Animation 3AF Hitboxes Changed (Jump Light Kick)
    // Strikebox reduced from C50B 1212 to C807 1216
    // Increased 8 pixels backwards, it is now a better cross
    // Moved 3 pixels downwards
    "270596": ["C8", "07", "12", "16"],
    
    // Animation 3B0 Hitboxes Changed (Jump Strong Kick)
    // Strikebox increased from C717 0B24 to C717 0D27
    // Increased 2 pixels upwards, downwards and 6 pixels backwards
    "270644": ["C7", "14", "0D", "27"],

    // Animation 381 Hitboxes Changed (Close and Far Light Kick)
    // Added a grab hitbox, it is necessary to ensure the super will work
    "268392": ["D8", "00", "28", "00"],

    // Animation 385 Hitboxes Changed (Close Strong Kick)
    // Added a grab hitbox, it is necessary to ensure the super will work
    "268584": ["D8", "00", "28", "00"],

    // Animation 345 Hitboxes Changed (Far Strong Kick)
    // Added a grab hitbox, it is necessary to ensure the super will work
    "265512": ["D8", "00", "28", "00"],

    // Animation 39E Hitboxes Changed (Crouch Light Kick)
    // Added a grab hitbox, it is necessary to ensure the super will work
    "269784": ["D8", "00", "28", "00"],

    // Animation 3A0 Hitboxes Changed (Crouch Strong Kick)
    // Added a grab hitbox, it is necessary to ensure the super will work
    "269880": ["D8", "00", "28", "00"],



    // Close Light Kick Animation Behavior Changed
    // From 0000 to 0400
    // Fix grab flag so it doesn't grab Ray's grab ID
    "93212": ["04", "00"],

    // Close Strong Kick Animation Behavior Changed
    // From 0080 to 0480
    // Fix grab flag so it doesn't grab Ray's grab ID
    "93216": ["04", "80"],

    // Far Light Kick Animation Behavior Changed
    // From 0000 to 0400
    // Fix grab flag so it doesn't grab Ray's grab ID
    "93228": ["04", "00"],

    // Far Strong Kick Animation Behavior Changed
    // From 0084 to 0484
    // Fix grab flag so it doesn't grab Ray's grab ID
    "93232": ["04", "84"],

    // Crouch Light Kick Animation Behavior Changed
    // From 0000 to 0400
    // Fix grab flag so it doesn't grab Ray's grab ID
    "93244": ["04", "01"],

    // Crouch Strong Kick Animation Behavior Changed
    // From 0000 to 0400
    // Fix grab flag so it doesn't grab Ray's grab ID
    "93248": ["04", "95"],

    // Tateshihou Gatame Animation Behavior Changed
    // From 0931 820C to 0931 8230
    // Damage increased from 12 to 48
    "410532": ["09", "31", "82", "30"],

    // Zenten Ukemi Code Behavior Changed from 1A5B8 to FF250
    // Translation changes from 03E0 03E0 to 05E0 03E0
    // It now travels a longer distance
    "48002": ["0F", "00", "50", "F2", "0F", "00", "50", "F2"],

    // Uranage Code Behavior Changed from 1B0F6 to FE260
    // It calls a code that handles Tateshihou Gatame
    // In case it is not Tateshihou Gatame, it executes 1B0F6
    "47942": ["0F", "00", "60", "E2"],

    // Tomoenage Code Behavior Changed from 1B0F6 to FE260
    // It calls a code that handles Tateshihou Gatame
    // In case it is not Tateshihou Gatame, it executes 1B0F6
    "47946": ["0F", "00", "60", "E2"],

    // Tateshihou Gatame Code Behavior Changed from 1B236 to FF3E0
    // It calls a code that forces Ryoko to choke the opponent only 3 times
    // The opponent can't escape mashing
    // After it, it calls 1B236
    "47962": ["0F", "00", "E0", "F3"],



    // New Moves Behavior Code Offsets
    "48022":
    [
      // New Move 1 Light Version (FF480, 1A5B8)
      "0F", "00", "80", "F4",

      // New Move 1 Strong Version (Unused, FF480, 1A5B8)
      "0F", "00", "80", "F4",

      // New Move 2 Light Version (Unused, FF480, 1A5B8)
      "0F", "00", "80", "F4",

      // New Move 2 Strong Version (Unused, FF480, 1A5B8)
      "0F", "00", "80", "F4"
    ],

    // New Moves Animations Offsets
    "369200":
    [
      // New Move 1 Light Version (5FEB0)
      "B0", "5E",

      // New Move 1 Strong Version (Unused, 5FEB0)
      "B0", "5E",

      // New Move 2 Light Version (Unused, 5FEB0)
      "B0", "5E",

      // New Move 2 Strong Version (Unused, 5FEB0)
      "B0", "5E"
    ],

    // New Moves Behavior 1 Data
    "410592":
    [
      // New Move 1 Light Version
      "83", "12", "11", "18",
      
      // New Move 1 Strong Version (Unused)
      "83", "12", "11", "18",
      
      // New Move 2 Light Version (Unused)
      "83", "12", "11", "18",
      
      // New Move 2 Strong Version (Unused)
      "83", "12", "11", "18"
    ],

    // New Moves Behavior 2 Data
    "93364":
    [
      // New Move 1 Light Version
      "13", "82", "00", "00",

      // New Move 1 Strong Version (Unused)
      "13", "82", "00", "00",

      // New Move 2 Light Version (Unused)
      "13", "82", "00", "00",

      // New Move 2 Strong Version (Unused)
      "13", "82", "00", "00"
    ],

    // New Move 1 Light Version Animation
    "392880":
    [
      "38", "03", "02", "02", "56", "03", "12", "30",
      "38", "03", "22", "01", "38", "03", "03", "01"
    ],



    // Add Support To New Moves Inputs
    "112320":
    [
      "F9", "4E", "0F", "00", "00", "E2", "06", "7C",
      "28", "7A", "00", "61", "30", "B0", "86", "4A"
    ],

    // New Move 1 Interpretation
    // Disables Default Tateshihou Gatame Interpretation
    "112208":
    [
      "5A", "60", "68", "0C", "05", "00", "D0", "00",
      "6C", "62", "08", "7C", "00", "61", "4A", "B0",
      "86", "4A", "62", "66", "3C", "3E", "A8", "00",
      "25", "7C", "B9", "4E", "0F", "00", "50", "F4",
      "40", "DC", "D8", "60"
    ],

    // New Tateshihou Gatame Interpretation
    "1040896":
    [
      "28", "0C", "7F", "00", "47", "01", "36", "62",
      "28", "4A", "FF", "01", "30", "66", "0E", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "0C", "67", "0F", "7C", "B9", "4E", "01", "00",
      "A8", "66", "86", "4A", "18", "66", "7C", "11",
      "5A", "00", "4F", "01", "28", "14", "B1", "00",   // 5A was 2A (30 default grab range + 2A)
      "71", "4E", "B9", "4E", "01", "00", "C8", "63",
      "F9", "4E", "01", "00", "1C", "B7", "F9", "4E",
      "01", "00", "52", "B6"
    ],

    // Tateshihou Gatame Code Behavior
    "1040992":
    [
      "00", "61", "DE", "10", "28", "30", "D0", "00",
      "7C", "B0", "98", "00", "04", "66", "68", "42",
      "E0", "01", "7C", "B0", "95", "00", "16", "66",
      "28", "4A", "E0", "01", "10", "67", "68", "0C",
      "02", "00", "20", "01", "08", "62", "B9", "4E",
      "01", "00", "74", "B6", "42", "60", "28", "08",
      "00", "00", "BF", "00", "3A", "66", "28", "10",
      "4F", "01", "2E", "67", "3C", "B0", "5A", "00",   // 5A was 2A
      "22", "66", "7C", "31", "95", "00", "D0", "00",
      "7C", "11", "1A", "00", "2D", "01", "7C", "11",
      "01", "00", "FF", "01", "7C", "11", "01", "00",
      "E0", "01", "00", "61", "A4", "10", "F9", "4E",
      "01", "00", "1E", "AC", "F9", "4E", "01", "00",
      "1C", "B1", "F9", "4E", "01", "00", "DE", "B1",
      "F9", "4E", "01", "00", "A4", "AC"
    ]
  }
}