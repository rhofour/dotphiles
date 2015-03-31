runtime syntax/tex.vim
unlet b:current_syntax
 
syntax include @matlabnowebCode syntax/matlab.vim
syntax region matlabnowebChunk matchgroup=matlabnowebDelimiter start="^<<.*>>=" matchgroup=matlabnowebDelimiter end="^@" contains=@matlabnowebCode keepend
 
let b:current_syntax="matlabnoweb"
