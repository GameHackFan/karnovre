class PatchService
{
  onApplyPatch = (event) =>
  {
    let f = document.getElementById("file").files[0];
    let extras = {};
    extras.successCallback = this.applyPatch;
    extras.errorCallback = this.onError;
    extras.errorMessage = "Invalid .zip file!";
    extras.file = f;
    fileService.readZipFile(extras);
  }

  applyPatch = (extras) =>
  {
    try
    {
      this.showWarning("Please wait, the ROM is being generated.");
      romService.setROM(extras.actionData);
      romService.cloneROM();
      romService.applyPatch(gamePatch);
      romService.applyPatch(palletePatch);
      romService.applyPatch(stagePalletePatch);
      romService.applyPatch(clownPatch);
      romService.applyPatch(feilinPatch);
      romService.applyPatch(leePatch);
      romService.applyPatch(jeanPatch);
      romService.applyPatch(karnovPatch);
      romService.applyPatch(marstoriusPatch);
      romService.applyPatch(matlokPatch);
      romService.applyPatch(mizoguchiPatch);
      romService.applyPatch(oxPatch);
      romService.applyPatch(rayPatch);
      romService.applyPatch(ryokoPatch);
      romService.applyPatch(samchayPatch);
      romService.applyPatch(yungmiePatch);
      romService.applyPatch(zaziePatch);
      let newExtras = {fileObject: romService.getGeneratedROM()};
      newExtras.successCallback = this.onZipFileCreated;
      newExtras.errorCallback = this.onError;
      newExtras.errorMessage = "Problems creating the .zip ROM file!";
      fileService.createZipFile(newExtras);
    }
    catch(e)
    {
      this.showErrorMessage(e, null);
    }
  }

  onZipFileCreated = (extras) =>
  {
    let name = "karnovre.zip";
    let contentType = "application/octet-stream";
    this.downloadFile(extras.actionData, name, contentType);
  }

  onError = (extras) =>
  {
    this.showErrorMessage(extras.actionError, extras.errorMessage);
  }

  downloadFile = (content, filename, contentType) =>
  {
    let data = content instanceof Blob ? content :
        new Blob([content], {type: contentType});
    let a = document.createElement('a');
    a.download = filename;
    a.href = window.URL.createObjectURL(data)
    a.dataset.downloadurl =
        [contentType, a.download, a.href].join(':');
    a.click();
    this.showWarning("");
  }

  showWarning = (warning) =>
  {
    let me = document.getElementById("message");
    me.innerHTML = warning;
    me.className = "message";
  }

  showErrorMessage = (error, message) =>
  {
    console.log(error);
    console.log(error.message);
    let me = document.getElementById("message");
    me.innerHTML = message ? message : error.message;
    me.className = "errorMessage";
    setTimeout(() => {this.showMessage({});}, 5000);
  }

  showMessage = (extras) =>
  {
    let msg = extras ? extras.successMessage : null;
    msg = msg ? msg : "";
    let me = document.getElementById("message");
    me.innerHTML = msg;
    me.className = "message";
    setTimeout(() => {this.showMessage({});}, 5000);
  }
}

const patchService = new PatchService();