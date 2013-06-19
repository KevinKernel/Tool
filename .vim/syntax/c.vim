"highlight Functions
syn match cFuntions display "[a-zA-Z_]\{-1,}\s\{-0,}(\{1}"ms=s,me=e-1
hi def link cFuntions Function

" C math operators
syn match       c_pointer     display "[*]"
hi def link  c_pointer Macro
