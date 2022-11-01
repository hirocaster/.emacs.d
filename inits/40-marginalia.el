(defun after-init-marginalia-hook ()
  (marginalia-mode))

(add-hook 'emacs-startup-hook #'after-init-marginalia-hook)
