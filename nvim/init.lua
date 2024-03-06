require('my.misc')
require('my.options')
require('my.augroups')
require('my.commands')
require('my.mappings')

require('plugins')
require('treesitter')
require('lsp')
require('vimtex')

-----------------------------------------------------------------------
--  Guide:
--
--  * Heirarchy: tabs > windows (aka panes) > buffers
--  * Creation:
--      - tab    : :tabe
--      - window : :sp, :vs
--      - buffers: :bad <file> or :args
--  * Kill:
--      - tab    : :tabc
--      - window : :q
--      - buffers: :bd, :bdN (or q! to close window and unload buffer)
--  * Movement:
--      - tab    : :tabn, :tabp, gt, gT, Ngt, :tabn N (custom map: tl, th, t1, t0)
--      - window : <C-w> hjkl
--      - buffers: :bn, :bp, :b <file>, :bN, :Nb, <C-^>
--  * Rearrange:
--      - tab    : :tabm
--      - window : <C-w> HJKL
--      - buffers: <navigate to win> :e
--
--  * netrw:
--      - open browser: :Lex, :Tex, :Rex (return)
--      - navi        : <c-r>, - (up), u (prev visited), U (subs visited)
--      - open files  : o (h down), v (v right), p (preview up), P (last window), t (new tab)
--      - file opers  : % (create file), d (create dir), D (del dir), R (rename dir)
--      - maps, bookmarks: TODO
--  * TODO: marks, registers
------------------------------------------------------------------------
