(defun files-setup ()
  (auto-save-visited-mode))

(add-hook 'emacs-startup-hook #'files-setup)
