window.addEventListener('load-gpt-ad', (e) => {
  const { divId, slot, width, height } = e.detail;

  window.googletag = window.googletag || { cmd: [] };
  googletag.cmd.push(() => {
    const checkDiv = () => {
      const div = document.getElementById(divId);
      if (div) {
        googletag.defineSlot(slot, [width, height], divId).addService(googletag.pubads());
        googletag.enableServices();
        googletag.display(divId);
      } else {
        setTimeout(checkDiv, 100);
      }
    };
    checkDiv();
  });
});