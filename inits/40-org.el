(setq org-indent-indentation-per-level 2)
(setq org-indent-mode-turns-on-hiding-stars nil)
(setq org-log-done 'time)
(setq org-src-fontify-natively t)
(setq org-startup-folded 'fold)
(setq org-startup-indented t)
(setq org-startup-with-inline-images t)
(setq org-use-speed-commands t)

;; Markup Japanese lang
(defun insert-zero-width-space ()
  (interactive)
  (insert-char #x200b))
(setq org-emphasis-regexp-components
      '("   ('\"{\x200B" "-     .,:!?;'\")}\\[\x200B" "
,\"'" "." 1))
(global-set-key (kbd "C-c C-x *") 'insert-zero-width-space)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/gollum/todo.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/gollum/journal.org")
         "* %?\nEntered on %U\n  %i\n")))
