(lazyload (web-mode) "web-mode"

          ;; emacs 23 support patch
          (when (< emacs-major-version 24)
            (defalias 'prog-mode 'fundamental-mode))

          (defun web-mode-hook ()
            "Hooks for Web mode."
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 2))

          (add-hook 'web-mode-hook 'web-mode-hook))


(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
