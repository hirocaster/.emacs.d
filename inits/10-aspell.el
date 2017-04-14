(setq-default ispell-program-name "aspell")
(setq flyspell-issue-welcome-flag nil)
(setq ispell-extra-args '("--sug-mode=ultra"))

(setq ispell-grep-command "grep")
(setq ispell-alternate-dictionary (expand-file-name "~/.emacs.d/vendor/dictionary/en.dic"))

(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
