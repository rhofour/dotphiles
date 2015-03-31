if exists("did_load_filetypes")
  finish
endif

" Stuff to make Matlab noweb files parse properly
augroup filetypedetect
  au! BufRead,BufNewFile *.mnw setf matlabnoweb
augroup END
