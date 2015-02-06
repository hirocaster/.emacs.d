(lazyload (coffee-mode) "coffee-mode"
          (set (make-local-variable 'tab-width) 2)
          (setq coffee-tab-width 2))

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
