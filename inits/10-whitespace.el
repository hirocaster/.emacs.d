(global-whitespace-mode 1)
(setq-default show-trailing-whitespace t)
(setq whitespace-action '(auto-cleanup))

(dolist (d '(face lines space-before-tab space-mark
             indentation empty space-after-tab newline-mark))
    (setq whitespace-style (delq d whitespace-style)))
