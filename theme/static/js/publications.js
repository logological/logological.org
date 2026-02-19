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

// @license-end
