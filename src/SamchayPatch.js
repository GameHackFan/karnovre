const samchayPatch = 
{
  type: "overwrite",
  filename: "066_kre.p1",
  byteFormat: "hex",
  comments: ["New Move 1 (Pap So Cau II)"],
  data:
  {
    // Matron Jusalop Input ID Change
    // "113094": ["00"],

    // Ti Kau Koun Input ID Change (QCF)
    "113154": ["00"],
    
    // Ti Kau Roi Input ID Change (RDP)
    "113208": ["05"],



    // New Animation B6A Identical to 4CE But With Hurtboxes (Ti Kau Koun)
    "365552":
    [
      "F1", "06", "04", "04", "E6", "00", "1A", "0E",
      "D6", "08", "15", "16", "F7", "04", "09", "16", 
      "00", "00", "00", "00", "00", "00", "00", "00",
      "00", "00", "00", "00", "00", "00", "00", "00",
      "CC", "0E", "08", "08", "00", "00", "00", "00",
      "00", "00", "00", "00", "F5", "06", "00", "00"
    ],

    // New Animation B6B Identical to 525 But With Hurtboxes (Ti Kau Koun)
    "365600":
    [
      "87", "07", "02", "01", "B6", "00", "1A", "0E",
      "9C", "14", "08", "08", "B6", "0A", "1A", "1A",
      "00", "00", "00", "00", "00", "00", "00", "00", 
      "00", "00", "00", "00", "00", "00", "00", "00",
      "AE", "14", "08", "08", "00", "00", "00", "00",
      "00", "00", "00", "00", "89", "07", "00", "00"
    ],



    // Close Light Punch Active Animation Chunk Behavior Changed
    // From 8A03 to 8E03, It is now cancelable.
    "377494": ["8E", "03"],

    // Close Light Punch Recovery Animation Chunk Behavior Changed
    // From 0B04 to 0F04, It is now cancelable.
    "377498": ["0F", "04"],

    // Far Light Punch Active Animation Chunk Behavior Changed
    // From 8A03 to 8E03, It is now cancelable.
    "377578": ["8E", "03"],

    // Far Light Punch Recovery Animation Chunk Behavior Changed
    // From 0A03 to 0E03, It is now cancelable.
    "377582": ["0E", "03"],

    // Far Light Punch Recovery Animation Chunk Behavior Changed
    // From 0B02 to 0F02, It is now cancelable.
    "377586": ["0F", "02"],

    // Crouch Light Punch Active Animation Chunk Behavior Changed
    // From 8A03 to 8E03, It is now cancelable.
    "377666": ["8E", "03"],

    // Close Light Punch Recovery Animation Chunk Behavior Changed
    // From 0B06 to 0F06, It is now cancelable.
    "377670": ["0F", "06"],

    // Jump Light Punch (Both) Active Animation Chunk Behavior Changed
    // From 8230 to 8A30, It is now cancelable.
    "377746": ["8A", "30"],

    // Jump Light Punch (Both) Active Animation Chunk Behavior Changed
    // From 8230 to 8A30, It is now cancelable.
    "377746": ["8A", "30"],

    // Jump Light Punch (Both) Active Animation Chunk Behavior Changed
    // From 8230 to 8A30, It is now cancelable.
    "377746": ["8A", "30"],

    // Jump Strong Punch (Both) Active Animation Chunk Behavior Changed
    // From 8206 to 8A06, It is now cancelable.
    "377758": ["8A", "06"],

    // Jump Light Kick (Neutral) Active Animation Chunk Behavior Changed
    // From 8230 to 8A30, It is now cancelable.
    "377786": ["8A", "30"],

    // Jump Strong Kick (Neutral) Active Animation Chunk Behavior Changed
    // From 8206 to 8A06, It is now cancelable.
    "377798": ["8A", "06"],

    // Jump Light Kick (Normal) Active Animation Chunk Behavior Changed
    // From 8230 to 8A30, It is now cancelable.
    "377826": ["8A", "30"],

    // Jump Strong Kick (Neutral) Active Animation Chunk Behavior Changed
    // From 8206 to 8A06, It is now cancelable.
    "377838": ["8A", "06"],

    // F + Strong Kick Animation Behavior Changed From 0482 to 048A
    // It is now cancelable
    "388726": ["8A", "04"],

    // Ti Kau Koun Light Version Startup Chunk Changed Animation 4CE to B6A
    // New animation, similar but 4CE is invulnerable, B6A is not.
    // This chunk of this move is not invulnerable anymore.
    "378020": ["6A", "0B"],

    // Ti Kau Koun Light Version Startup Chunk Changed Animation 525 to B6B
    // New animation, similar but 525 is invulnerable, B6B is not.
    // This chunk of this move is not invulnerable anymore.
    "378024": ["6B", "0B"],

    // Ti Kau Koun Light Version Startup Chunk Changed Animation 526 to 528
    // Similar animation, but 526 is invulnerable, 528 is not.
    // This chunk of this move is not invulnerable anymore.
    "378028": ["28", "05"],

    // Ti Kau Koun Strong Version Startup Chunk Changed Animation 4CE to B6A
    // New animation, similar but 4CE is invulnerable, B6A is not.
    // This chunk of this move is not invulnerable anymore.
    "378068": ["6A", "0B"],

    // Ti Kau Koun Light Version Startup Chunk Changed Animation 525 to B6B
    // New animation, similar but 525 is invulnerable, B6B is not.
    // This chunk of this move is not invulnerable anymore.
    "378072": ["6B", "0B"],
    
    // Ti Kau Koun Light Version Startup Chunk Changed Animation 526 to 528
    // Similar animation, but 526 is invulnerable, 528 is not.
    // This chunk of this move is not invulnerable anymore.
    "378076": ["28", "05"],

    // Ti Kau Koun Light Version Recovery Chunk Changed
    // Duration from 05 to 40 (5 frames to 64)
    // It doesn't change anything, only allows an air version to exist.
    "378042": ["02", "40"],

    // Ti Kau Koun Strong Version Recovery Chunk Changed
    // Duration from 05 to 40 (5 frames to 64)
    // It doesn't change anything, only allows an air version to exist.
    "378090": ["02", "40"],


    // Pap So Cau (LPK Version) Startup Chunk Changed Animation Behavior from A10 to C10
    // It now travels for 2 more frames, he goes further.
    "378118": ["10", "0C"],

    // Pap So Cau (SPK Version) Startup Chunk Changed Animation Behavior from C10 to E10
    // It now travels for 2 more frames, he goes further.
    "378146": ["10", "0E"],



    // New Moves Behavior Code Offsets
    "48390":
    [
      // New Move 1 Light Version (1A5B8)
      "01", "00", "B8", "A5",

      // New Move 1 Strong Version (1A5B8)
      "01", "00", "B8", "A5",

      // New Move 2 Light Version (FF000, 1A49A)
      "0F", "00", "00", "F0",

      // New Move 2 Strong Version (Unused, FF000, 1A49A)
      "0F", "00", "00", "F0"

      // 5C4A8, 5C4D8
    ],

    // New Moves Animations Offsets
    "369576":
    [
      // New Move 1 Light Version (5C4A8)
      "A8", "24",

      // New Move 1 Strong Version (5C4D8)
      "D8", "24",

      // New Move 2 Light Version (5FB60)
      "60", "5B",

      // New Move 2 Strong Version (Unused, 5FB60)
      "60", "5B"
    ],

    // New Moves Behavior 1 Data
    "410960":
    [
      // New Move 1 Light Version
      "83", "12", "11", "18",
      
      // New Move 1 Strong Version
      "83", "52", "11", "18",
      
      // New Move 2 Light Version
      "83", "12", "05", "23",
      
      // New Move 2 Strong Version (Unused)
      "83", "12", "05", "23"
    ],

    // New Moves Behavior 2 Data
    "93732":
    [
      // New Move 1 Light Version
      "98", "D3", "03", "36",

      // New Move 1 Strong Version
      "98", "D3", "03", "36",

      // New Move 2 Light Version
      "9C", "82", "00", "00",

      // New Move 2 Strong Version (Unused)
      "9C", "82", "00", "00",
    ],

    // New Move 1 Light Version Animation A1
    "392032":
    [
      "2A", "05", "10", "0E", "2B", "05", "90", "02",
      "2C", "05", "30", "02", "2A", "05", "00", "02",
      "E0", "04", "00", "02", "E7", "04", "10", "03",
      "E6", "04", "10", "03", "E5", "04", "90", "04",
      "E4", "04", "10", "03", "E3", "04", "10", "03",
      "E8", "04", "10", "02", "E9", "04", "92", "04",
      "EA", "04", "12", "04", "E8", "04", "02", "04",
      "E0", "04", "03", "04"
    ],



    // Add Support To New Moves Inputs (Air Kick Button)
    "113068":
    [
      "F9", "4E", "0F", "00", "00", "E4", "71", "4E",
      "71", "4E"
    ],

    // Add Support To New Moves Inputs (Punch Button)
    "113094":
    [
      "F9", "4E", "0F", "00", "80", "E4", "00", "7C",
      "00", "61", "D8", "AC", "86", "4A"
    ],
    
    // Check If Air Moves Should Be Interpreted (Kick Button)
    "1041408":
    [
      "28", "08", "03", "00", "BF", "00", "10", "67",
      "07", "10", "3C", "C0", "0C", "00", "02", "67",
      "1E", "60", "F9", "4E", "01", "00", "22", "BB",
      "F9", "4E", "01", "00", "B6", "B9"
    ],
    
    // Air Ti Kau Koun Interpretation
    "1041456":
    [
      "00", "7C", "B9", "4E", "01", "00", "A8", "66",
      "86", "4A", "14", "66", "3C", "3E", "04", "01",
      "32", "7C", "00", "61", "0C", "10", "40", "DE",
      "40", "DC", "F9", "4E", "01", "00", "CA", "BA",
      "F9", "4E", "01", "00", "22", "BB"      
    ],

    // New Move 1 Interpretation
    "1041536":
    [
      "28", "0C", "7F", "00", "47", "01", "34", "62",
      "28", "4A", "FF", "01", "2E", "66", "10", "7C",
      "B9", "4E", "01", "00", "A8", "66", "86", "4A",
      "22", "66", "3C", "3E", "06", "01", "36", "7C",
      "7C", "31", "00", "06", "F0", "01", "7C", "31",
      "04", "9B", "F2", "01", "7C", "31", "0A", "9A",
      "F4", "01", "68", "42", "FC", "01", "F9", "4E",
      "01", "00", "CA", "BA", "F9", "4E", "01", "00",
      "CC", "B9"
    ]
  }
}