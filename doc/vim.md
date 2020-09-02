# Vim Notes

```
    Editing Commands                        Deleting Commands
    ----------------                        -----------------
    i   insert                              x   delete character
    o   open a new line (below)             X   delete character to left
    O   open a new line (above)             d0  delete to beginning of line
    a   append                              d$  delete to end of line
    A   append at end of line               dd  delete line
    u   undo                                5dd delete 5 lines
    U   undo all changes on a line,         
    
    #  while not having moved off it
    :e! re-edit a messed up file.
    .   repeat last command
    
    -------------------                      -----------------
      Cutting and Pasting                      Movement Commands
      -------------------                      -----------------
      yy   yank                               H    move to top of screen (high)
      5yy  yank 5 lines                       M    move to middle
      p    paste                              L    move to low
      P    paste above current position       10G  go to line 10
      w    go to next word                    g    move to the first line of the  file
      b    go back to previous word           G    move to the last line of the   file
      0    beginning of line
      $    end of line
      
      ------------------                      -------------------------------
      Searching Commands                        tabs
      ------------------                      ------------------------------
      /fred    search for "fred"              S-Right  tabn
      ?fred    search backwards for "fred"     S-Left   tabp
      n        repeat the last search             S-N      notes
      S-T      :NerdTree
      
      formatting
      -----------------------
      set sw=2     # sets indent
      gg=G         # format file
      5>>          # move 5 lines right one space
      
      %s/foo/bar/g    # search and replace.
      
      :set number  or :set nonumber
      :set noic    or :set ic
      :6,9w >> /tmp/file  
      :split :vsplit
      :35 :vsplit
      
      # set backup directory beside the current directory.
      set backupdir=~/.vim/backups
      
      # encryption
      :x         # set encryption
      :set key=  # clear encryption
      :setlocal cm?              # show encryption method for the current file
      :setlocal cm=zip           # weak (default for backwards-compatibility)
      :setlocal cm=blowfish      # better
      :setlocal cm=blowfish2     # best (requires Vim version 7.4.399 or higher)
      nuseradd is high level shell program for adding users to LDAP server.  On   Debian, administrators should usually use nuseradd.debian(8) instead.
      
```
