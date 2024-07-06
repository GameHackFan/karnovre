const karnovPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Glitch), New Move 2 (Super 100 Attack)"],
  data:
  {
    // Fire Breath Input ID Change (F-F)
    "116590": ["08"],

    // Fire Ball Input ID Change (QCF)
    "116648": ["00"],

    // Super 100 Kick Input ID Change
    // "116706": ["06"],

    // Balloon Attack Input ID Change (QCB)
    "116824": ["01"],



    // Animation 8CD Physicsbox Changed (Victory 1, Glitch)
    // From DB00 2511 to E600 1A11
    // Same physicsbox as the crouch animation
    // "333444": ["E6", "00", "1A", "11"],

    // Animation 8CE Physicsbox Changed (Victory 1, Glitch)
    // From DB00 2511 to E600 1A11
    // Same physicsbox as the crouch animation
    "333492": ["E6", "00", "1A", "11"],

    // Animation 8CF Physicsbox Changed (Victory 1, Glitch)
    // From DB00 2511 to E600 1A11
    // Same physicsbox as the crouch animation
    "333540": ["E6", "00", "1A", "11"],

    // Animation 8D0 Physicsbox Changed (Victory 1, Glitch)
    // From DB00 2511 to E600 1A11
    // Same physicsbox as the crouch animation
    "333588": ["E6", "00", "1A", "11"],

    // Animation 920 Boxes Changed (Super 100 Kick - 1st Kick)
    // From 0000 0000 A6FE 0414 A620 1020 to A620 060C A6FE 0414 A624 1024
    // Strikebox increased by 8 pixels forwards, Foot hurtboxes added.
    "337452":
    [
      "A6", "20", "06", "0C", "A6", "FE", "04", "14",
      "A6", "24", "10", "24"
    ],

    // Animation 924 Boxes Changed (Super 100 Kick - 2nd Kick)
    // From 0000 0000 A6FE 0414 C020 1020 to C020 060C A6FE 0414 C024 1024
    // Strikebox increased by 8 pixels forwards, Foot hurtboxes added.
    "337644":
    [
      "C0", "20", "06", "0C", "A6", "FE", "04", "14",
      "C0", "24", "10", "24"
    ],

    // Animation 928 Boxes Changed (Super 100 Kick - 3rd Kick)
    // From 0000 0000 A6FE 0414 C020 1020 to D81C 060C A6FE 0414 D81C 1024
    // Strikebox increased by 8 pixels forwards, Foot hurtboxes added.
    "337836":
    [
      "D8", "1C", "06", "0C", "A6", "FE", "04", "14",
      "D8", "1C", "10", "24"
    ],

    // New Animation B6C Identical to 92E But With Hurtboxes (Balloon Attack)
    "365648":
    [
      "36", "16", "00", "04", "B8", "00", "1A", "11",
      "A4", "03", "08", "08", "BA", "FE", "18", "14",
      "00", "00", "00", "00", "00", "00", "00", "00", 
      "00", "00", "00", "00", "00", "00", "00", "00",
      "A6", "FE", "04", "14", "00", "00", "00", "00",
      "00", "00", "00", "00", "38", "16", "00", "00"
    ],

    // New Animation B71 Identical to 8CC But With Hurtboxes (Glitch)
    "365888":
    [
      "8B", "15", "FF", "06", "DB", "00", "25", "11",
      "AC", "FD", "08", "08", "BC", "FB", "0E", "14",
      "D8", "FB", "0B", "14", "F3", "FB", "0D", "14",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "B2", "FB", "04", "14", "00", "00", "00", "00",
      "00", "00", "00", "00", "90", "15", "00", "00"
    ],

    // New Animation B72 Identical to 8CD But With Hurtboxes (Glitch)
    "365936":
    [
      "8C", "15", "FF", "06", "E6", "00", "1A", "11",
      "B9", "00", "08", "08", "CB", "FD", "0D", "16",
      "E4", "FD", "09", "16", "F8", "FF", "08", "18",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "C2", "FD", "04", "16", "00", "00", "00", "00",
      "00", "00", "00", "00", "91", "15", "00", "00"
    ],

    // New Animation B73, No Sprite No Boxes Animation (Glitch)
    "365984":
    [
      "4C", "02", "00", "00", "E6", "00", "1A", "11",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00"
    ],



    // Crouch Light Kick Active Animation Chunk Behavior Changed
    // From 8A03 to 8E03, It is now cancelable.
    "385354": ["8E", "03"],

    // Crouch Light Kick Recovery Animation Chunk Behavior Changed
    // From 0B04 to 0F04, It is now cancelable.
    "385358": ["0F", "04"],

    // Balloon Attack Light Version Startup Animation Chunk Behavior Changed
    // From 4008 to 400B
    // Invulnerability chunk increased from 8 to 11 frames.
    "388658": ["40", "0B"],

    // Balloon Attack Light Version Startup Chunk Changed Animation 92E to B6C
    // New animation, similar but 92E is invulnerable, B6C is not.
    // This chunk of this move is not invulnerable anymore.
    "388660": ["6C", "0B"],

    // Balloon Attack Light Version Startup Animation Chunk Behavior Changed
    // From 4006 to 4003
    // Vulnerability chunk reduced from 6 to 3 frames.
    "388662": ["40", "03"],

    // Balloon Attack Strong Version Startup Animation Chunk Behavior Changed
    // From 4018 to 401B
    // Invulnerability chunk increased from 24 to 27 frames.
    "388698": ["40", "1B"],

    // Balloon Attack Strong Version Startup Chunk Changed Animation 92E to B6C
    // New animation, similar but 92E is invulnerable, B6C is not.
    // This chunk of this move is not invulnerable anymore.
    "388700": ["6C", "0B"],

    // Balloon Attack Light Version Startup Animation Chunk Behavior Changed
    // From 4006 to 4003
    // Vulnerability chunk reduced from 6 to 3 frames.
    "388702": ["40", "03"],

    // Super 100 Kick Both Version Animation Behavior Changed
    // From 83D2 0518 to 8312 0518
    // It now pushes the opponent less, to increase the chance of all hits connecting.
    "412456": ["83", "12", "05", "18"],

    // Super 100 Kick Both Version Animation Behavior Changed
    // From 00C3 4433 to 0043 4433
    // The hit now causes less stun, which fixes the infinite.
    "95228": ["00", "43", "44", "33"],

    // Super 100 Kick Both Version Recovery Chunk Changed
    // From 0304 to 0307
    // Recovery Chunk increased from 4 to 7 (Full was 9, now it is 12)
    "385802": ["03", "07"],

    // Crouch Strong Kick Animation Code Behavior Changed from 1A49A to FF290
    // It forces the default speed 0500 0500 and cleans the translation increase memory.
    // It fixes the teleport bug, no other change happens.
    "49826": ["0F", "00", "90", "F2"],



    // New Moves Behavior Code Offsets
    "49926":
    [
      // New Move 1 Light Version (FEC90, 1A49A)
      "0F", "00", "90", "EC",

      // New Move 1 Strong Version (Unused, FEC90, 1A49A)
      "0F", "00", "90", "EC",

      // New Move 2 Light Version (FECD0, 1A49A)
      "0F", "00", "D0", "EC",

      // New Move 2 Strong Version (Unused, FF018, 1A49A)
      "0F", "00", "D0", "EC",
    ],

    // New Moves Animations Offsets
    "371112":
    [
      // New Move 1 Light Version (5FE50)
      "50", "5E",

      // New Move 1 Strong Version (Unused, 5FBA0)
      "50", "5E",

      // New Move 2 Light Version (5FBA0)
      "A0", "5B",

      // New Move 2 Strong Version (Unused, 5FBA0)
      "A0", "5B"
    ],

    // New Moves Behavior 1 Data
    "412496":
    [
      // New Move 1 Light Version
      "83", "12", "05", "00",
      
      // New Move 1 Strong Version (Unused)
      "83", "12", "05", "00",
      
      // New Move 2 Light Version
      "83", "12", "05", "1A",
      
      // New Move 2 Strong Version (Unused)
      "83", "12", "05", "1A",
    ],

    // New Moves Behavior 2 Data
    "95268":
    [
      // New Move 1 Light Version
      "C4", "82", "00", "00",

      // New Move 1 Strong Version (Unused)
      "C4", "82", "00", "00",

      // New Move 2 Light Version
      "C4", "82", "00", "00",

      // New Move 2 Strong Version (Unused)
      "C4", "82", "00", "00",
    ],

    // New Move 1 Light Version Animation
    "392784":
    [
      "71", "0B", "00", "02", "72", "0B", "00", "02", 
      "CE", "08", "00", "02", "CF", "08", "00", "02",
      "73", "0B", "00", "02", "D0", "08", "00", "02",

      "73", "0B", "10", "01", "73", "0B", "00", "04", 

      "CF", "08", "00", "02", "73", "0B", "00", "02",
      "D0", "08", "00", "02", "CF", "08", "00", "02",
      "CE", "08", "00", "03", "72", "0B", "00", "03",
      "71", "0B", "01", "02"
    ],

    // New Move 2 Light Version Animation
    "392096":
    [
      "1D", "09", "10", "08", "1E", "09", "10", "01",
      "1F", "09", "10", "01", "20", "09", "90", "01",
      "21", "09", "10", "01", "22", "09", "10", "01",
      "23", "09", "10", "01", "24", "09", "B0", "01",
      "25", "09", "10", "01", "26", "09", "10", "01",
      "27", "09", "10", "01", "28", "09", "B0", "01",
      "29", "09", "10", "01", "2A", "09", "10", "01",
      "2B", "09", "10", "01", 

                              "16", "09", "10", "02",
      "2E", "09", "10", "02", "2F", "09", "10", "04",
      "2E", "09", "10", "03", "2D", "09", "90", "05",

      "16", "09", "10", "02", "2E", "09", "10", "02",
      "2F", "09", "10", "04", "2E", "09", "10", "03",
      "2D", "09", "B2", "05", "16", "09", "32", "02",
      "96", "08", "22", "02", "95", "08", "02", "02",
      "94", "08", "02", "04", "95", "08", "03", "02"
    ],



    // NOTE: Visually horrible
    // Removes Balloon Cancel Restriction
    // "116890":
    // [
    //   "71", "4E", "71", "4E", "71", "4E", "71", "4E",
    //   "71", "4E"
    // ],

    // Add Support To New Moves Inputs
    "116706":
    [
      "F9", "4E", "0F", "00", "50", "EC", "06", "7C",
      "28", "7A", "00", "61", "0E", "9F", "86", "4A"
    ],
    
    // New Move 1 Interpretation
    "1043456":
    [
      "04", "7C", "B9", "4E", "01", "00", "A8", "66",
      "86", "4A", "04", "66", "36", "7C", "0E", "60",
      "05", "7C", "B9", "4E", "01", "00", "A8", "66",
      "86", "4A", "16", "66", "38", "7C", "3C", "3E",
      "84", "02", "00", "61", "2C", "08", "40", "DC",
      "46", "31", "E0", "01", "F9", "4E", "01", "00",
      "08", "C9", "F9", "4E", "01", "00", "E8", "C7"
    ],

    // New Move 2 Interpretation
    "1043536":
    [
      "28", "0C", "7F", "00", "47", "01", "1E", "62",
      "28", "4A", "FF", "01", "18", "66", "11", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "0C", "66", "3C", "3E", "86", "02", "36", "7C",
      "F9", "4E", "01", "00", "08", "C9", "F9", "4E",
      "0F", "00", "00", "EC"
    ],

    // Sets Glitch Behavior Values
    "1043600":
    [
      "28", "30", "E0", "01", "18", "67", "68", "4A",
      "20", "01", "12", "66", "40", "04", "36", "00",
      "40", "D0", "3B", "30", "14", "00", "40", "31",
      "30", "01", "68", "42", "E0", "01", "F9", "4E",
      "01", "00", "9A", "A4", "DD", "DD", "DD", "DD",

      // Translation Data List
      "70", "00", "E0", "00", "90", "FF", "20", "FF"
    ],

    // Sets Super 100 Attack Behavior Values
    "1043664":
    [
      "7C", "11", "01", "00", "FF", "01", "68", "0C",
      "07", "00", "20", "01", "06", "66", "7C", "31",
      "0A", "00", "30", "01", "F9", "4E", "01", "00",
      "9A", "A4"      
    ]
  }
}