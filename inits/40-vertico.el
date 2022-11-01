(setq vertico-count 20)

(defun after-init-vertico-hook ()
  (vertico-mode)
  (savehist-mode))

(add-hook 'emacs-startup-hook #'after-init-vertico-hook)
