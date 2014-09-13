(setq-default ispell-program-name "aspell")
(setq flyspell-issue-welcome-flag nil)
(setq ispell-extra-args '("--sug-mode=ultra"))

(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
