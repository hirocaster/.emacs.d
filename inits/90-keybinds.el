(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key "\C-h" 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?) ;; backspace
(keyboard-translate ?\C-? ?\C-h) ;; Help
(add-hook 'server-visit-hook
          (lambda ()
            (keyboard-translate ?\C-h ?\C-?)))
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "C-u") 'align-regexp)
