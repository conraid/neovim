augroup CustomSwapPrompt
  autocmd!
  autocmd SwapExists * call CustomSwapPrompt()
augroup END

function! CustomSwapPrompt()
  let l:file = expand('%')
  let l:swapfile = fnamemodify(l:file, ':p:h') . '/.' . fnamemodify(l:file, ':t') . '.swp'
  
  " Mostra il messaggio di avviso
  echo "⚠️  Swap file rilevato per " . l:file
  let l:choice = input("Aprire [e]dit / [r]eadonly / [q]uit? ")

  " Imposta v:swapchoice in base alla risposta
  if l:choice ==? 'r'
    let v:swapchoice = 'o' " open read-only
  elseif l:choice ==? 'q'
    let v:swapchoice = 'q' " quit
  else
    let v:swapchoice = 'e' " edit anyway
  endif
endfunction

