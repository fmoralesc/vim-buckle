function! s:start(...)
    if has('nvim')
	let s:buckle_job = jobstart(['buckle'])
    else
	let s:buckle_job = job_start('buckle')
    endif
endfunction

function! s:stop(...)
    try
	if has('nvim')
	    call jobstop(s:buckle_job)
	else
	    call job_stop(s:buckle_job)
	endif
    catch /E116/
    catch /E121/
    catch /E900/
    endtry
endfunction

au! InsertEnter * call s:start()
au! InsertLeave * call s:stop()
au! FocusLost * call s:stop()
