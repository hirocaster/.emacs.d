(setq markdown-command (string-trim (shell-command-to-string "type multimarkdown | awk {'print $3'}")))
(setq markdown-preview-stylesheets (list (locate-user-emacs-file "vendor/css/github.css")))

(lazyload (markdown-mode) "markdown-mode")

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))

(add-hook 'markdown-mode-hook
  (lambda()
    (define-key markdown-mode-map (kbd "C-i") 'markdown-cycle)
    (hide-sublevels 3)))

(add-to-list 'ac-modes 'markdown-mode)
