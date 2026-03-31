window.MathJax = {
  tex: {
    inlineMath: [["\\(", "\\)"]],
    displayMath: [["\\[", "\\]"]],
    processEscapes: true,
    processEnvironments: true
  },
  options: {
    ignoreHtmlClass: ".*",
    processHtmlClass: "arithmatex"
  }
};

document.addEventListener("DOMContentLoaded", function() {
    // Escuchar cambios de MkDocs para re-renderizar si es necesario
    if (typeof MathJax !== 'undefined') {
        MathJax.typesetPromise();
    }
});