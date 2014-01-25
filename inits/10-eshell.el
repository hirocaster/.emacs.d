(custom-set-variables
 '( eshell-ask-to-save-history (quote always))
 '( eshell-history-size 1000)
 '( eshell-ls-dired-initial-args (quote ("-h")))
 '( eshell-ls-exclude-regexp "~\\'")
 '( eshell-ls-initial-args "-h")
 '( eshell-ls-use-in-dired t nil (em-ls))
 '( eshell-modules-list (quote (eshell-alias eshell-basic
    eshell-cmpl eshell-dirs eshell-glob
    eshell-hist eshell-ls eshell-pred
    eshell-prompt eshell-rebind
    eshell-script eshell-smart
    eshell-term eshell-unix eshell-xtra)))
 '( eshell-prefer-to-shell t nil (eshell))
 '( eshell-stringify-t nil)
 '( eshell-term-name "ansi")
 '( eshell-visual-commands (quote ("vi" "top" "screen" "less" "lynx" "ssh" "rlogin" "telnet")))
 )
