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

(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(define-key global-map (kbd "C-M-k") 'backward-kill-line) ;; カーソル位置から行頭まで削除する

;; helm
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

;; helm-c-yas-complete
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; motion-mode
(define-key motion-mode-map (kbd "C-c C-c") 'motion-execute-rake)
(define-key motion-mode-map (kbd "C-c C-d") 'motion-dash-at-point)
(define-key motion-mode-map (kbd "C-c C-p") 'motion-convert-code-region)

;; git-gutter.el
(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-diff)
