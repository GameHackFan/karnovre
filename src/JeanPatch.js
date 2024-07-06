const jeanPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Backflip), New Move 2 (Rondat)"],
  data:
  {
    // Bal Rose Input ID Change
    // "114204": ["06"],

    // Needle Shower Input Change From ABCD to AC
    "114262": ["30", "00"],

    // Needle Shower Input Change From ABCD to AC
    "114266": ["30", "00"],

    // Fric Frac Input ID Change (D-U)
    "114378": ["07"],

    // Rondat Input ID Change
    // "114434": ["06"],

    // Rondat Charge Duration Change
    // "114436": ["28"],

    // Rondat Input ID Change (QCF)
    "114452": ["00"],



    // Animation 987 Hitboxes Changed (Far Strong Punch)
    // Added an Arm Hurtbox
    "342384": ["A7", "4F", "08", "10"],

    // Animation 996 Hitboxes Changed (Crouch Strong Punch)
    // Head Hurtbox changed from C113 0818 to BA2E 0E10
    // Reduced width by 8 pixels, increased height by 6 pixels
    // Moved forward by 25 pixels, moved upward by 27 pixels
    "343096": ["BA", "2E", "0E", "10"],



    // New Animation B74 Identical to 945 But Without The Throwbox (New Move 1, New Move 2)
    "366032":
    [
      "2A", "13", "FF", "01", "DA", "00", "26", "0F",
      "9E", "FD", "08", "08", "B4", "FE", "0E", "11",
      "D3", "FE", "0E", "11", "F2", "FE", "0E", "11",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "D3", "07", "08", "08", "00", "00", "00", "00",
      "00", "00", "00", "00", "2D", "13", "00", "00"
    ],



    // Needle Shower Light Version Animation Behavior Changed
    // From 81D1 C30A to 81D1 C31A
    // Damage increased from 10 to 14
    // "411484": ["81", "D1", "C3", "0E"],

    // Needle Shower Strong Version Animation Behavior Changed
    // From 81D1 C30A to 81D1 C31A
    // Damage increased from 10 to 14
    // "411488": ["81", "D1", "C3", "0E"],

    // Needle Shower Code Behavior Changed From 1C95E to FF340
    // It fixes the animation duration, normally 8 but cancelling it becomes 7
    // It sets the animation duration back to 8 and executes 1C95E
    // This fix ensures the last hit won't grab a wrong damage value
    // "48914": ["0F", "00", "A0", "F3"],



    // New Moves Behavior Code Offsets
    "48958":
    [
      // New Move 1 A1 (FE7A0, 1A5B8)
      "0F", "00", "A0", "E7",

      // New Move 1 A2 (1A5B8)
      "01", "00", "B8", "A5",

      // New Move 2 Light Version (FF300, 1A5B8)
      "0F", "00", "00", "F3",

      // New Move 2 Strong Version (Unused, FF300, 1A5B8)
      "0F", "00", "00", "F3"
    ],

    // New Moves Animations Offsets
    "370148":
    [
      // New Move 1 A1 (5FDA0)
      "A0", "5D",

      // New Move 1 A2 (5F6F0, Hit Connected, Never Change it)
      "F0", "56",

      // New Move 2 Light Version (5FDD0)
      "D0", "5D",

      // New Move 2 Strong Version (Unused, 5FDD0)
      "D0", "5D"
    ],

    // New Moves Behavior 1 Data
    "411528":
    [
      // New Move 1 A1
      "03", "65", "11", "20",
      
      // New Move 1 A2
      "03", "65", "11", "20",
      
      // New Move 2 Light Version
      "03", "65", "11", "42",
      
      // New Move 2 Strong Version (Unused)
      "03", "65", "11", "42"
    ],

    // New Moves Behavior 2 Data
    "94300":
    [
      // New Move 1 A1
      "C2", "83", "00", "00",

      // New Move 1 A2
      "C2", "83", "00", "00",

      // New Move 2 Light Version
      "C2", "D2", "00", "00",

      // New Move 2 Strong Version (Unused)
      "C2", "D2", "00", "00"
    ],

    // New Move 1 Animation
    "392608":
    [
      "74", "0B", "00", "02", "47", "09", "00", "02",
      "34", "0B", "02", "06", "AF", "09", "12", "04",
      "35", "0B", "02", "03", "B0", "09", "02", "04",
      "36", "0B", "02", "04", "37", "0B", "02", "03",
      "38", "0B", "00", "03", "5A", "09", "80", "03",
      "A6", "09", "02", "30", "36", "09", "23", "01"
    ],

    // New Move 2 Light Version Animation (192)
    "392656":
    [
      "7C", "09", "00", "02", "2F", "0B", "00", "02",
      "30", "0B", "82", "04", "31", "0B", "12", "0A",
      "32", "0B", "02", "30", "33", "0B", "20", "04",
      "34", "0B", "02", "03", "47", "09", "02", "02",
      "74", "0B", "03", "02"
    ],



    // Add Support To New Moves Inputs (Punch Button)
    "114196":
    [
      "F9", "4E", "0F", "00", "00", "E7", "28", "4A",
      "49", "01", "30", "66", "06", "7C", "28", "7A",  // 30 60 change it
      "B9", "4E", "01", "00", "FC", "66", "86", "4A"
    ],

    // Add Support To New Moves Inputs (Kick Button)
    "114434":
    [
      "F9", "4E", "0F", "00", "40", "E7", "06", "7C",
      "28", "7A", "00", "61", "EE", "A7", "86", "4A"
    ],

    // Ensures Only New Rondat Can Be Executed
    "114454": ["F9", "4E", "0F", "00", "A8", "E7"],

    // New Move 1 Interpretation
    "1042176":
    [
      "01", "7C", "71", "4E", "B9", "4E", "01", "00",
      "A8", "66", "86", "4A", "14", "66", "3C", "3E",
      "92", "01", "A9", "7C", "00", "61", "0A", "0D",
      "40", "11", "E0", "01", "F9", "4E", "01", "00",
      "7C", "BF", "F9", "4E", "01", "00", "1A", "BE"
    ],

    // New Move 2 Interpretation
    "1042240":
    [
      "28", "0C", "7F", "00", "47", "01", "32", "62",
      "28", "4A", "FF", "01", "2C", "66", "06", "7C",
      "28", "7A", "B9", "4E", "01", "00", "FC", "66",
      "86", "4A", "1E", "66", "00", "7C", "B9", "4E",
      "01", "00", "A8", "66", "86", "4A", "12", "66",
      "3C", "3E", "94", "01", "06", "7C", "71", "4E",
      "71", "4E", "71", "4E", "F9", "4E", "01", "00",
      "7C", "BF", "F9", "4E", "01", "00", "30", "BF"
    ],

    // Fixes Backflip Behavior 3 Data
    "1042336":
    [
      "68", "4A", "20", "01", "10", "66", "28", "4A",
      "E0", "01", "0A", "67", "7C", "31", "00", "06",
      "30", "01", "68", "42", "E0", "01", "F9", "4E",
      "01", "00", "B8", "A5"
    ]
  }
}