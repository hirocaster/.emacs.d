(require 'elixir-mode)
(require 'alchemist)
(require 'ac-alchemist)

(add-to-list 'elixir-mode-hook 'ac-alchemist-setup)
(add-to-list 'elixir-mode-hook 'alchemist-mode t)
(add-to-list 'elixir-mode-hook 'auto-highlight-symbol-mode)
