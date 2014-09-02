(require 'ac-mozc)
(define-key ac-mode-map (kbd "C-c C-SPC") 'ac-complete-mozc)

(defun my-ac-mozc-setup ()
    (setq ac-sources
                  '(ac-source-mozc ac-source-ascii-words-in-same-mode-buffers))
      (set (make-local-variable 'ac-auto-show-menu) 0.2))

(add-hook 'org-mode-hook 'my-ac-mozc-setup)
(add-hook 'markdown-mode-hook 'my-ac-mozc-setup)
