/* Activate the publication tabs */
function openTab(publication, tabName) {
    var i, x;
    x = document.getElementsByClassName(publication + "-tab");
    for (i = 0; i < x.length; i++) {
        x[i].classList.add("d-none");
    }
    document.getElementById(publication + "-" + tabName).classList.remove("d-none");
}
