(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
    '(custom-set-variables
         '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
