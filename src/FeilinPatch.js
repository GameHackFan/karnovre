const feilinPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Kakkuu Hakkaku Souhiken II)"],
  data:
  {
    // Hakkaku Souhiken Input ID Change (D-U)
    "111670": ["07"],

    // Kakkuu Hakkaku Souhiken Input ID Change
    // "111688": ["09"],

    // Tourouzan Input ID Change (QCF)
    "111786": ["00"],

    // Kuuchuu Tourouzan Input ID Change (QCF)
    "111868": ["00"],



    // Dive Kick Animation Behavior Changed
    // From 80621198 to 82621198
    // It now causes a knockdown.
    "410348": ["82", "62", "11", "98"],

    // Dive Kick Active Animation Chunk Changed
    // From 0302 to 030A
    // It is now cancelable.
    "390166": ["0A", "03"],

    // Dive Kick Active Animation Chunk Changed
    // From 0302 to 030A
    // It is now cancelable.
    "390170": ["0A", "03"],

    // Tourouzan Recovery Animation Chunk Behavior Changed
    // From 1216 to 1212
    // Recovery chunk reduced from 22 to 18 (Full was 26, now it is 22)
    "377946": ["12", "12"],

    // Kuuchuu Tourouzan Light Version Animation Behavior Changed
    // From 0600 to 0400
    // It causes less impulse upwards.
    "104504": ["00", "04"],

    // Kuuchuu Tourouzan Strong Version Animation Behavior Changed
    // From 0600 to 0200
    // It causes less impulse upwards.
    "104524": ["00", "02"],

    // Kakkuu Hakkaku Souhiken Light Version Active Chuck Duration
    // From 9008 to 900E
    // It travels more forward.
    "390054": ["90", "0E"],

    // Kakkuu Hakkaku Souhiken Light Version Animation Behavior Changed
    // From 01151F10 to 01151F1A
    // Damage increased from 16 to 26
    "410356": ["01", "15", "1F", "1A"],

    // Kakkuu Hakkaku Souhiken Strong Version Animation Behavior Changed
    // From 01151F10 to 01151F1A
    // Damage increased from 16 to 26
    "410364": ["01", "15", "1F", "1A"],



    // New Moves Behavior Code Offsets
    "47806":
    [
      // New Move 1 Light Version A1 (FF2E0, 1A49A)
      "0F", "00", "E0", "F2",

      // New Move 1 Light Version A2 (1A5B8)
      "01", "00", "B8", "A5",

      // New Move 1 Strong Version A1 (FF2E0, 1A49A)
      "0F", "00", "E0", "F2",

      // New Move 1 Strong Version A2 (1A5B8)
      "01", "00", "B8", "A5"
    ],

    // New Moves Animations Offsets
    "368996":
    [
      // New Move 1 Light Version A1 (5FA70)
      "70", "5A",

      // New Move 1 Light Version A2 (5FAB0)
      "B0", "5A",

      // New Move 1 Strong Version A1 (5FA70)
      "70", "5A",

      // New Move 1 Strong Version A2 (5FAB0)
      "B0", "5A"
    ],

    // New Moves Behavior 1 Data
    "410376":
    [
      // New Move 1 Light Version A1
      "01", "15", "1F", "1E",

      // New Move 1 Light Version A2
      "03", "55", "11", "1E",

      // New Move 1 Strong Version A1 (Unused)
      "01", "15", "1F", "1E",

      // New Move 1 Strong Version A2 (Unused)
      "03", "55", "11", "1E"
    ],

    // New Moves Behavior 2 Data
    "93148":
    [
      // New Move 1 Light Version
      "66", "F3", "04", "36",

      // New Move 1 Light Version A2
      "00", "83", "80", "00",

      // New Move 1 Strong Version A1 (Unused)
      "66", "F3", "04", "36",

      // New Move 1 Strong Version A2 (Unused)
      "00", "83", "80", "00"
    ],

    // New Move 1 Light Version Animation A1
    "391792":
    [
      "1E", "03", "00", "04", "EB", "01", "90", "0E",
      "20", "03", "00", "02", "22", "03", "00", "02",
      "F8", "01", "00", "01", "23", "03", "00", "02",
      "F9", "01", "00", "01", "24", "03", "00", "02",
      "FA", "01", "00", "01", "25", "03", "00", "01",
      "9A", "02", "00", "01", "99", "02", "00", "01",
      "1E", "03", "00", "02", "EB", "01", "90", "0A",
      "20", "03", "31", "02"
    ],

    // New Move 1 Light Version Animation A2
    "391856":
    [
      "22", "03", "92", "02", "F8", "01", "02", "02",
      "23", "03", "02", "03", "F9", "01", "02", "02",
      "24", "03", "02", "03", "FA", "01", "02", "01",
      "24", "03", "02", "02", "FA", "01", "02", "02",
      "25", "03", "02", "30", "9A", "02", "22", "02",
      "99", "02", "02", "02", "98", "02", "03", "02"
    ],



    // Improves Dive Height Restriction
    "111956":
    [
      "68", "0C", "50", "00", "C4", "00", "00", "65",
      "62", "00"
    ],

    // Jump Fix To Code That Handles Kick Button Interpretation
    "111656": ["00", "67", "24", "00"],

    // Add Support To New Moves Inputs
    // Disables Default Kakkuu Hakkaku Souhiken Interpretation
    "111688":
    [
      "0E", "60", "71", "4E", "71", "4E", "F9", "4E",
      "0F", "00", "00", "E1", "71", "4E", "71", "4E"
    ],

    // Executes Kakkuu Hakkaku Souhiken As Kick Move
    "111752":
    [
      "7C", "C0", "0C", "00", "48", "E4", "31", "10",
      "00", "00", "3C", "3E", "6D", "00", "40", "DE",
      "40", "DE", "98", "7C"
    ],

    // Check If Moves Should Be Interpreted (Kick Button)
    "1040640":
    [
      "28", "08", "03", "00", "BF", "00", "0E", "66",
      "07", "10", "3C", "C0", "0C", "00", "06", "67",
      "F9", "4E", "0F", "00", "30", "E1", "F9", "4E",
      "01", "00", "2E", "B5"
    ],

    // New Kakkuu Hakkaku Souhiken Interpretation
    "1040688":
    [
      "07", "7C", "28", "7A", "B9", "4E", "01", "00",
      "FC", "66", "86", "4A", "06", "66", "F9", "4E",
      "01", "00", "7C", "B4", "F9", "4E", "0F", "00",
      "80", "E1"
    ],

    // New Move 1 Interpretation
    "1040768":
    [
      "28", "0C", "7F", "00", "47", "01", "2A", "62",
      "28", "4A", "FF", "01", "24", "66", "10", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "18", "66", "3C", "3E", "72", "00", "98", "7C",
      "68", "42", "F0", "01", "A8", "42", "F2", "01",
      "68", "42", "FC", "01", "F9", "4E", "01", "00",
      "66", "B5", "F9", "4E", "01", "00", "2E", "B5"
    ]
  }
}