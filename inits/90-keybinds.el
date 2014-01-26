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

;; helm
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; motion-mode
(define-key motion-mode-map (kbd "C-c C-c") 'motion-execute-rake)
(define-key motion-mode-map (kbd "C-c C-d") 'motion-dash-at-point)
(define-key motion-mode-map (kbd "C-c C-p") 'motion-convert-code-region)
