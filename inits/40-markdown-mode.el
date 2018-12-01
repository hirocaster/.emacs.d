(lazyload (markdown-mode) "markdown-mode")

(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))

(add-hook 'markdown-mode-hook
  (lambda()
    (define-key markdown-mode-map (kbd "C-i") 'markdown-cycle)
    (hide-sublevels 3)))

(when (eq system-type 'darwin)
  (shell-command-to-string "type multimarkdown | awk {'print $3'}")
  (defun markdown-preview-file ()
    "run Marked on the current file and revert the buffer"
    (interactive)
    (shell-command
     (format "open -a /Applications/Marked.app %s"
             (shell-quote-argument (buffer-file-name)))))
  (global-set-key "\C-cp" 'markdown-preview-file))

(add-to-list 'ac-modes 'markdown-mode)

(setq markdown-preview-stylesheets (list (locate-user-emacs-file "vendor/css/github.css")))
