(setq recentf-max-saved-items 2000)
(setq recentf-auto-cleanup 'never)
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))

(defun after-init-recentf-hook ()
  (recentf-mode))

(add-hook 'emacs-startup-hook #'after-init-recentf-hook)
