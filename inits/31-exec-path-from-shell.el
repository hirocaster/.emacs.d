;; (when (memq window-system '(mac ns))
;;   (exec-path-from-shell-initialize))

(let ((envs '("PATH" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))
