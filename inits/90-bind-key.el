(require 'bind-key)

(global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key "\C-h" 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?) ;; backspace
(keyboard-translate ?\C-? ?\C-h) ;; Help
(add-hook 'server-visit-hook
          (lambda ()
            (keyboard-translate ?\C-h ?\C-?)))
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-u") 'align-regexp)

(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))
(define-key global-map (kbd "C-M-k") 'backward-kill-line)

;; helm
(global-set-key (kbd "C-c h") 'helm-mini)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)

;; helm-c-yas-complete
(global-set-key (kbd "C-c y") 'helm-c-yas-complete)

;; expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; git-gutter.el
(global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-diff)

;; howm
(global-set-key (kbd "C-c , ,") 'howm-menu)

;; kill-word
(bind-key "C-w" 'kill-region-or-backward-kill-word)

;; aspell
(bind-key "C-M-$" 'ispell-complete-word)

;; projectile
(bind-key "C-c h" 'helm-projectile)

;; multiple-cursors
;;
;; 使い方
;;   - キーワード選択 => C-t で同じキーワードにカーソルを追加
;;     - C-tのあと
;;       - s スキップ
;;       - u もどる
;;       - * 全選択
;;       - d バッファ内をよしなに選択

;;   - リージョン選択 => C-M-r キーワードを入力 => キーワードにカーソルを追加

(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)

(global-unset-key (kbd "C-t"))
(smartrep-define-key global-map "C-t"
                     '(("C-t"      . 'mc/mark-next-like-this)
                       ("n"        . 'mc/mark-next-like-this)
                       ("p"        . 'mc/mark-previous-like-this)
                       ("m"        . 'mc/mark-more-like-this-extended)
                       ("u"        . 'mc/unmark-next-like-this)
                       ("U"        . 'mc/unmark-previous-like-this)
                       ("s"        . 'mc/skip-to-next-like-this)
                       ("S"        . 'mc/skip-to-previous-like-this)
                       ("*"        . 'mc/mark-all-like-this)
                       ("d"        . 'mc/mark-all-like-this-dwim)
                       ("i"        . 'mc/insert-numbers)
                       ("o"        . 'mc/sort-regions)
                       ("O"        . 'mc/reverse-regions)))

;; dictionary
(bind-key "C-c w" 'dictionary)

;; bm.el
(bind-key "M-SPC" 'bm-toggle)
(bind-key "M-p" 'bm-previous)
(bind-key "M-n" 'bm-next)
