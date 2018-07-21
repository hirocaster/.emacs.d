(setq org-use-speed-commands t)

(add-to-list 'ac-modes 'org-mode)

(setq org-startup-indented t)
(setq org-indent-mode-turns-on-hiding-stars nil)
(setq org-indent-indentation-per-level 4)
(setq org-startup-folded 'content)

(setq org-startup-with-inline-images t)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")

;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/アプリ/MobileOrg")

(setq org-agenda-files (list org-directory))

(add-hook 'org-mode-hook 'turn-on-font-lock)

(setq org-src-fontify-natively t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
         "* %?\nEntered on %U\n  %i\n  %a")))

(setq org-log-done 'time)
