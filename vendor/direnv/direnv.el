;; http://qiita.com/5t111111/items/5e854f6047d187ea21c7
;; Most functions are taken from zph/direnv.el https://gist.github.com/zph/50c766d6c7aa212896b5

(require 'cl-lib)
;; Depends on s.el

(defun direnv-data (dir)
  ;; TODO: use dir for folder or smart current-project-dir variable
  (let ((cmd (concat "$SHELL -i -c '" "cd " dir " && direnv export bash'")))
    (shell-command-to-string cmd)))

;;(direnv-data "~/src/direnv")
(defun commands-from-direnv (text)
  (cl-remove-if 's-blank?
                (split-string (first (last (split-string text "\n"))) ";")))

(defun line->pair (line)
  (split-string (s-join " " (rest (split-string line " "))) "="))

(defun remove-$-and-quotes (val)
  (s-with val
    (s-chop-prefix "$")
    (s-chop-prefix "'")
    (s-chop-suffix "'")
    (s-chop-prefix "\"")
    (s-chop-suffix "\"")))

(defun line->kv (line)
  (let* ((pair (line->pair line))
         (key (first pair))
         (value (remove-$-and-quotes (first (last pair)))))
    (list key value)))

(defun is-export? (str)
  (s-starts-with? "export" str))

(defun is-ignored-key? (ls)
  (let ((key (first ls)))
    (or
     (s-starts-with? "DIRENV" key)
     (s-starts-with? "PATH" key))))

(defun extract-exports (cmds)
  (mapcar 'line->kv
          (cl-remove-if-not 'is-export?
                            (commands-from-direnv cmds))))

(defun commands->list (cmds)
  (let ((exports (extract-exports cmds)))
    (cl-remove-if 'is-ignored-key? exports)))

(defun setenv-pair (pair)
  (let* ((k (first pair))
         (v (first (last pair))))
    (setenv k v)))

(defun set-env-from-direnv (dir)
  (let* ((data (direnv-data dir))
         (pairs (commands->list data)))
      (mapcar 'setenv-pair pairs)))

(defun load-direnv ()
  "Load direnv .envrc for the current buffer."
  (interactive)
  (let ((direnv-root-dir (locate-dominating-file default-directory ".envrc")))
    (unless direnv-root-dir
      (error "Error: .envrc is not found."))
    (set-env-from-direnv direnv-root-dir)))
