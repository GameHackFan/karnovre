const marstoriusPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Triple Dash Lariat)"],
  data:
  {
    // Double German Input ID Change (HCF)
    "114686": ["02"],

    // Double German Input ID Change (HCB)
    "114702": ["03"],

    // Drill Power Slam Input ID Change (DP)
    "114738": ["04"],

    // Drill Power Slam Input ID Change (RDP)
    "114754": ["05"],

    // Dash Lariat Input ID Change (B-F)
    "114782": ["06"],

    // Dash Lariat Charge Duration Change
    "114784": ["28"],

    // Moonsault Press Input ID Change (D-U)
    "114836": ["07"],

    // Kneel Kick Input ID Change (B-F)
    // "114900": ["06"],

    // Kneel Kick Charge Duration Change
    // "114902": ["28"],

    // Flying Knee Drop Input ID Change (D-U)
    "114954": ["07"],



    // Animation A86 Hitboxes Changed (Kneel Kick)
    // Moved lower hurtbox to top and changed it to let him more exposed.
    "354616":
    [
      "00", "00", "00", "00", "B6", "02", "0E", "17",
      "90", "1C", "18", "10", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "99", "1A", "23", "17"
    ],

    // Animation A87 Hitboxes Changed (Kneel Kick)
    // Moved lower hurtbox to top and changed it to let him more exposed.
    "354664":
    [
      "00", "00", "00", "00", "B6", "02", "0E", "17",
      "96", "28", "12", "16", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "AA", "2A", "26", "18",
    ],

    // New Animation B6D Identical to A79 But Without The Throwbox (New Move 1)
    "365696":
    [
      "C0", "17", "01", "08", "D9", "00", "27", "11",
      "9C", "0C", "08", "0C", "B2", "04", "10", "19",
      "D2", "04", "0D", "19", "F1", "04", "0F", "19", 
      "00", "00", "00", "00", "00", "00", "00", "00", 
      "F1", "15", "0F", "08", "00", "00", "00", "00",
      "00", "00", "00", "00", "C4", "17", "00", "00"
    ],


    
    // Kneel Kick All Versions Recovery Animation Chunk Behavior Changed
    // From 0302 to 0306
    // Recovery chunk increased from 2 to 6 (Full was 21-22, now it is 25-26)
    "388234": ["03", "06"],

    // Drill Power Slam Animation Behavior Changed From 0138 7878 to 0138 7848
    // Damage decreased from 120 to 72.
    "411736": ["01", "38", "78", "48"],

    // Enzui Giri Code Behavior Changed from 1A5B8 to FF240
    // Translation changed from 0100 0100 to 0400 0400.
    // It now travels a longer distance, moves faster forward, to better escape fireballs.
    "49102": ["0F", "00", "40", "F2"],

    // Moonsault Press Code Behavior Changed from 1A5B8 to FF240
    // Light version translation speed changed from 0200 0200 to 0300 0300.
    // Strong version translation speed changed from 0200 0200 to 0400 0400.
    // It now travels a longer distance and moves faster.
    "49114": ["0F", "00", "80", "E8"],



    // New Moves Behavior Code Offsets
    "49182":
    [
      // New Move 1 Light Version (FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 1 Strong Version (Unused, FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 2 Light Version (Unused, FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 2 Strong Version (Unused, FF000, 1A49A)
      "0F", "00", "00", "F0"
    ],

    // New Moves Animations Offsets
    "370356":
    [
      // New Move 1 Light Version (5FE00)
      "00", "5E",

      // New Move 1 Strong Version (Unused, 5FE00)
      "00", "5E",

      // New Move 2 Light Version (Unused, 5FE00)
      "00", "5E",

      // New Move 2 Strong Version (Unused, 5FE00)
      "00", "5E"
    ],

    // New Moves Behavior 1 Data
    "411752":
    [
      // New Move 1 Light Version
      "83", "12", "11", "27",
      
      // New Move 1 Strong Version (Unused)
      "83", "12", "11", "27",
      
      // New Move 2 Light Version (Unused)
      "83", "12", "11", "27",
      
      // New Move 2 Strong Version (Unused)
      "83", "12", "11", "27"
    ],

    // New Moves Behavior 2 Data
    "94524":
    [
      // New Move 1 Light Version
      "71", "82", "00", "00",

      // New Move 1 Strong Version (Unused)
      "71", "82", "00", "00",

      // New Move 2 Light Version (Unused)
      "71", "82", "00", "00",

      // New Move 2 Strong Version (Unused)
      "71", "82", "00", "00",
    ],

    // New Move 1 Light Version Animation
    "392704":
    [
      "6D", "0B", "10", "06", "7A", "0A", "90", "06",
      "7B", "0A", "10", "04", "7C", "0A", "10", "03",
      "7D", "0A", "00", "03", "35", "0A", "00", "03",

      "6D", "0B", "10", "03", "7A", "0A", "90", "03",
      "7B", "0A", "10", "04", "7C", "0A", "10", "03",
      "7D", "0A", "00", "03", "35", "0A", "00", "03",

      "6D", "0B", "10", "03", "7A", "0A", "90", "03",
      "7B", "0A", "32", "04", "7C", "0A", "32", "06",
      "7D", "0A", "02", "06", "35", "0A", "02", "06",
      "E3", "09", "03", "02"
    ],



    // Add Support To New Moves Inputs
    "114900":
    [
      "F9", "4E", "0F", "00", "00", "E8", "01", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "24", "66"
    ],

    // New Move 1 Interpretation
    "1042432":
    [
      "28", "0C", "7F", "00", "47", "01", "3A", "62",
      "28", "4A", "FF", "01", "34", "66", "71", "4E",
      "0C", "7C", "B9", "4E", "01", "00", "A8", "66",
      "86", "4A", "26", "66", "71", "4E", "71", "4E",
      "71", "4E", "71", "4E", "71", "4E", "71", "4E",
      "3C", "3E", "CA", "01", "36", "7C", "7C", "31",
      "00", "08", "F0", "01", "A8", "42", "F2", "01",
      "68", "42", "FC", "01", "F9", "4E", "01", "00",
      "9A", "C1", "F9", "4E", "01", "00", "DA", "C0"
    ],

    // Changes Moonsault Press Translation Speed
    "1042560":
    [
      "68", "4A", "20", "01", "1A", "66", "68", "0C",
      "00", "08", "38", "01", "0A", "66", "7C", "21",
      "00", "03", "00", "03", "30", "01", "08", "60",
      "7C", "21", "00", "04", "00", "04", "30", "01",
      "F9", "4E", "01", "00", "B8", "A5"
    ]
  }
}