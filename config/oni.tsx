// For more information on customizing Oni, check out our wiki page:
// https://github.com/extr0py/oni/wiki/Configuration

import * as React from '/Applications/Oni.app/Contents/Resources/app/node_modules/react';
import * as Oni from '/Applications/Oni.app/Contents/Resources/app/node_modules/oni-api';

export const activate = (oni: Oni.Plugin.Api) => {
  const isNormalMode = () => oni.editors.activeEditor.mode === 'normal';

  oni.input.unbind('<tab>');
  // oni.input.bind(',m', 'explorer.toggle');
  // oni.input.bind('t', 'quickOpen.show', isNormalMode);
}

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log('config deactivated');
}

export const configuration = {
  'experimental.indentLines.enabled': false,
  'experimental.markdownPreview.enabled': false,
  'experimental.preview.enabled': false,
  'experimental.particles.enabled': false,
  'experimental.colorHighlight.enabled': false,
  'experimental.vcs.sidebar': false,
  'experimental.vcs.blame.enabled': false,
  'editor.fontLigatures': false,

  'editor.textMateHighlighting.enabled': false,
  // 'editor.renderer': 'webgl',
  'explorer.autoRefresh': false,

  'sidebar.default.open': false,
  'ui.colorscheme': 'OceanicNext',
  // 'ui.colorscheme': 'gruvbox_dark',
  'autoClosingPairs.enabled': false,
  'oni.useDefaultConfig': false,
  'editor.fontSize': '15px',
  'editor.fontFamily': 'Fira Code',
  'editor.linePadding': 4,
  'editor.quickOpen.defaultOpenMode': 4,
  'tabs.mode': 'tabs',
  'tabs.showIndex': true,
  'oni.exclude': [
    '**/.git/**',
    '**/node_modules/**',
    '**/dist/**',
    '**/tmp/**',
    '**/vendor/**'
  ],

  'language.go.languageServer.rootFiles': ['.git'], // In a git repository
  'language.go.languageServer.command': 'go-langserver',
  'language.go.languageServer.arguments': [
    '-gocodecompletion'
  ],

  // 'language.elixir.languageServer.command': '/Users/josemarluedke/code/elixir/elixir-ls/language_server.sh',
  // 'language.elixir.languageServer.arguments': ['--stdio'],
  // 'language.elixir.languageServer.rootFiles': ['mix.exs'],
  // 'language.elixir.languageServer.configuration': {}

  'environment.additionalPaths': [
    '/usr/bin',
    '/usr/local/bin',
    '/Users/josemarluedke/code/go/bin'
  ]
}
