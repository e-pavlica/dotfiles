return {
  cmd = { 'deno', 'lsp' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'javascript.jsx',
    'typescript.tsx',
  },
  root_markers = { 'deno.json' }
  -- single_file_support = true,
  -- init_options = {
  --   lint = true,
  --   unstable = true,
  --   suggest = {
  --     autoImports = true,
  --     names = true,
  --     paths = true,
  --     pathsWithPackageJson = true,
  --     completeFunctionCalls = true,
  --   },
  --   enable = true,
  -- },
}
