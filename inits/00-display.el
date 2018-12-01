(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(setenv "LANG" "ja_JP.UTF-8")
(setq locale-coding-system 'utf-8)
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

;; theme
(load-theme 'moe-dark t)

;; Mac Font
(set-face-attribute 'default nil
                    :family "Ricty Diminished"
                    :height 180)

;; pos-tip
(setq pos-tip-foreground-color "red")
(setq pos-tip-background-color "blue")
