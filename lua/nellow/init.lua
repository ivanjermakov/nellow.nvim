local variants = require("nellow.colors")
local utils = require("nellow.utils")
local cfg = require("nellow.config").config
local c = variants[cfg.variant]
local M = {}

local set_terminal_colors = function()
    vim.g.terminal_color_0 = c.black
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.yellow
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.magenta
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.white
    vim.g.terminal_color_8 = c.black
    vim.g.terminal_color_9 = c.red
    vim.g.terminal_color_10 = c.green
    vim.g.terminal_color_11 = c.yellow
    vim.g.terminal_color_12 = c.blue
    vim.g.terminal_color_13 = c.magenta
    vim.g.terminal_color_14 = c.cyan
    vim.g.terminal_color_15 = c.white
    vim.g.terminal_color_background = c.bg
    vim.g.terminal_color_foreground = c.fg
end

local set_groups = function()
    local highlights = {
        -- Syntax Groups (descriptions and ordering from `:h w18`)
        { hg = "Comment",                     fg = c.gray06 },     -- any comment
        { hg = "Constant",                    fg = c.white },      -- any constant
        { hg = "String",                      fg = c.green },      -- a string constant: "this is a string"
        { hg = "Character",                   fg = c.green },      -- a character constant: 'c', '\n'
        { hg = "Number",                      fg = c.yellow },     -- a number constant: 234, 0xff
        { hg = "Boolean",                     fg = c.yellow },     -- a boolean constant: TRUE, false
        { hg = "Float",                       fg = c.magenta },    -- a floating point constant: 2.3e10
        { hg = "Identifier",                  fg = c.fg },         -- any variable name
        { hg = "Function",                    fg = c.fg },         -- function name (also: methods for classes)
        { hg = "Statement",                   fg = c.fg },         -- any statement
        { hg = "Conditional",                 fg = c.cyan },       -- if, then, else, endif, switch, etc.
        { hg = "Repeat",                      fg = c.cyan },       -- for, do, while, etc.
        { hg = "Label",                       fg = c.cyan },       -- case, default, etc.
        { hg = "Operator",                    fg = c.fg },         -- sizeof", "+", "*", etc.
        { hg = "Keyword",                     fg = c.cyan },       -- any other keyword
        { hg = "Exception",                   fg = c.cyan },       -- try, catch, throw
        { hg = "PreProc",                     fg = c.cyan },       -- generic Preprocessor
        { hg = "Include",                     fg = c.cyan },       -- preprocessor #include
        { hg = "Define",                      fg = c.cyan },       -- preprocessor #define
        { hg = "Macro",                       fg = c.cyan },       -- same as Define
        { hg = "PreCondit",                   fg = c.cyan },       -- preprocessor #if, #else, #endif, etc.
        { hg = "Type",                        fg = c.fg },         -- int, long, char, etc.
        { hg = "StorageClass",                fg = c.white },      -- static, register, volatile, etc.
        { hg = "Structure",                   fg = c.white },      -- struct, union, enum, etc.
        { hg = "Typedef",                     fg = c.white },      -- A typedef
        { hg = "Special",                     fg = c.cyan },       -- any special symbol
        { hg = "SpecialChar",                 fg = c.yellow },     -- special character in a constant
        { hg = "Tag",                         fg = c.yellow },     -- you can use CTRL-] on this
        { hg = "Delimiter" },                                      -- character that needs attention
        { hg = "SpecialComment",              fg = c.gray07 },     -- special things inside a comment
        { hg = "Debug" },                                          -- debugging statements
        { hg = "Underlined",                  gui = "underline" }, -- text that stands out, HTML links
        { hg = "Ignore" },                                         -- left blank, hidden
        { hg = "Error",                       fg = c.red },        -- any erroneous construct
        { hg = "Todo",                        fg = c.yellow },     -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
        { hg = "ColorColumn",                 bg = c.gray03 },                         -- used for the columns set with 'colorcolumn'
        { hg = "Conceal" },                                                            -- placeholder characters substituted for concealed text (see 'conceallevel')
        { hg = "Cursor",                      fg = c.black,       bg = c.white },      -- the character under the cursor
        { hg = "CursorIM" },                                                           -- like Cursor, but used when in IME mode
        { hg = "CursorLine",                  bg = c.gray01 },                         -- the screen line that the cursor is in when 'cursorline' is set
        { hg = "Directory",                   fg = c.cyan },                           -- directory names (and other special names in listings)
        { hg = "DiffAdd",                     bg = c.green,       fg = c.black },      -- diff mode: Added line
        { hg = "DiffChange",                  fg = c.yellow,      gui = "underline" }, -- diff mode: Changed line
        { hg = "DiffDelete",                  bg = c.red,         fg = c.black },      -- diff mode: Deleted line
        { hg = "DiffText",                    bg = c.yellow,      fg = c.black },      -- diff mode: Changed text within a changed line
        { hg = "ErrorMsg",                    fg = c.red },                            -- error messages on the command line
        { hg = "VertSplit",                   fg = c.gray02 },                         -- the column separating vertically split windows
        { hg = "Folded",                      fg = c.gray04 },                         -- line used for closed folds
        { hg = "FoldColumn" },                                                         --' foldcolumn'
        { hg = "SignColumn" },                                                         -- column where signs are displayed
        { hg = "IncSearch",                   fg = c.yellow,      bg = c.gray03 },     --' incsearch' highlighting; also used for the text replaced with ":s///c"
        { hg = "LineNr",                      fg = c.gray04 },                         -- Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        { hg = "CursorLineNr",                fg = c.gray04 },                         -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        { hg = "MatchParen",                  fg = c.yellow, },                        -- The character under the cursor or just before it, if it is a paired bracket, and its match.
        { hg = "ModeMsg" },                                                            --' showmode' message (e.g., "-- INSERT --")
        { hg = "MoreMsg" },                                                            -- more-prompt
        { hg = "NonText",                     fg = c.gray02 },                         --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
        { hg = "Normal",                      fg = c.fg,          bg = cfg.transparent and c.none or c.bg },
        { hg = "NormalFloat",                 bg = c.gray02 },
        { hg = "FloatBorder",                 fg = c.gray03 },
        { hg = "Pmenu",                       fg = c.white,       bg = c.gray02 },     -- Popup menu: normal item.
        { hg = "PmenuSel",                    fg = c.white,       bg = c.gray04 },     -- Popup menu: selected item.
        { hg = "PmenuSbar",                   bg = c.gray02 },                         -- Popup menu: scrollbar.
        { hg = "PmenuThumb",                  bg = c.gray03 },                         -- Popup menu: Thumb of the scrollbar.
        { hg = "Question",                    fg = c.cyan },                           -- hit-enter prompt and yes/no questions
        { hg = "QuickFixLine",                fg = c.cyan,        bg = c.gray02 },     -- Current quickfix item in the quickfix window.
        { hg = "Search",                      fg = c.yellow,      bg = c.black },      -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
        { hg = "SpecialKey",                  fg = c.special_grey },                   -- Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
        { hg = "SpellBad",                    fg = c.red,         gui = "underline" }, -- Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
        { hg = "SpellCap",                    fg = c.yellow },                         -- Word that should start with a capital. This will be combined with the highlighting used otherwise.
        { hg = "SpellLocal",                  fg = c.yellow },                         -- Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
        { hg = "SpellRare",                   fg = c.yellow },                         -- Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
        { hg = "StatusLine",                  fg = c.white, },                         -- status line of current window
        { hg = "StatusLineNC",                fg = c.gray05 },                         -- status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        { hg = "StatusLineTerm",              fg = c.white, },                         -- status line of current :terminal window
        { hg = "StatusLineTermNC",            fg = c.gray05 },                         -- status line of non-current  =terminal window
        { hg = "TabLine",                     fg = c.gray05 },                         -- tab pages line, not active tab page label
        { hg = "TabLineFill" },                                                        -- tab pages line, where there are no labels
        { hg = "TabLineSel",                  fg = c.white },                          -- tab pages line, active tab page label
        { hg = "Terminal",                    fg = c.fg,          bg = c.black },      -- terminal window (see terminal-size-color)
        { hg = "Title",                       fg = c.green },                          -- titles for output from " =set all", ":autocmd" etc.
        { hg = "Visual",                      bg = c.gray03 },                         -- Visual mode selection
        { hg = "VisualNOS",                   bg = c.gray03 },                         -- Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
        { hg = "WarningMsg",                  fg = c.yellow },                         -- warning messages
        { hg = "WildMenu",                    fg = c.black,       bg = c.cyan },       -- current match in 'wildmenu' completion
        { hg = "Winbar",                      fg = c.white,       bg = c.gray01 },     -- Winbar
        { hg = "WinbarNC",                    fg = c.gray05,      bg = c.bg_dark },    -- Winbar non-current windows.
        { hg = "WinSeparator",                fg = c.gray02 },

        -- Tree sitter
        { hg = "@boolean",                    fg = c.yellow,      gui = cfg.boolean_style },
        { hg = "@number",                     fg = c.yellow },
        { hg = "@constructor",                fg = c.fg },
        { hg = "@constant.builtin",           fg = c.fg },
        { hg = "@namespace",                  fg = c.fg,          gui = "italic" },
        { hg = "@parameter",                  fg = c.fg },
        { hg = "@property",                   fg = c.fg },
        { hg = "@punctuation",                fg = c.fg },
        { hg = "@punctuation.delimiter",      fg = c.fg },
        { hg = "@punctuation.bracket",        fg = c.fg },
        { hg = "@symbol",                     fg = c.fg },
        { hg = "@tag",                        fg = c.cyan },
        { hg = "@tag.attribute",              fg = c.fg,          gui = "italic" },
        { hg = "@tag.delimiter",              fg = c.fg },
        { hg = "@type",                       fg = c.fg },
        { hg = "@variable",                   fg = c.fg,          gui = cfg.variable_style },

        -- Diagnostics
        { hg = "DiagnosticError",             fg = c.red },
        { hg = "DiagnosticWarn",              fg = c.yellow },
        { hg = "DiagnosticInfo",              fg = c.cyan },
        { hg = "DiagnosticHint",              fg = c.gray05 },
        { hg = "DiagnosticUnderlineError",    gui = "undercurl",  guisp = c.red },
        { hg = "DiagnosticUnderlineWarn",     gui = "undercurl",  guisp = c.yellow },
        { hg = "DiagnosticUnderlineInfo",     gui = "undercurl",  guisp = c.cyan },
        { hg = "DiagnosticUnderlineHint",     gui = "undercurl",  guisp = c.cyan },

        -- Neovim's built-in language server client
        { hg = "LspReferenceWrite",           bg = c.gray03 },
        { hg = "LspReferenceText",            bg = c.gray03 },
        { hg = "LspReferenceRead",            bg = c.gray03 },
        { hg = "LspSignatureActiveParameter", bg = c.gray03 },

        -- GitSigns
        { hg = "GitSignsAdd",                 fg = c.green },
        { hg = "GitSignsChange",              fg = c.yellow },
        { hg = "GitSignsDelete",              fg = c.red },

        -- Diff
        { hg = "diffAdded",                   fg = c.green },
        { hg = "diffRemoved",                 fg = c.red },
        { hg = "diffChanged",                 fg = c.yellow },
        { hg = "diffOldFile",                 fg = c.gray04 },
        { hg = "diffNewFile",                 fg = c.white },
        { hg = "diffFile",                    fg = c.gray05 },
        { hg = "diffLine",                    fg = c.cyan },
        { hg = "diffIndexLine",               fg = c.magenta },

        -- Hop
        { hg = "HopNextKey",                  fg = c.yellow },
        { hg = "HopNextKey1",                 fg = c.cyan },
        { hg = "HopNextKey2",                 fg = c.cyan },
        { hg = "HopUnmatched",                fg = c.gray04 },
        { hg = "HopCursor",                   fg = c.cyan },
        { hg = "HopPreview",                  fg = c.cyan },

        -- Cmp
        { hg = "CmpItemAbbrDeprecated",       fg = c.gray06,      gui = "strikethrough" },
        { hg = "CmpItemAbbrMatch",            fg = c.cyan,        gui = "bold" },
        { hg = "CmpItemAbbrMatchFuzzy",       fg = c.cyan,        gui = "bold" },
        { hg = "CmpItemMenu",                 fg = c.gray05 },
        { hg = "CmpItemKindText",             fg = c.gray06 },
        { hg = "CmpItemKindFunction",         fg = c.cyan },
        { hg = "CmpItemKindVariable",         fg = c.white },
        { hg = "CmpItemKindEnum",             fg = c.green },
        { hg = "CmpItemKindSnippet",          fg = c.yellow },
    }

    utils.highlight(highlights)
end

M.colorscheme = function()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.o.termguicolors = true
    vim.g.colors_name = "nellow"

    set_terminal_colors()
    set_groups()
end

return M
