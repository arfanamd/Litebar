vim9script
# --------------------------------------------------------------
#  Plugin name:   Litebar
#  Maintainer:    arfanamd
#
#  License:
#  Distributed under the same terms as Vim itself.
#  See ":help license" in Vim.
# --------------------------------------------------------------

# Only load litebar once
if exists("g:litebar_loaded")
	finish
endif

g:litebar_loaded = true

# Color profile 1 for active buffer in dark background
hlset([{
 	'name':    'user1',
 	'ctermbg': '243',
 	'ctermfg': '15',
 	'cterm': { 'bold': v:true }
}])

# Color profile 2 for inactive buffer in dark background
hlset([{
 	'name':    'user2',
 	'ctermbg': '242',
 	'ctermfg': '250'
}])

# '%1*'        -> use color profile 1
# '%2.2n'      -> print the buffer number with right padding 2 characters
# '%-2M'       -> print '+' if buffer was edited
#                 print '-' if buffer is unmodifiable
# '<%{&syn}>'  -> print what syntax is being used for the buffer
# '%<%f%r%w '  -> print the relative path file, read-only?
# '%='f%r%w '  -> padding
# '%l,%v'      -> print line and column info
# '%-5P'       -> print buffer position info
# '%{&enc}'    -> print encoding info
# '%-5{&ff}'   -> print file format info
# '%*'         -> end use of color profile 1

def LiteActiveBuf(): string
	return '%1* %2.2n%-2M <%{&syn}>  %<%f%r%w %=%l,%v  %-5P%{&enc}  %-5{&ff}%*'
enddef

def LiteInactiveBuf(): string
	return '%2* %2.2n%-2M <%{&syn}>  %<%f%r%w %=%l,%v  %-5P%{&enc}  %-5{&ff}%*'
enddef

augroup Litebar
	autocmd!
	autocmd BufNewFile * setlocal statusline=%!LiteActiveBuf()
	autocmd BufEnter,WinEnter * setlocal statusline=%!LiteActiveBuf()
	autocmd BufLeave,WinLeave * setlocal statusline=%!LiteInactiveBuf()
augroup END

# vim:ft=vim:sw=2:ts=2
