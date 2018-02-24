(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-cask-setup))

(eval-after-load 'flycheck
  '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)

(require 'flycheck)
(require 'flycheck-elixir)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (setq flycheck-disabled-checkers '(ruby-rubylint))
             (flycheck-mode 1)))

(add-hook 'enh-ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (setq flycheck-disabled-checkers '(ruby-rubylint))
             (flycheck-mode 1)))
