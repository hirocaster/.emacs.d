(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

(setq ac-auto-start 1)        ; 補完を開始する文字数
(setq ac-auto-show-menu 0.2)  ; メニュー表示するまでの時間（秒）
(setq ac-menu-height 20)      ; 20行分表示
(setq ac-use-comphist t)      ; 補完候補をソート
(setq ac-candidate-limit nil) ; 補完候補表示を無制限に
(setq ac-use-menu-map t)      ; キーバインド
(setq ac-ignore-case t)       ; 大文字小文字を区別しない
(global-auto-complete-mode t)
(ac-flyspell-workaround)

(setq ac-comphist-file "~/Dropbox/.emacs.d/cache/auto-complete/ac-comphist.dat")

(setq-default ac-sources (append '(ac-source-yasnippet ; yasnippetを追加
                                   ) ac-sources))

;; lookコマンドで英単語を補完
(when (executable-find "look")
  (defun my-ac-look ()
    "look コマンドの出力をリストで返す"
    (interactive)
    (unless (executable-find "look")
      (error "look コマンドがありません"))
    (let ((search-word (thing-at-point 'word)))
      (with-temp-buffer
        (call-process-shell-command "look" nil t 0 search-word)
        (split-string-and-unquote (buffer-string) "\n"))))
  (defun ac-complete-look ()
    (interactive)
    (let ((ac-menu-height 50)
          (ac-candidate-limit t))
      (auto-complete '(ac-source-look))))
  (defvar ac-source-look
    '((candidates . my-ac-look)
      (requires . 2)))  ;; 2文字以上ある場合にのみ対応させる
  (global-set-key (kbd "M-h") 'ac-complete-look))

;; 自動的にauto-complete.elが有効になるモードを登録
(when (boundp 'ac-modes)
  (setq ac-modes
        (append ac-modes
                (list 'php-mode
                      'puppet-mode
                      'ruby-mode
                      'review-mode
                      'motion-mode
                      'org-mode
                      'markdown-mode
                      'git-commit-mode))))
