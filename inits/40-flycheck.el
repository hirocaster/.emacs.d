(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))

(eval-after-load 'flycheck
    '(custom-set-variables
         '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
