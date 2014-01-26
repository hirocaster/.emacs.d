;; UNICODE 全角文字指定対策
;; 1. セットアップ関数の取得
(get-language-info "Japanese" 'setup-function) ; => setup-japanese-environment-internal

;; 2. setup-japanese-environment-internal の実行
(defun setup-japanese-environment-internal ()
  ;; By default, we use 'japanese-iso-8bit for file names.  But, the
  ;; following prefer-coding-system will override it.
  (if (memq system-type '(windows-nt ms-dos cygwin))
      (prefer-coding-system 'japanese-shift-jis)
    (prefer-coding-system 'japanese-iso-8bit))
  (use-cjk-char-width-table 'ja_JP))

;; 3. use-cjk-char-width-table の実行
(use-cjk-char-width-table 'ja_JP)
