class ROMService
{
  constructor()
  {
    this.rom = null;
    this.generatedROM = null;
    this.romReady = false;
  }

  applyOverwritePatch = (patch) =>
  {
    let fileBytes = this.generatedROM[patch.filename];

    if(fileBytes)
    {
      let isHex = patch.byteFormat === "hex";

      Object.keys(patch.data).forEach((dataKey) => 
      {
        let index = parseInt(dataKey);

        if(!isNaN(index))
        {
          let nbs = patch.data[dataKey];

          for(let i = 0; i < nbs.length; i++)
            fileBytes[index + i] = isHex ? parseInt(nbs[i], 16) : nbs[i];
        }
      });
    }
  }

  applyPatch = (patch) =>
  {
    if(patch.type === "build")
      this.applyBuildPatch(patch);
    else if(patch.type === "overwrite")
      this.applyOverwritePatch(patch);
  }

  applyPatches = (patches) =>
  {
    Object.keys(patches).forEach((field) =>
    {
      this.applyPatch(patches[field]);
    });
  }

  convertHexArrayToByteArray = (hexArray) =>
  {
    let byteArray = new Array();

    for(let i = 0; i < hexArray.length; i++)
      byteArray.push(parseInt(hexArray[i], 16));

    return byteArray;
  }

  convertNumberToROMBytes = (number, byteAmount) =>
  {
    let bytes = new Array();
    let hex = (number >>> 0).toString(16);

    if(number > -1)
    {
      hex = "0".repeat((2 * byteAmount) - hex.length) + hex;
      
      for(let i = 0; i < byteAmount; i++)
        bytes[i] = hex.slice(i * 2, (i + 1) * 2);
      
      bytes.reverse();
    }
    else
    {
      let startIndex = hex.length - (byteAmount * 2);
      let hexChars = hex.substring(startIndex, hex.length);

      for(let i = 0; i < byteAmount; i++)
      {
        let index = i * 2;
        bytes[i] = hexChars[index] + hexChars[index + 1];
      }
    }

    return bytes;
  }

  convertStringToROMBytes = (text) =>
  {
    let bytes = [];

    for(let i = 0; i < text.length - 1; i += 2)
    {
      bytes.push(text.charCodeAt(i + 1).toString(16));
      bytes.push(text.charCodeAt(i).toString(16));
    }

    return bytes;
  }

  cloneROM = () =>
  {
    this.generatedROM = {};
    Object.keys(this.rom).forEach((e) =>
    {
      this.generatedROM[e] = this.rom[e].slice();
    });
    this.prepareFiles();
  }
  
  setROM = (rom) =>
  {
    this.rom = rom;
  }

  getGeneratedROM = () =>
  {
    // TODO: Remove these lines
    this.generatedROM["066eh.p1"] = this.generatedROM["066_kre.p1"];
    delete this.generatedROM["066_kre.p1"];


    return this.generatedROM;
  }

  getBytesAsDecimal = (bytes, byteFormat) =>
  {
    return byteFormat === "hex" ?
        this.convertHexArrayToByteArray(bytes) : bytes;
  }

  setByte = (filename, byteIndex, value) =>
  {
    let fileBytes = this.generatedROM[filename];

    if(fileBytes && !isNaN(value) && value > -1 && value < 256)
      fileBytes[byteIndex] = value;
  }

  setHexByte = (filename, byteIndex, value) =>
  {
    let fix = parseInt(value, 16);
    this.setByte(filename, byteIndex, fix);
  }

  setBytes = (filename, byteIndex, bytes, byteFormat) =>
  {
    if(byteIndex > -1)
    {
      let fbs = this.getBytesAsDecimal(bytes, byteFormat);
      let fileBytes = this.generatedROM[filename];
      fbs.forEach((byte, index) => fileBytes[byteIndex + index] = byte);
    }
  }

  getByte = (filename, byteIndex) =>
  {
    return this.getFileBytes(filename)[byteIndex];
  }

  getBytes = (filename, byteIndex, amount) =>
  {
    return this.getFileBytes(filename).slice(byteIndex, byteIndex + amount);
  }

  indexOfBytes = (filename, bytes, byteFormat, startIndex) =>
  {
    let fileBytes = this.generatedROM[filename];

    if(fileBytes)
    {
      let fbs = this.getBytesAsDecimal(bytes, byteFormat);
      let checkBytes = (element, index, romBytes) =>
      {
        for(let i = 0; i < fbs.length; i++)
        {
          if(fbs[i] !== romBytes[index + i])
            return false;
        }
        
        return true;
      };
      return fileBytes.findIndex(checkBytes, startIndex);
    }

    return -1;
  }

  prepareFiles = () =>
  {
    let fnl = ["066.p1", "066.rom", "066.bin", "066-p1.p1", "066-p1.rom", "066-p1.bin"];
    let length = 1048576;
    let file;

    for(let i = 0; i < fnl.length; i++)
    {
      if(fnl[i] in this.generatedROM)
      {
        file = this.generatedROM[fnl[i]];
        break;
      }
    }

    if(!file || file.length != length)
      throw new Error("The ROM has problems with one of the 3 main CPU files!");

    this.generatedROM["066_kre.p1"] = file;
  }

  getFileBytes = (filename) =>
  {
    let gr = this.generatedROM ? this.generatedROM : {};
    let fileBytes = gr[filename];
    return fileBytes ? fileBytes : [];
  }
}


let romService = new ROMService();