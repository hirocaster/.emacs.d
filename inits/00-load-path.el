(defun add-to-load-path-recompile (dir)
    (add-to-list 'load-path dir)
      (let (save-abbrevs) (byte-recompile-directory dir)))

(defun recursive-load-directory (dir)
  (dolist (dir (let ((dir (expand-file-name dir)))
                 (list dir (format "%s%d" dir emacs-major-version))))
    (when (and (stringp dir) (file-directory-p dir))
      (let ((default-directory dir))
        (add-to-load-path-recompile default-directory)
        (normal-top-level-add-subdirs-to-load-path)))))

;; (recursive-load-directory "~/.emacs.d/vendor")
