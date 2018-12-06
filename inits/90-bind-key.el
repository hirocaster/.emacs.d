(require 'bind-key)

;; (global-set-key (kbd "C-m") 'newline-and-indent)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "C-S-h") 'kill-whole-line)
(global-set-key (kbd "M-SPC") 'cycle-spacing)

(keyboard-translate ?\C-h ?\C-?) ;; backspace
(keyboard-translate ?\C-? ?\C-h) ;; Help
(add-hook 'server-visit-hook
          (lambda ()
            (keyboard-translate ?\C-h ?\C-?)))
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-'") 'align-regexp)

;; Mac
(setq mac-command-key-is-meta nil)
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

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

;; helm-swoop
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

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
(bind-key "C-x j" 'helm-projectile)

;; lispxmp
(bind-key "C-c C-d" 'lispxmp)

;; multiple-cursors
;;
;; 使い方
;;   - キーワード選択 => C-- で同じキーワードにカーソルを追加
;;     - C--のあと
;;       - s スキップ
;;       - u もどる
;;       - * 全選択
;;       - d バッファ内をよしなに選択

;;   - リージョン選択 => C-M-r キーワードを入力 => キーワードにカーソルを追加

(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)

(global-unset-key (kbd "C--"))
(smartrep-define-key global-map "C--"
                     '(("C--"      . 'mc/mark-next-like-this)
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
(bind-key "s-m" 'bm-toggle)
(bind-key "s-p" 'bm-previous)
(bind-key "s-n" 'bm-next)

;; helm-etags-plus
(global-set-key "\M-." 'helm-etags+-select)
(global-set-key "\M-*" 'helm-etags+-history)
(global-set-key "\M-," 'helm-etags+-history-go-back)
(global-set-key "\M-/" 'helm-etags+-history-go-forward)

;; yasnippet
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; zop-up-to-char
(global-set-key (kbd "M-z") 'zop-up-to-char)

;;; multi-term
(global-set-key (kbd "C-c t") '(lambda ()
                                 (interactive)
                                 (if (get-buffer "*terminal<1>*")
                                     (switch-to-buffer "*terminal<1>*")
                                   (multi-term))))

;; ddskk
(global-set-key (kbd "C-x C-j") 'skk-mode)
(global-set-key (kbd "C-x j") 'skk-auto-fill-mode)

;; string-inflection
(global-set-key (kbd "C-x C-i") 'string-inflection-cycle)

;; window
(global-set-key (kbd "M-o") 'other-window)
(windmove-default-keybindings)
