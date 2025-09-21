

==============================================================================
vim.lsp:                                     require("vim.lsp.health").check()

- LSP log level : WARN
- Log path: /home/bibarys/.local/state/nvim/lsp.log
- Log size: 0 KB

vim.lsp: Active Clients ~
- No active clients

vim.lsp: Enabled Configurations ~
- cssls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "vscode-css-language-server", "--stdio" }
  - filetypes: css, scss, less
  - init_options: {
      provideFormatter = true
    }
  - root_markers: package.json, .git
  - settings: {
      css = {
        validate = true
      },
      less = {
        validate = true
      },
      scss = {
        validate = true
      }
    }

- emmet_ls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "emmet-ls", "--stdio" }
  - filetypes: html, typescriptreact, javascriptreact, css, sass, scss, less, svelte
  - root_markers: .git

- eslint:
  - before_init: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/eslint.lua:157>
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "vscode-eslint-language-server", "--stdio" }
  - filetypes: html, typescriptreact, javascriptreact, css, sass, scss, less, svelte
  - handlers: {
      ["eslint/confirmESLintExecution"] = <function 1>,
      ["eslint/noLibrary"] = <function 2>,
      ["eslint/openDoc"] = <function 3>,
      ["eslint/probeFailed"] = <function 4>
    }
  - on_attach: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/eslint.lua:76>
  - root_dir: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/eslint.lua:89>
  - settings: {
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = "separateLine"
        },
        showDocumentation = {
          enable = true
        }
      },
      codeActionOnSave = {
        enable = false,
        mode = "all"
      },
      experimental = {
        useFlatConfig = false
      },
      format = true,
      nodePath = "",
      onIgnoredFiles = "off",
      problems = {
        shortenToSingleLine = false
      },
      quiet = false,
      rulesCustomizations = {},
      run = "onType",
      useESLintClass = false,
      validate = "on",
      workingDirectory = {
        mode = "auto"
      }
    }
  - workspace_required: true

- graphql:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "graphql-lsp", "server", "-m", "stream" }
  - filetypes: graphql, gql, svelte, typescriptreact, javascriptreact
  - root_dir: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/graphql.lua:19>

- html:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "vscode-html-language-server", "--stdio" }
  - filetypes: html, templ
  - init_options: {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = true
    }
  - root_markers: package.json, .git
  - settings: {}

- lua_ls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "lua-language-server" }
  - filetypes: lua
  - root_markers: .luarc.json, .luarc.jsonc, .luacheckrc, .stylua.toml, stylua.toml, selene.toml, selene.yml, .git
  - settings: {
      Lua = {
        completion = {
          callSnippet = "Replace"
        },
        diagnostics = {
          globals = { "vim" }
        }
      }
    }

- prismals:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "prisma-language-server", "--stdio" }
  - filetypes: prisma
  - root_markers: .git, package.json
  - settings: {
      prisma = {
        prismaFmtBinPath = ""
      }
    }

- pyright:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "pyright-langserver", "--stdio" }
  - filetypes: python
  - on_attach: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/pyright.lua:45>
  - root_markers: pyproject.toml, setup.py, setup.cfg, requirements.txt, Pipfile, pyrightconfig.json, .git
  - settings: {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true
        }
      }
    }

- stylua:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "stylua", "--lsp" }
  - filetypes: lua
  - root_markers: .stylua.toml, stylua.toml

- svelte:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "svelteserver", "--stdio" }
  - filetypes: svelte
  - on_attach: <function @/home/bibarys/.config/nvim/lua/josean/plugins/lsp/lspconfig.lua:82>
  - root_dir: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/svelte.lua:16>

- tailwindcss:
  - before_init: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/tailwindcss.lua:98>
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "tailwindcss-language-server", "--stdio" }
  - filetypes: aspnetcorerazor, astro, astro-markdown, blade, clojure, django-html, htmldjango, edge, eelixir, elixir, ejs, erb, eruby, gohtml, gohtmltmpl, haml, handlebars, hbs, html, htmlangular, html-eex, heex, jade, leaf, liquid, markdown, mdx, mustache, njk, nunjucks, php, razor, slim, twig, css, less, postcss, sass, scss, stylus, sugarss, javascript, javascriptreact, reason, rescript, typescript, typescriptreact, vue, svelte, templ
  - root_dir: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/tailwindcss.lua:110>
  - settings: {
      tailwindCSS = {
        classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
        includeLanguages = {
          eelixir = "html-eex",
          elixir = "phoenix-heex",
          eruby = "erb",
          heex = "phoenix-heex",
          htmlangular = "html",
          templ = "html"
        },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning"
        },
        validate = true
      }
    }
  - workspace_required: true

- ts_ls:
  - capabilities: {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "additionalTextEdits", "insertTextFormat", "insertTextMode", "command" }
            },
            snippetSupport = true,
            tagSupport = {
              valueSet = { 1 }
            }
          },
          completionList = {
            itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    }
  - cmd: { "typescript-language-server", "--stdio" }
  - commands: {
      ["editor.action.showReferences"] = <function 1>
    }
  - filetypes: javascript, javascriptreact, javascript.jsx, typescript, typescriptreact, typescript.tsx
  - handlers: {
      ["_typescript.rename"] = <function 1>
    }
  - init_options: {
      hostInfo = "neovim"
    }
  - on_attach: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/ts_ls.lua:111>
  - root_dir: <function @/home/bibarys/.local/share/nvim/lazy/nvim-lspconfig/lsp/ts_ls.lua:56>


vim.lsp: File Watcher ~
- file watching "(workspace/didChangeWatchedFiles)" disabled on all clients

vim.lsp: Position Encodings ~
- No active clients
