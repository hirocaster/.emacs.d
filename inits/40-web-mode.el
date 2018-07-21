(add-hook 'web-mode-hook
          (lambda ()

            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 2)

            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (company-mode t))))

(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx.js\\'"     . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-attr-indent-offset nil)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)
