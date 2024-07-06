const matlokPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Walkover Kick), New Move 2 (Loop Walkover Kick)"],
  data:
  {
    // Spinning Wave Input ID Change (B-F)
    // "112550": ["06"],

    // Road Hurricane, Loop Hurricane Input ID Change (D-U)
    "112612": ["07"],
    
    // Overhead Kick Input ID Change (B-F)
    "112686": ["06"],



    // Animation 459 Hitboxes Changed (Crouch Strong Punch)
    // Removed head hurtbox
    // Changed top hurtbox, reduced 4 pixels upwards
    // Changed weakspot hurtbox, reduced 19 pixels upwards, increased 1 pixel downwards
    "278720":
    [
      "0B", "06", "06", "03", "E6", "00", "1A", "0E",
      "00", "00", "00", "00", "B2", "1B", "09", "10",
      "00", "00", "00", "00", "CC", "0F", "0E", "10",
      "EF", "03", "11", "11", "00", "00", "00", "00",
      "AD", "23", "04", "08", "C2", "1E", "1B", "19",
      "00", "00", "00", "00", "0F", "06", "00", "00"
    ],

    // Animation 461 Hitboxes Changed (Crouch Strong Kick)
    // Strikebox increased from E93C 171E to E63E 1A20 
    // Increased 4 pixels forward and 6 pixels upwards
    "279140": ["E6", "3E", "1A", "20"],

    // Animation 497 Hitboxes Changed (Dancing Head Press)
    // Strikebox increased from EC00 0F0F to EE00 1210 
    // Increased 5 pixels downwards, 1 upwards, 1 to the left and 1 to the right.
    "281732": ["EE", "00", "12", "10"],



    // Far Strong Punch Startup Animation Chunk Behavior Changed
    // From 0002 to 0001
    // Startup Chunk reduced from 2 to 1 (Full was 12, now it is 8)
    "376470": ["00", "01"],

    // Far Strong Punch Startup Animation Chunk Behavior Changed
    // From 0002 to 0001
    // Startup Chunk reduced from 2 to 1 (Full was 12, now it is 8)
    "376474": ["00", "01"],

    // Far Strong Punch Startup Animation Chunk Behavior Changed
    // From 0006 to 0004
    // Startup Chunk reduced from 6 to 4 (Full was 12, now it is 8)
    "376482": ["00", "04"],

    // Crouch Strong Punch Active Animation Chunk Behavior Changed
    // From 8A01 to 8A02
    // 1st active Chunk increased from 1 to 2 (Full was 12, and it is still 12)
    "376562": ["8A", "02"],

    // Crouch Strong Punch Active Animation Chunk Behavior Changed
    // From 0A03 to 0A02
    // 2nd active Chunk decreased from 3 to 2 (Full was 12, and it is still 12)
    "376566": ["0A", "02"],

    // Dancing Head Press Animation Behavior Changed
    // From FF80 to FFE0
    // It causes less impulse backwards.
    "105038": ["E0", "FF", "E0", "FF"],

    // Dancing Head Press Animation Behavior Changed
    // From 0D00 to 0800
    // It causes less impulse upwards.
    "105046": ["00", "08"],

    // Dancing Head Press Light Kick Code Behavior Changed From 1A5B8 to FE3E0
    // It applies extra translation if the player is holding left or right.
    "48170": ["0F", "00", "E0", "E3"],

    // Dancing Head Press Strong Kick Animation Behavior Changed
    // From 0022 0510 to 0222 0514
    // It causes knockdown and the damage was increased from 16 to 20.
    "410744": ["02", "22", "05", "14"],

    // Dancing Head Press Strong Kick Code Behavior Changed From 1A5B8 to FE3E0
    // It applies extra translation if the player is holding left or right.
    "48178": ["0F", "00", "E0", "E3"],

    // Road Hurricane Strong Kick Animation Behavior Changed
    // From 03D2 1118 to 0312 1118
    // It pushes the opponent less when it hits.
    "410716": ["03", "12", "11", "18"],

    // Road Hurricane Strong Kick Animation Behavior Changed
    // From 0B00 0B00 to 0980 0980
    // It causes less impulse upwards.
    "104946": ["80", "09", "80", "09"],

    // Road Hurricane Strong Kick Active Chuck Duration
    // From 0207 to 0204
    // Reduced 3 frames to better fit the less impulse change.
    "390442": ["02", "04"],

    // Road Hurricane Strong Kick Active Animation Chunk Behavior Changed
    // From 8001 to 8201, it now causes a knockdown (2nd hit)
    "390418": ["82", "01"],

    // Overhead Kick Light Kick Recovery Animation Chunk Behavior Changed
    // From 2204 to 2203.
    // Recovery chunk decreased from 04 to 03 (Full was 13, now it is 11)
    "376942": ["22", "03"],

    // Overhead Kick Light Kick Recovery Animation Chunk Behavior Changed
    // From 0204 to 0203.
    // Recovery chunk decreased from 04 to 03 (Full was 13, now it is 11)
    "376946": ["02", "03"],

    // Overhead Kick Strong Kick Recovery Animation Chunk Behavior Changed
    // From 2204 to 2203.
    // Recovery chunk decreased from 04 to 03 (Full was 13, now it is 11)
    "376990": ["22", "03"],

    // Overhead Kick Strong Kick Recovery Animation Chunk Behavior Changed
    // From 0204 to 0203.
    // Recovery chunk decreased from 04 to 03 (Full was 12, now it is 10)
    "376994": ["02", "03"],

    // Loop Hurricane A1 Animation Behavior Changed
    // From 03D2 1118 to 0312 1122
    // It pushes the opponent less when it hits and it does more damage.
    "410752": ["03", "12", "11", "22"],

    // Loop Hurricane A1 Animation Behavior Changed
    // From B4B2 0000 to B482 0000
    // The hit now causes more stun, to increase the chance of more hits connecting.
    "93524": ["B4", "82", "00", "00"],

    // Loop Hurricane A2 Animation Behavior Changed
    // From 81D2 1118 to 83D2 1122
    // It pushes the opponent less when it hits, it also has the ability to knockdown.
    "410756": ["83", "D2", "11", "22"],

    // Loop Hurricane A1 Code Behavior Changed From 1A5B8 to FF300
    // It activates the DM executed flag and jumps to 1A5B8
    "48182": ["0F", "00", "00", "F3"],



    // New Moves Behavior Code Offsets
    "48198":
    [
      // New Move 1 Light Version (FF214, 1A49A)
      "0F", "00", "14", "F2",

      // New Move 1 Strong Version (Unused, FF214, 1A49A)
      "0F", "00", "14", "F2",

      // New Move 2 Light Version (FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 2 Strong Version (Unused, FF000, 1A49A)
      "0F", "00", "00", "F0",
    ],

    // New Moves Animations Offsets
    "369384":
    [
      // New Move 1 Light Version (5FAE0)
      "E0", "5A",

      // New Move 1 Strong Version (Unused, 5FAE0)
      "E0", "5A",

      // New Move 2 Light Version (5FB00)
      "00", "5B",

      // New Move 2 Strong Version (Unused, 5FB00)
      "00", "5B"
    ],

    // New Moves Behavior 1 Data
    "410768":
    [
      // New Move 1 Light Version
      "03", "D2", "11", "24",
      
      // New Move 1 Strong Version (Unused)
      "03", "D2", "11", "24",
      
      // New Move 2 Light Version
      "03", "D2", "11", "24",
      
      // New Move 2 Strong Version (Unused)
      "03", "D2", "11", "24"
    ],

    // New Moves Behavior 2 Data
    "93540":
    [
      // New Move 1 Light Version
      "B2", "82", "00", "00",

      // New Move 1 Strong Version (Unused)
      "B2", "82", "00", "00",

      // New Move 2 Light Version
      "AE", "82", "00", "00",

      // New Move 2 Strong Version (Unused)
      "AE", "82", "00", "00"
    ],

    // New Move 1 Light Version Animation
    "391904":
    [
      "54", "04", "00", "03", "53", "04", "02", "03",
      "52", "04", "92", "03", "51", "04", "12", "02",
      "50", "04", "12", "03", "4F", "04", "02", "04",
      "F5", "03", "02", "09", "F6", "03", "03", "04"
    ],

    // New Move 2 Light Version Animation
    "391936":
    [
      "54", "04", "00", "03", "53", "04", "00", "03",
      "52", "04", "90", "03", "51", "04", "10", "02",
      "50", "04", "10", "03", "4F", "04", "00", "04",
      "F5", "03", "00", "02", "F6", "03", "00", "01",

      "54", "04", "00", "02", "53", "04", "00", "02",
      "52", "04", "90", "03", "51", "04", "10", "02",
      "50", "04", "10", "03", "4F", "04", "00", "04",
      "F5", "03", "00", "02", "F6", "03", "00", "01",

      "54", "04", "00", "02", "53", "04", "02", "02",
      "52", "04", "92", "03", "51", "04", "12", "02",
      "50", "04", "12", "03", "4F", "04", "02", "04",
      "F5", "03", "02", "08", "F6", "03", "03", "03"
    ],



    // Add Support To New Moves Inputs (Punch Button)
    "112542":
    [
      "F9", "4E", "0F", "00", "80", "E3", "28", "4A",
      "49", "01", "30", "66", "06", "7C", "28", "7A",
      "B9", "4E", "01", "00", "FC", "66", "86", "4A"
    ],

    // Add Support To New Moves Inputs (Kick Button)
    "112630":
    [
      "F9", "4E", "0F", "00", "40", "E3", "F9", "43",
      "01", "00", "88", "64", "28", "10", "B1", "00",
      "08", "E8", "40", "02", "0C", "00"
    ],

    // New Move 1 Interpretation
    "1041152":
    [
      "07", "7C", "28", "7A", "B9", "4E", "01", "00",
      "FC", "66", "86", "4A", "1A", "66", "3C", "3E",
      "D4", "00", "37", "7C", "7C", "31", "00", "09",
      "F0", "01", "A8", "42", "F2", "01", "68", "42",
      "FC", "01", "F9", "4E", "01", "00", "3E", "B9",
      "F9", "4E", "01", "00", "A4", "B7"      
    ],

    // New Loop Hurricane Interpretation
    "1041216":
    [
      "28", "0C", "7F", "00", "47", "01", "1E", "62",
      "28", "4A", "FF", "01", "18", "66", "09", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "0C", "66", "F9", "43", "01", "00", "88", "64", 
      "F9", "4E", "01", "00", "22", "B8", "F9", "4E",
      "01", "00", "FC", "B7"
    ],

    // New Move 2 Interpretation
    "1041280":
    [
      "28", "0C", "7F", "00", "47", "01", "3A", "62",
      "28", "4A", "FF", "01", "34", "66", "07", "7C",
      "28", "7A", "B9", "4E", "01", "00", "FC", "66",
      "86", "4A", "26", "66", "09", "7C", "B9", "4E",
      "01", "00", "A8", "66", "86", "4A", "1A", "66",
      "3C", "3E", "D6", "00", "37", "7C", "7C", "31",
      "00", "09", "F0", "01", "A8", "42", "F2", "01",
      "68", "42", "FC", "01", "F9", "4E", "01", "00",
      "3E", "B9", "F9", "4E", "0F", "00", "00", "E3"
    ],

    // Adds Better Player Control To Some Moves (Dancing Head Press)
    "1041376":
    [
      "03", "70", "40", "48", "B9", "4E", "01", "00",
      "F0", "A7", "F9", "4E", "01", "00", "B8", "A5"
    ]
  }
}