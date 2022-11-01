(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(defun files-setup ()
  (auto-save-visited-mode))

(add-hook 'emacs-startup-hook #'files-setup)
