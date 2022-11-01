(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path (locate-user-emacs-file "el-get-user/recipes"))

(el-get-bundle tarao/el-get-lock)
(el-get-lock)

(el-get-bundle moe-theme)

(el-get-bundle magit)

(el-get-bundle bind-key
  :url "https://raw.githubusercontent.com/jwiegley/use-package/master/bind-key.el")

(el-get-bundle init-loader)
(init-loader-load (locate-user-emacs-file "inits"))
