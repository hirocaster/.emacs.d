(defun flycheck-setup ()
  (global-flycheck-mode))

(add-hook 'emacs-startup-hook #'flycheck-setup)
