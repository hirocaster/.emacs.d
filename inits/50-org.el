(add-to-list 'ac-modes 'org-mode)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org/notes")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")

;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/アプリ/MobileOrg")

(setq org-agenda-files (list org-directory))

(add-hook 'org-mode-hook 'turn-on-font-lock)

(setq org-src-fontify-natively t)
