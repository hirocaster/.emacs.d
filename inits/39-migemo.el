(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

(setq migemo-dictionary
      (expand-file-name (locate-user-emacs-file "vendor/migemo/utf-8/migemo-dict")))

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(migemo-init)
