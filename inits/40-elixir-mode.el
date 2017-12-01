(require 'elixir-mode)
(require 'alchemist)
(require 'ac-alchemist)

(add-to-list 'elixir-mode-hook 'ac-alchemist-setup)
(add-to-list 'elixir-mode-hook 'alchemist-mode t)
(add-to-list 'elixir-mode-hook 'auto-highlight-symbol-mode)

(setq flycheck-elixir-credo-strict t)

(eval-after-load 'flycheck
  '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)
