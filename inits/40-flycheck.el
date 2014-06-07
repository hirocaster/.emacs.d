(setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers))
(add-hook 'after-init-hook #'global-flycheck-mode)
