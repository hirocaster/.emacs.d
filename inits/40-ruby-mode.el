(lazyload (ruby-mode) "ruby-mode"
          (setq ruby-insert-encoding-magic-comment nil)

          (add-hook 'enh-ruby-mode-hook 'auto-highlight-symbol-mode)

          (setq enh-ruby-add-encoding-comment-on-save nil)
          (add-hook 'ruby-mode-hook 'enh-ruby-mode)

          (add-to-list 'ac-sources 'ac-source-dictionary)

          (require 'motion-mode)
          (add-hook 'ruby-mode-hook 'motion-recognize-project)
          (define-key motion-mode-map (kbd "C-c C-c") 'motion-execute-rake)
          (define-key motion-mode-map (kbd "C-c C-d") 'motion-dash-at-point)
          (define-key motion-mode-map (kbd "C-c C-p") 'motion-convert-code-region))

(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\Gemfile\\'" . ruby-mode))
