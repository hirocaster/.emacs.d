(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode +1)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode +1)
            ;; company is an optional dependency. You have to
            ;; install it separately via package-install
            (company-mode t)))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(eval-after-load 'tide
  '(progn
    (require 'flycheck-typescript-tslint)
    (flycheck-add-next-checker 'typescript-tide
                               'typescript-tslint 'append)))
