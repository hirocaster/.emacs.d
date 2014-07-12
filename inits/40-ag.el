(setq ag-highlight-search t)

(setq wgrep-enable-key "r")

(lazyload (ag-mode) "ag-mode"
          (autoload 'wgrep-ag-setup "wgrep-ag")
          (add-hook 'ag-mode-hook 'wgrep-ag-setup))
