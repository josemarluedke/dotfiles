// For more information on customizing Oni, check out our wiki page:
// https://github.com/extr0py/oni/wiki/Configuration

import * as React from '/Applications/Oni.app/Contents/Resources/app/node_modules/react';
import * as Oni from '/Applications/Oni.app/Contents/Resources/app/node_modules/oni-api';

export const activate = (oni: Oni.Plugin.Api) => {
  const isNormalMode = () => oni.editors.activeEditor.mode === 'normal';

  oni.input.unbind('<tab>');
  // oni.input.bind(',m', 'explorer.toggle');
  // oni.input.bind('t', 'quickOpen.show', isNormalMode);
};

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log('config deactivated');
};

export const configuration = {
  'experimental.indentLines.enabled': true,
  'experimental.markdownPreview.enabled': false,
  'editor.textMateHighlighting.enabled': true,
  'editor.renderer': 'webgl',
  'explorer.autoRefresh': false,

  'ui.colorscheme': 'gruvbox_dark',
  'autoClosingPairs.enabled': false,
  'oni.useDefaultConfig': false,
  'editor.fontSize': '14px',
  'editor.fontFamily': 'Menlo',
  'editor.linePadding': 4,
  "editor.quickOpen.defaultOpenMode": 4,
  'tabs.mode': 'tabs',
  'tabs.showIndex': true,
  'oni.exclude': [
    '**/.git/**',
    '**/node_modules/**',
    '**/dist/**',
    '**/tmp/**',
    '**/vendor/**'
  ],

  'environment.additionalPaths': [
    '/usr/bin',
    '/usr/local/bin',
    '/Users/josemarluedke/code/go/bin'
  ]
};
