(setq yas-snippet-dirs "~/.emacs.d/vendor/yasnippet/snippets")
(yas-global-mode 1)

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))
