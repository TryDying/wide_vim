if !empty(glob('~/.vim/bundle/quickmenu.vim/autoload/quickmenu.vim'))
    " enable cursorline (L) and cmdline help (H)
    let g:quickmenu_options = "LH"

    " clear all the items
    call g:quickmenu#reset()

    " bind to map_key
    noremap <silent><space><space> :call quickmenu#toggle(0)<cr>
    " 打印
    command Paps !paps % | ps2pdf - %:r.pdf

    " new section
    call quickmenu#append("# LeaderF", '')
    call quickmenu#append("Function List", "LeaderfFunction", "Open function list")
    call quickmenu#append("Mru List", "LeaderfMru", "Open Mru list")
    call quickmenu#append("Tag List", "LeaderfTag", "Open Tag list")
    call quickmenu#append("LeaderF &Rg", 'Leaderf rg', 'Leaderf Grep')

    " doxygen
    call quickmenu#append("# Doxygen", '')
    call quickmenu#append("DoxAuthor", "DoxAuthor", "DoxAuthor")

    " new section
    call quickmenu#append("# Git", '')
    " use fugitive to show diff
    call quickmenu#append("git diff", 'Gvdiff', "use fugitive's Gvdiff on current document")
    call quickmenu#append("git status", 'Gstatus', "use fugitive's Gstatus on current document")

    " new section
    call quickmenu#append("# Others", '')
    call quickmenu#append("Turn spell %{&spell? 'off':'on'}", "set spell!", "enable/disable spell check (:set spell!)")
    call quickmenu#append("Indent Line", "IndentLinesToggle", "enable/disable IndentLine")
    call quickmenu#append("Autoformat", "Autoformat", "Autoformat")
    call quickmenu#append("Ignore&case %{&ignorecase? 'OFF':'ON'}", 'set ignorecase!')
    call quickmenu#append("Paps","Paps","Use paps to print pdf")

endif

" SimpyFold
let g:SimpylFold_docstring_preview=1
