(defun delsel-setup ()
  (delete-selection-mode))

(add-hook 'emacs-startup-hook #'delsel-setup)
