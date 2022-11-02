(with-eval-after-load 'company
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)

  (global-set-key (kbd "C-M-i") 'company-complete)
  (define-key company-active-map (kbd "C-h") nil)
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

(add-hook 'emacs-startup-hook 'global-company-mode)
