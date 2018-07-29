;; org-mode
(add-hook 'org-mode-hook 'howm-mode)
(add-to-list 'auto-mode-alist '("\\.howm$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
(global-unset-key (kbd "C-x ,"))
(setq howm-prefix (kbd "C-x ,"))
(eval-after-load "howm-mode"
  '(progn
    (define-key howm-mode-map (kbd "C-c C-c") nil)))

;; howm
(setq howm-menu-lang 'ja)
(setq howm-view-use-grep t)
(setq howm-view-grep-command "rg")
(setq howm-view-grep-option "-nH --no-heading --color never")
(setq howm-view-grep-extended-option nil)
(setq howm-view-grep-fixed-option "-F")
(setq howm-view-grep-expr-option nil)
(setq howm-view-grep-file-stdin-option nil)
(setq howm-view-title-header "*")
(setq howm-file-name-format "%Y/%m/%d/%Y%m%d-%H%M%S.txt")
(global-set-key "\C-x,," 'howm-menu)
(autoload 'howm-menu "howm-mode" "Hitori Otegaqru Wiki Modoki" t)
(setq howm-directory "~/howm/")
(setq howm-keyword-file (concat howm-directory ".howm-keys"))
;; (setq howm-menu-file (concat howm-directory "menu.txt"))
(setq howm-history-file (concat howm-directory ".howm-history"))

(setq howm-template
  '("* %title%cursor
%date %file

"
    "* %date Diary of the day                                              :diary:

** Thanks for x

** What I did in today

    %cursor
"))

(defun howm-create-diary ()
  (interactive)
  (howm-create 2 nil))
(define-key global-map (concat howm-prefix "d") #'howm-create-diary)
