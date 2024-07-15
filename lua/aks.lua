-- Clear and reset.
vim.cmd "highlight clear"

if vim.g.syntax_on ~= nil then
    vim.cmd "syntax reset"
end

vim.g.colors_name = "aks"

-- Aks Dark Variant
local dark = {
    -- Shades, going from darkest (0) to lightest (7).
    shade0  = "#17171C",
    shade1  = "#222430",
    shade2  = "#3E4856",
    shade3  = "#5B697B",
    shade4  = "#CBD1EC",
    shade5  = "#DADEF1",
    shade6  = "#E5E9F0",
    shade7  = "#ECEFF4",

    -- Red
    accent0 = "#EF476F",
    -- Orange
    accent1 = "#FE995E",
    -- Yellow
    accent2 = "#FADD5C",
    -- Green
    accent3 = "#66DB8D",
    -- Cyan
    accent4 = "#4ECDC4",
    -- Blue
    accent5 = "#5596F7",
    -- Pink
    accent6 = "#FC56B1",
    -- Purple
    accent7 = "#A972FF",

    -- Auxiliary colors, both bluish.
    aux0    = "#0D3556",
    aux1    = "#071A4C"
}

-- Aks Light Variant
local light = {
    -- Shades, going from lightest (0) to darkest (7).
    shade0  = "#F2F4F7",
    shade1  = "#E2E6F7",
    shade2  = "#CBD1EC",
    shade3  = "#ABB3CA",
    shade4  = "#5B697B",
    shade5  = "#3E4856",
    shade6  = "#222430",
    shade7  = "#17171C",
    accent0 = "#FF1D4E",
    accent1 = "#FC8E4E",
    accent2 = "#E1B900",
    accent3 = "#00D948",
    accent4 = "#00C2C2",
    accent5 = "#0066FF",
    accent6 = "#FF0099",
    accent7 = "#8F00FF",
    aux0    = "#BDE0FE",
    aux1    = "#DFF7FF"
}

-- Choose variant
local use_light = vim.g.aks_variant == "light"
local var = use_light and light or dark

-- Overrides
local ovr = vim.g.aks_overrides or {}

-- UI Shades
local background = ovr.background or var.shade0
local foreground = ovr.foreground or var.shade5
local comment    = ovr.comment    or var.shade3
local gutter     = ovr.gutter     or var.shade2
local menu       = ovr.menu       or var.shade1
local winsep     = ovr.winsep     or var.shade3
local selection  = ovr.selection  or var.aux0

-- Colors
local red    = ovr.red    or var.accent0
local orange = ovr.orange or var.accent1
local yellow = ovr.yellow or var.accent2
local green  = ovr.green  or var.accent3
local cyan   = ovr.cyan   or var.accent4
local blue   = ovr.blue   or var.accent5
local pink   = ovr.pink   or var.accent6
local purple = ovr.purple or var.accent7

-- Whether to hide the tildes marking end of buffer
local hide_bufend = vim.g.aks_hide_endofbuffer or false

-- Whether to use italics or not
local use_italics = vim.g.aks_use_italics or true

-- Util function to highlight groups.
local function hi(group, style)
    if not use_italics then
        if style.gui and style.gui == "italic" then
            style.gui = nil
        end
    end

    -- Build attr-list.
    local attrs = " "
    attrs = attrs .. "guifg=" .. (style.fg  or "NONE") .. " "
    attrs = attrs .. "guibg=" .. (style.bg  or "NONE") .. " "
    attrs = attrs .. "guisp=" .. (style.sp  or "NONE") .. " "
    attrs = attrs .. "gui="   .. (style.gui or "NONE") .. " "

    vim.cmd("highlight " .. group .. attrs)
end

-- Syntax Groups (descriptions and ordering from `:h w18`)
hi("Comment",        { fg = comment, gui = "italic" })

hi("Constant",       { fg = orange })
hi("String",         { fg = green })
hi("Character",      { fg = cyan })
hi("Number",         { fg = yellow })
hi("Boolean",        { fg = yellow })
hi("Float",          { fg = yellow })

hi("Identifier",     { fg = blue })
hi("Function",       { fg = blue })

hi("Statement",      { fg = purple })
hi("Conditional",    { fg = purple })
hi("Repeat",         { fg = purple })
hi("Label",          { fg = purple })
hi("Operator",       { fg = purple })
hi("Keyword",        { fg = purple })
hi("Exception",      { fg = purple })

hi("PreProc",        { fg = pink })
hi("Include",        { fg = pink })
hi("Define",         { fg = pink })
hi("Macro",          { fg = pink })
hi("PreCondit",      { fg = pink })

hi("Type",           { fg = orange })
hi("StorageClass",   { fg = orange })
hi("Structure",      { fg = orange })
hi("Typedef",        { fg = orange })

hi("Special",        { fg = blue })
hi("SpecialChar",    { fg = orange })
hi("Tag",            {})
hi("Delimiter",      {})
hi("SpecialComment", { fg = comment })
hi("Debug",          {})

hi("Underlined",     { gui = "underline" })
hi("Ignore",         {})
hi("Error",          { fg = red })
hi("Todo",           { fg = purple })

