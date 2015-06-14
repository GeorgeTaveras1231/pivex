if !empty($TMUX)
  nnoremap <leader>t :call Send_to_Tmux("mix test\n")<CR>
  nnoremap <leader>d :call Send_to_Tmux("mix deps.get\n")<CR>
  nnoremap <leader>b :call Send_to_Tmux("mix escript.build\n")<CR>
endif

