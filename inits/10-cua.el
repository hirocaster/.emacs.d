(cua-mode t)
(setq cua-enable-cua-keys nil) ;; 変なキーバインド禁止
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark) ;; 矩形選択
