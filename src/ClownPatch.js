const clownPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Pick-A-Fake-Card), New Move 2 (Tricked), New Move 3 (Spin Kick)"],
  data:
  {
    // Head Stamp Input ID Change (D-U)
    "116208": ["07"],

    // Pick-A-Card Input ID Change (B-F)
    "116272": ["06"],

    // Spin Attack Input ID Change (B-F)
    "116340": ["06"],

    // Spin Drop Input ID Change (D-U)
    "116398": ["07"],



    // Animation 88D Hitboxes Changed (Head Stomp)
    // Strikebox changed from F804 0811 to F804 0A11
    // Increased 4 pixels downwards.
    // It now better connects against all characters.
    "330404": ["FA", "04", "0A", "11"],



    // Close Strong Punch Proximity Changed from 40 to 3C
    // Reduced from 64 to 60 pixels, same as Close Strong Kick
    "91332": ["3C"],



    // Crouch Strong Punch Active Animation Chunk Changed
    // From 5708 to 5608, animation changed
    // 2nd active chunk is now the same animation as the 1st active chunk
    "383416": ["56", "08"],

    // Far Strong Kick All Animation Changed
    // It now has an awful startup and a nice recovery (14, 6, 6)
    "383360":
    [
      "FB", "07", "00", "03", "FA", "07", "00", "04",
      "FB", "07", "00", "03", "4E", "08", "10", "02",
      "4F", "08", "10", "02", "50", "08", "92", "06",
      "51", "08", "12", "02", "52", "08", "02", "02",
      "FB", "07", "03", "02"
    ],

    // Far Strong Kick Code Behavior Changed From 19434 to FF200
    // It sets a move speed of 4 and jumps to 1A49A
    // It is now a translating move
    "49618": ["0F", "00", "00", "F2"],

    // Head Stomp Light Punch Version Code Behavior Changed From 1A814 to FEBC0
    // Handles the execution of Tricked and jumps to 1A814
    "49710": ["0F", "00", "C0", "EB"],

    // Head Stomp Strong Punch Version Code Behavior Changed From 1A814 to FEBC0
    // Handles the execution of Tricked and jumps to 1A814
    "49718": ["0F", "00", "C0", "EB"],



    // New Moves Behavior Code Offsets
    "49734":
    [
      // New Move 3 Light Version (FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 3 Strong Version (Unused, FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 1 Light Version (19434)
      "01", "00", "34", "94",

      // New Move 1 Strong Version (Unused, 19434)
      "01", "00", "34", "94"
    ],

    // New Moves Animations Offsets
    "370920":
    [
      // New Move 3 Light Version (5FD10)
      "10", "5D",

      // New Move 3 Strong Version (Unused, 5FD10)
      "10", "5D",

      // New Move 1 Light Version (Unused, 5FE90)
      "90", "5E",

      // New Move 1 Strong Version (Unused, 5FE90)
      "90", "5E"
    ],

    // New Moves Behavior 1 Data
    "412304":
    [
      // New Move 3 Light Version
      "83", "00", "11", "1F",
      
      // New Move 3 Strong Version (Unused)
      "83", "00", "11", "1F",
      
      // New Move 1 Light Version
      "83", "00", "08", "00",
      
      // New Move 1 Strong Version (Unused)
      "83", "00", "08", "00"
    ],

    // New Moves Behavior 2 Data
    "95076":
    [
      // New Move 3 Light Version
      "7A", "82", "00", "00",

      // New Move 3 Strong Version (Unused)
      "7A", "82", "00", "00",

      // New Move 1 Light Version
      "7C", "82", "00", "00",

      // New Move 1 Strong Version (Unused)
      "7C", "82", "00", "00"
    ],

    // New Move 1 Light Version Animation
    "392848":
    [
      "7D", "08", "02", "01", "7E", "08", "02", "01",
      "7F", "08", "02", "01", "80", "08", "82", "01",
      "81", "08", "02", "01", "7F", "08", "02", "02",
      "7E", "08", "02", "02", "7D", "08", "03", "02"
    ],

    // New Move 3 Light Version Animation
    "392464":
    [
      "FB", "07", "00", "01", "FA", "07", "00", "01",
      "F9", "07", "00", "01", "06", "08", "10", "01",
      "61", "08", "10", "01", "60", "08", "10", "02",
      "5F", "08", "10", "02", "5E", "08", "B0", "02",
      "5D", "08", "10", "02", "F9", "07", "10", "01",

      "06", "08", "10", "01", "61", "08", "10", "01",
      "60", "08", "10", "02", "5F", "08", "10", "02",
      "5E", "08", "90", "02", "5D", "08", "10", "02",
      "F9", "07", "00", "01", 

                              "06", "08", "10", "01",
      "61", "08", "10", "01", "60", "08", "10", "02",
      "5F", "08", "10", "02", "5E", "08", "90", "02",
      "5D", "08", "10", "02", "F9", "07", "00", "01",

      "06", "08", "10", "01", "61", "08", "10", "01",
      "60", "08", "10", "02", "5F", "08", "10", "02",
      "5E", "08", "B2", "02", "5D", "08", "12", "02",
      "F9", "07", "02", "08", "FA", "07", "02", "03",
      "FB", "07", "03", "03", "FF", "FF", "FF", "FF"
    ],



    // Add Support To New Moves Inputs (Punch Button)
    // Remove The Restriction For All Charge Attacks
    "116192":
    [
      "F9", "4E", "0F", "00", "80", "EB", "71", "4E",
      "71", "4E", "71", "4E", "71", "4E", "71", "4E"
    ],

    // Add Support To New Moves Inputs (Kick Button)
    "116340":
    [
      "F9", "4E", "0F", "00", "00", "EB", "06", "7C",
      "28", "7A", "00", "61", "7C", "A0", "86", "4A"
    ],

    // New Move 3 Interpretation (Spin Kick)
    "1043200":
    [
      "28", "0C", "7F", "00", "47", "01", "2C", "62",
      "28", "4A", "FF", "01", "26", "66", "0C", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "1A", "66", "3C", "3E", "54", "02", "37", "7C",
      "7C", "31", "00", "07", "F0", "01", "A8", "42",
      "F2", "01", "68", "42", "FC", "01", "F9", "4E",
      "01", "00", "EE", "C6", "F9", "4E", "01", "00",
      "7A", "C6"
    ],

    // New Move 1 Interpretation (Pick-A-Fake-Card)
    "1043328":
    [
      "01", "7C", "B9", "4E", "01", "00", "A8", "66",
      "86", "4A", "0C", "66", "3C", "3E", "56", "02",
      "36", "7C", "F9", "4E", "01", "00", "EE", "C6",
      "F9", "4E", "01", "00", "F0", "C5"
    ],

    // New Move 2 Execution (Tricked)
    "1043392":
    [
      "28", "0C", "03", "00", "20", "01", "18", "62",
      "28", "10", "B1", "00", "7C", "C0", "C0", "00",
      "0E", "67", "08", "E8", "00", "44", "00", "52",
      "40", "11", "30", "01", "40", "11", "32", "01",
      "F9", "4E", "01", "00", "14", "A8"
    ]
  }
}