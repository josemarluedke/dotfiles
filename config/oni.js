// For more information on customizing Oni, check out our wiki page:
// https://github.com/extr0py/oni/wiki/Configuration

const activate = oni => {
  oni.input.unbind('<tab>');
};

module.exports = {
  activate,
  'experimental.markdownPreview.enabled': false,
  'experimental.editor.textMateHighlighting.enabled': false,

  'ui.colorscheme': 'base16-nord',
  'autoClosingPairs.enabled': false,
  'oni.useDefaultConfig': false,
  'editor.fontSize': '14px',
  'editor.fontFamily': 'Menlo',
  'editor.linePadding': 4,
  'tabs.mode': 'tabs',
  'tabs.showIndex': true,
  'oni.exclude': [
    '**/node_modules/**',
    '**/dist/**',
    '**/tmp/**',
    '**/vendor/**'
  ]
};
