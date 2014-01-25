(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(setq markdown-command "/opt/boxen/homebrew/bin/multimarkdown")

(add-hook 'markdown-mode-hook
  (lambda()
    (define-key markdown-mode-map (kbd "C-i") 'markdown-cycle)
    (hide-sublevels 3)))

(when (eq system-type 'darwin)
  (defun markdown-preview-file ()
    "run Marked on the current file and revert the buffer"
    (interactive)
    (shell-command
     (format "open -a /Applications/Marked.app %s"
             (shell-quote-argument (buffer-file-name)))))
  (global-set-key "\C-cp" 'markdown-preview-file))
