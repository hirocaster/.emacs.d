(add-hook 'term-mode-hook '(lambda ()
                             (setq show-trailing-whitespace nil)
                             (add-to-list 'term-unbind-key-list '"C-t")
                             (define-key term-raw-map (kbd "\C-z") 'term-send-raw)))
