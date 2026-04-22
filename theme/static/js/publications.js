// @license magnet:?xt=urn:btih:1f739d935676111cfff4b4693e3816e664797050&dn=gpl-3.0.txt GPL-3.0

/* Activate the publication tabs */
function openTab(publication, tabName) {
    var i, x;
    x = document.getElementsByClassName(publication + "-tab");
    for (i = 0; i < x.length; i++) {
        x[i].classList.add("d-none");
    }
    document.getElementById(publication + "-" + tabName).classList.remove("d-none");
}

/* Copy to clipboard */
document.querySelectorAll('.copyable').forEach(function (container) {
  var btn = container.querySelector('.copy-btn');
  var icon = btn.querySelector('span');

  btn.addEventListener('click', function () {
    // Collect only the text nodes, excluding the button itself
    var text = Array.from(container.childNodes)
      .filter(function (node) {
        return node !== btn;
      })
      .map(function (node) {
        return node.textContent;
      })
      .join('');

    navigator.clipboard.writeText(text.trim()).then(function () {
      icon.classList.replace('mdi-content-copy', 'mdi-check');
      btn.classList.add('copied');
      setTimeout(function () {
        icon.classList.replace('mdi-check', 'mdi-content-copy');
        btn.classList.remove('copied');
      }, 2000);
    });
  });
});

// @license-end
