(bind-key "C-h" 'delete-backward-char)
(bind-key "C-c l" 'toggle-truncate-lines)
(bind-key "M-h" 'backward-kill-word)

;; consult
(bind-key "C-x C-b" 'consult-buffer)
(bind-key "C-x C-r" 'consult-recent-file)
(bind-key "C-s" 'consult-line)
(bind-key "M-y" 'consult-yank-pop)

(bind-key "C-=" 'er/expand-region)
