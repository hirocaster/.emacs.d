(setq-default show-trailing-whitespace t)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         ;; spaces      ; スペース
                         empty          ; 先頭/末尾の空行
                         ;; space-mark  ; 表示のマッピング
                         tab-mark
                         ))
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)
