(setq term-bind-key-alist
    (list
    (cons "M-."  'term-send-raw-meta)
    ))

(add-hook 'term-mode-hook '(lambda ()
                             (setq show-trailing-whitespace nil)
                             (add-to-list 'term-unbind-key-list '"C-t")
                             (add-to-list 'term-unbind-key-list '"C-a")
                             (add-to-list 'term-unbind-key-list '"C-e")
                             (define-key term-raw-map (kbd "C-z") 'term-send-raw)))
