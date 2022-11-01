(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

(setq auto-save-list-file-prefix nil)

(defun files-setup ()
  (auto-save-visited-mode))

(add-hook 'emacs-startup-hook #'files-setup)
