let s:fixture = expand('%:p:h').'/fixture.txt'

function s:character_at_cursor()
  return matchstr(getline('.'), '\%'.col('.').'c.')
endfunction


function Test_normal_percent_matching_still_works()
  execute 'edit' s:fixture
  normal 1G0f(

  normal %

  call assert_equal(')', s:character_at_cursor())
endfunction


function Test_noop_when_unmatched()
  execute 'edit' s:fixture
  normal 2G0f'
  let col = getpos('.')[2]

  normal %

  call assert_equal(getpos('.')[2], col)
endfunction


function Test_single_quote_forwards()
  execute 'edit' s:fixture
  normal 3G0f'
  let col = getpos('.')[2]

  normal %

  call assert_equal('''', s:character_at_cursor())
  call assert_notequal(getpos('.')[2], col)
endfunction


function Test_single_quote_backwards()
  execute 'edit' s:fixture
  normal 3G$F'
  let col = getpos('.')[2]

  normal %

  call assert_equal('''', s:character_at_cursor())
  call assert_notequal(getpos('.')[2], col)
endfunction


function Test_double_quote_forwards()
  execute 'edit' s:fixture
  normal 4G0f"
  let col = getpos('.')[2]

  normal %

  call assert_equal('"', s:character_at_cursor())
  call assert_notequal(getpos('.')[2], col)
endfunction


function Test_double_quote_backwards()
  execute 'edit' s:fixture
  normal 4G$F"
  let col = getpos('.')[2]

  normal %

  call assert_equal('"', s:character_at_cursor())
  call assert_notequal(getpos('.')[2], col)
endfunction


function Test_backtick_forwards()
  execute 'edit' s:fixture
  normal 5G0f`
  let col = getpos('.')[2]

  normal %

  call assert_equal('`', s:character_at_cursor())
  call assert_notequal(getpos('.')[2], col)
endfunction


function Test_backtick_backwards()
  execute 'edit' s:fixture
  normal 5G$F`
  let col = getpos('.')[2]

  normal %

  call assert_equal('`', s:character_at_cursor())
  call assert_notequal(getpos('.')[2], col)
endfunction


function Test_pipe_forwards()
  execute 'edit' s:fixture
  normal 6G0f|
  let col = getpos('.')[2]

  normal %

  call assert_equal('|', s:character_at_cursor())
  call assert_notequal(getpos('.')[2], col)
endfunction


function Test_pipe_backwards()
  execute 'edit' s:fixture
  normal 6G$F|
  let col = getpos('.')[2]

  normal %

  call assert_equal('|', s:character_at_cursor())
  call assert_notequal(getpos('.')[2], col)
endfunction