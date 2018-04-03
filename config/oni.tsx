// For more information on customizing Oni, check out our wiki page:
// https://github.com/extr0py/oni/wiki/Configuration

import * as React from "/Applications/Oni.app/Contents/Resources/app/node_modules/react"
import * as Oni from "/Applications/Oni.app/Contents/Resources/app/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
  oni.input.unbind('<tab>');
}

export const deactivate = (oni: Oni.Plugin.Api) => {
  console.log("config deactivated")
}

export const configuration = {
  'experimental.markdownPreview.enabled': false,
  'experimental.edittextMateHighlighting.enabled': false,

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
  ],

  "environment.additionalPaths": [
    "/usr/bin",
    "/usr/local/bin",
    "/Users/josemarluedke/code/go/bin"
  ]
}
