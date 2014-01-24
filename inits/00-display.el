(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(setq user-full-name "Hiroki Ohtsuka a.k.a hirocaster")
(setq user-mail-address "hohtsuka@gmail.com")
(global-font-lock-mode t)

(setq frame-title-format "%f")
(size-indication-mode t)
(setq display-time-24hr-format t)
(display-time-mode t)

;; tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-tab-always-indent t)

;; lines
(setq truncate-partial-width-windows nil)
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
(setq c-auto-newline t)
(setq require-final-newline t)
(setq next-line-add-newlines nil)

;;; 1行80文字を超えるとハイライト
(add-hook 'ruby-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
(add-hook 'php-mode-hook
  (lambda ()
    (font-lock-add-keywords nil
      '(("^[^\n]\\{80\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
