const zaziePatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Hell Deshi Kakato)"],
  data:
  {
    // Hellfire Input ID Change (DP)
    "115690": ["04"],

    // Vulcan Hook Input Change From ABCD to AC
    "115766": ["30", "00"],

    // Vulcan Hook Input Change From ABCD to AC
    "115770": ["30", "00"],

    // Deshi Kakato Input ID Change
    // "115878": ["07"],

    // Ducking Input ID Change (F-F)
    "115926": ["08"],

    // Step Back Input ID Change (QCB)
    "115980": ["01"],



    // Animation 7DF Hitboxes Changed, Removed All Hurtboxes (Hellfire)
    "322024":
    [
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00"
    ],

    // New Animation B6F Identical to A9C But Without The Strikebox (New Move 1)
    "365792":
    [
      "97", "12", "E9", "02", "D7", "00", "29", "11",
      "95", "02", "08", "08", "A9", "FB", "0E", "15",
      "CB", "FB", "10", "15", "EF", "FD", "11", "17", 
      "00", "00", "00", "00", "00", "00", "00", "00",
      "91", "02", "04", "08", "00", "00", "00", "00",
      "00", "00", "00", "00", "53", "0C", "00", "00"
    ],

    // New Animation B70 Identical to AB0 But Without The Strikebox (Deshi Kakato)
    // For the strong version of the move.
    "365840":
    [
      "AB", "12", "2C", "09", "D7", "00", "29", "11",
      "95", "14", "08", "12", "A9", "0B", "0E", "1B",
      "CB", "0B", "10", "1B", "EF", "0B", "11", "1B",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "91", "14", "04", "12", "00", "00", "00", "00",
      "00", "00", "00", "00", "72", "0C", "00", "00"
    ],



    // Hellfire LP Recovery Animation Chunk Behavior Changed
    // From 0202 to 0208
    // Recovery chunk increased from 2 to 8 (Full was 19, now it is 25)
    "382506": ["02", "08"],

    // Hellfire SP Recovery Animation Chunk Behavior Changed
    // From 0202 to 0206
    // Recovery chunk increased from 2 to 6 (Full was 19, now it is 23)
    "382662": ["02", "06"],

    // Deshi Kakato Strong Kick Version Animation Behavior Changed
    // From 2355 A620 to 2365 A620, it is now an overhead
    "412100": ["23", "65", "A6", "20"],

    // Deshi Kakato Strong Kick Version Active Animation Chunk Changed
    // From B00A to 700B, Strikebox removed
    // Changed to a new animation without strikebox, which turns it into a recovery chunk
    "388880": ["70", "0B"],

    // Vulcan Hook Code Behavior Changed From 1C95E to FF340
    // It fixes the animation duration, normally 8 but cancelling it becomes 7
    // It sets the animation duration back to 8 and executes 1C95E
    // This fix ensures the last hit won't grab a wrong damage value
    // "49482": ["0F", "00", "A0", "F3"],



    // New Moves Behavior Code Offsets
    "49542":
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
    "370728":
    [
      // New Move 1 Light Version (5FC20)
      "20", "5C",

      // New Move 1 Strong Version (Unused, 5FC20)
      "20", "5C",

      // New Move 2 Light Version (Unused, 5FC20)
      "20", "5C",

      // New Move 2 Strong Version (Unused, 5FC20)
      "20", "5C"
    ],

    // New Moves Behavior 1 Data
    "412112":
    [
      // New Move 1 Light Version
      "A3", "12", "11", "1D",
      
      // New Move 1 Strong Version (Unused)
      "A3", "12", "11", "1D",
      
      // New Move 2 Light Version (Unused)
      "A3", "12", "11", "1D",
      
      // New Move 2 Strong Version (Unused)
      "A3", "12", "11", "1D"
    ],

    // New Moves Behavior 2 Data
    "94884":
    [
      // New Move 1 Light Version
      "A7", "82", "00", "00",

      // New Move 1 Strong Version (Unused)
      "A7", "82", "00", "00",

      // New Move 2 Light Version (Unused)
      "00", "80", "00", "00",

      // New Move 2 Strong Version (Unused)
      "00", "80", "00", "00"
    ],

    // New Move 1 Light Version Animation A1
    "392224":
    [
      "EB", "07", "00", "02", "EC", "07", "10", "02",
      "ED", "07", "10", "02",

                              "DD", "07", "10", "02",
      "DE", "07", "90", "04", "DF", "07", "10", "01",
      "E0", "07", "90", "01", "E1", "07", "10", "01",
      "E2", "07", "10", "01", "E3", "07", "10", "01",
      "E4", "07", "10", "01", "E5", "07", "10", "01",
      "E6", "07", "10", "01", "E7", "07", "10", "01",
      "E8", "07", "00", "01", "E9", "07", "00", "02",
      "EA", "07", "00", "02",

                              "98", "0A", "00", "01",
      "99", "0A", "00", "01", "9A", "0A", "00", "01",
      "9B", "0A", "00", "01", "6F", "0B", "00", "01",
      "9D", "0A", "00", "01", "9E", "0A", "B0", "02",
      "9F", "0A", "00", "02", "A0", "0A", "00", "01",
      "A1", "0A", "00", "01",
      
                              "A6", "0A", "00", "02",
      "A7", "0A", "10", "01", "A8", "0A", "10", "02",
      "A9", "0A", "10", "01", "AA", "0A", "10", "02",
      "AB", "0A", "10", "01", "AC", "0A", "10", "02",
      "AD", "0A", "10", "01", "AE", "0A", "B2", "01",
      "AF", "0A", "12", "01", "B0", "0A", "12", "01",
      "B1", "0A", "12", "01", "B2", "0A", "12", "02",
      "B3", "0A", "12", "02", "B4", "0A", "12", "02",
      "B5", "0A", "02", "02", "4B", "07", "03", "04"
    ],

    // Add Support To New Moves Inputs
    "115878":
    [
      "F9", "4E", "0F", "00", "00", "EA", "07", "7C",
      "00", "61", "F8", "A1", "86", "4A"
    ],

    // New Move 1 Interpretation
    "1042944":
    [
      "28", "0C", "7F", "00", "47", "01", "34", "62",
      "28", "4A", "FF", "01", "2E", "66", "10", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "22", "66", "3C", "3E", "24", "02", "36", "7C",
      "7C", "31", "00", "06", "F0", "01", "7C", "31",
      "11", "A6", "F2", "01", "7C", "31", "1B", "A6",
      "F4", "01", "68", "42", "FC", "01", "F9", "4E",
      "01", "00", "5E", "C5", "F9", "4E", "01", "00",
      "AC", "C4"
    ]
  }
}