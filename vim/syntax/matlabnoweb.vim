if exists("b:current_syntax")
  finish
endif

syn case match

runtime syntax/tex.vim
unlet b:current_syntax

syn cluster texMatchGroup add=@matlabnoweb
syn cluster texEnvGroup add=@matlabnoweb
syn cluster texFoldGroup add=@matlabnoweb
syn cluster texDocGroup		add=@matlabnoweb
syn cluster texPartGroup		add=@matlabnoweb
syn cluster texChapterGroup		add=@matlabnoweb
syn cluster texSectionGroup		add=@matlabnoweb
syn cluster texSubSectionGroup		add=@matlabnoweb
syn cluster texSubSubSectionGroup	add=@matlabnoweb
syn cluster texParaGroup		add=@matlabnoweb
 
syn include @matlabnowebCode syntax/matlab.vim
syn region matlabnowebChunk matchgroup=matlabnowebDelimiter start="^<<.*>>=" matchgroup=matlabnowebDelimiter end="^@" contains=@matlabnowebCode keepend

" Cluster everything under matlabnoweb
syn cluster matlabnoweb contains=matlabnowebChunk,matlabnowebDelimiter

" Highlighting
hi def link matlabnowebDelimiter	Delimiter
 
let b:current_syntax="matlabnoweb"
