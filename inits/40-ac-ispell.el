(eval-after-load "auto-complete"
     '(progn
        (ac-ispell-setup)))

(add-hook 'git-commit-mode-hook 'ac-ispell-ac-setup)
(add-hook 'mail-mode-hook 'ac-ispell-ac-setup)
(add-hook 'text-mode-hook 'ac-ispell-ac-setup)
(add-hook 'markdown-mode-hook 'ac-ispell-ac-setup)
(add-hook 'org-mode-hook'ac-ispell-ac-setup)
