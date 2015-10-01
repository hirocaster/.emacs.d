(add-hook 'term-mode-hook '(lambda ()
                             (setq show-trailing-whitespace nil)
                             (define-key term-raw-map (kbd "\C-z") 'term-send-raw)
                             (define-key term-raw-map (kbd "\C-c") 'term-send-raw))))
