(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(setq package-user-dir (locate-user-emacs-file "elpa"))
(package-initialize)

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

(el-get-bundle minad/vertico :branch "0.28")
(el-get-bundle oantolin/orderless :branch "0.7")
(el-get-bundle minad/consult :branch "0.20")
(el-get-bundle minad/marginalia :branch "0.15")
(el-get-bundle minad/affe :branch "0.4")
(el-get-bundle tomoya/consult-ghq :branch "0.0.4")

(el-get-bundle anzu)
(el-get-bundle company-mode/company-mode :branch "0.9.13")

(el-get-bundle magnars/expand-region.el :branch "0.11.0")

(el-get-bundle elscreen)
(el-get-bundle magit :branch "v3.3.0")

(el-get-bundle elpa:org)

(el-get-bundle flycheck/flycheck :branch "32")

(el-get-bundle ddskk)

(el-get-bundle bind-key
  :url "https://raw.githubusercontent.com/jwiegley/use-package/master/bind-key.el")

(el-get-bundle init-loader)
(init-loader-load (locate-user-emacs-file "inits"))
