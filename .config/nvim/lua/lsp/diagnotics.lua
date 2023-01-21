on_attach = require("lsp.attached")

return {
    on_attach = on_attach,
    filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact','svelte', 'css', 'less', 'scss', 'markdown', 'pandoc', 'html.twig' },
    init_options = {
        linters = {
            eslint = {
                command = 'eslint_d',
                rootPatterns = { '.git' },
                debounce = 100,
                args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
                sourceName = 'eslint_d',
                parseJson = {
                    errorsRoot = '[0].messages',
                    line = 'line',
                    column = 'column',
                    endLine = 'endLine',
                    endColumn = 'endColumn',
                    message = '[eslint] ${message} [${ruleId}]',
                    security = 'severity'
                },
                securities = {
                    [2] = 'error',
                    [1] = 'warning'
                }
            },
        },
        filetypes = {
            javascript = 'eslint',
            javascriptreact = 'eslint',
            typescript = 'eslint',
            typescriptreact = 'eslint',
        },
        formatters = {
            eslint_d = {
                command = 'eslint_d',
                args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
                rootPatterns = { '.git' },
            },
            prettier = {
                command = 'prettier',
                args = { '--stdin-filepath', '%filename' }
            },
        },
        formatFiletypes = {
            css = 'prettier',
            javascript = 'prettier',
            javascriptreact = 'prettier',
            json = 'prettier',
            scss = 'prettier',
            less = 'prettier',
            typescript = 'prettier',
            typescriptreact = 'prettier',
            json = 'prettier',
            markdown = 'prettier',
            svelte = 'prettier',
            ['html.twig'] = 'prettier',
        }
    }
}