-- Highlighting Groups (descriptions and ordering from `:h highlight-groups`)
hi("ColorColumn",  { bg = var.shade1 })
hi("Conceal",      {})
hi("CurSearch",    { fg = background, bg = yellow, gui = "underline" })
hi("Cursor",       { fg = background })
hi("lCursor",      { fg = background })
hi("CursorIM",     {})
hi("CursorColumn", { bg = var.shade1 })

if vim.opt.diff:get() then
  hi("CursorLine", { gui = "underline" })
else
  hi("CursorLine", { bg = var.shade1 })
end

hi("Directory",  { fg = blue })
hi("DiffAdd",    { fg = green })
hi("DiffChange", { fg = orange })
hi("DiffDelete", { fg = red })
hi("DiffText",   { fg = orange, gui = "underline" })

if hide_bufend then
    hi("EndOfBuffer", { fg = background })
else
    hi("EndOfBuffer", { fg = gutter })
end

hi("TermCursor",       { bg = blue })
hi("TermCursorNC",     { bg = comment })
hi("ErrorMsg",         { fg = red })
hi("WinSeparator",     { fg = winsep })
hi("Folded",           { fg = comment })
hi("FoldColumn",       {})
hi("SignColumn",       {})
hi("IncSearch",        { fg = yellow,     bg = comment })
hi("Substitute",       { fg = background, bg = yellow })
hi("LineNr",           { fg = gutter })
hi("LineNrAbove",      {})
hi("LineNrBelow",      {})
hi("CursorLineNr",     { fg = var.shade4 })
hi("CursorLineFold",   { fg = var.shade4 })
hi("CursorLineSign",   { fg = var.shade4 })
hi("MatchParen",       { fg = blue, gui = "underline" })
hi("ModeMsg",          { fg = pink })
hi("MsgArea",          { fg = yellow })
hi("MsgSeparator",     { fg = purple })
hi("MoreMsg",          { fg = purple })
hi("NonText",          { fg = var.shade2 })
hi("Normal",           { fg = foreground, bg = background })
hi("NormalFloat",      { fg = foreground, bg = var.shade1 })
hi("FloatBorder",      { fg = blue,       bg = var.shade1 })
hi("FloatTitle",       { fg = var.shade1, bg = blue })
hi("NormalNC",         {})
hi("Pmenu",            { fg = foreground, bg = menu })
hi("PmenuSel",         { fg = background, bg = blue })
hi("PmenuKind",        { fg = yellow,     bg = blue })
hi("PmenuKindSel",     { fg = orange,     bg = blue })
hi("PmenuExtra",       { fg = foreground, bg = background })
hi("PmenuExtraSel",    { fg = foreground, bg = background })
hi("PmenuSbar",        { bg = menu })
hi("PmenuThumb",       { bg = selection })
hi("Question",         { fg = purple })
hi("QuickFixLine",     { fg = background, bg = yellow })
hi("Search",           { fg = background, bg = yellow })
hi("SpecialKey",       { fg = var.shade4 })
hi("SpellBad",         { fg = red, gui = "underline" })
hi("SpellCap",         { fg = orange })
hi("SpellLocal",       { fg = orange })
hi("SpellRare",        { fg = orange })
hi("StatusLine",       { fg = foreground, bg = background })
hi("StatusLineNC",     { fg = comment })
hi("TabLine",          { fg = comment })
hi("TabLineFill",      {})
hi("TabLineSel",       { fg = foreground })
hi("Title",            { fg = green })
hi("Visual",           { bg = selection })
hi("VisualNOS",        { bg = selection })
hi("WarningMsg",       { fg = yellow })
hi("Whitespace",       { fg = gutter })
hi("WildMenu",         { fg = background, bg = blue })
hi("WinBar",           { fg = foreground, bg = background })
hi("WinBarNC",         { fg = comment })

-- Diagnostic Groups (descriptions and ordering from `:h vim.diagnostic`)
hi("DiagnosticError",            { fg = red })
hi("DiagnosticWarn",             { fg = yellow })
hi("DiagnosticInfo",             { fg = blue })
hi("DiagnosticHint",             { fg = cyan })
hi("DiagnosticVirtualTextError", { fg = red,    bg = background  })
hi("DiagnosticVirtualTextWarn",  { fg = yellow, bg = background  })
hi("DiagnosticVirtualTextInfo",  { fg = blue,   bg = background  })
hi("DiagnosticVirtualTextHint",  { fg = cyan,   bg = background  })
hi("DiagnosticUnderlineError",   { fg = red,    gui = "underline" })
hi("DiagnosticUnderlineWarn",    { fg = yellow, gui = "underline" })
hi("DiagnosticUnderlineInfo",    { fg = blue,   gui = "underline" })
hi("DiagnosticUnderlineHint",    { fg = cyan,   gui = "underline", })
hi("DiagnosticFloatingError",    { fg = red })
hi("DiagnosticFloatingWarn",     { fg = yellow })
hi("DiagnosticFloatingInfo",     { fg = blue })
hi("DiagnosticFloatingHint",     { fg = cyan })
hi("DiagnosticSignError",        { fg = red })
hi("DiagnosticSignWarn",         { fg = yellow })
hi("DiagnosticSignInfo",         { fg = blue })
hi("DiagnosticSignHint",         { fg = cyan })

-- Must appear at the end of the file to work around this oddity:
-- https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
vim.o.background = use_light and "light" or "dark"

-- Expose highlight function
return { hi = hi, colors = var }
