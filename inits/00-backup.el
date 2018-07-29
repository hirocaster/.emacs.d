(setq version-control     t)
(setq kept-new-versions   10)
(setq kept-old-versions   1)
(setq delete-old-versions t)

 (setq auto-save-timeout 10)
 (setq auto-save-interval 100)

(add-to-list 'backup-directory-alist
             (cons (expand-file-name "~/") (expand-file-name "~/.Trash/")))

(add-to-list 'auto-save-file-name-transforms
             `("~/\\([^/]*/\\)*\\([^/]*\\)$" "~/.Trash/\\2" t))

(setq auto-save-list-file-prefix "~/.Trash/.saves-")

(setq create-lockfiles nil)
