(setq ag-highlight-search t)

(setq wgrep-enable-key "e")
(setq wgrep-auto-save-buffer t)
(setq wgrep-change-readonly-file t)

(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
