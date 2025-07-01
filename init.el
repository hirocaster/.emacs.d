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

(setq package-user-dir (locate-user-emacs-file "elpa"))
(setq package-gnupghome-dir (locate-user-emacs-file "elpa/gnupg"))

(el-get-bundle tarao/el-get-lock)
(el-get-lock)

(el-get-bundle moe-theme)

(el-get-bundle wolray/symbol-overlay :branch "4.2")

(el-get-bundle minad/vertico :branch "0.28")
(el-get-bundle oantolin/orderless :branch "0.7")
(el-get-bundle minad/consult :branch "0.29")
(el-get-bundle minad/marginalia :branch "0.15")
(el-get-bundle minad/affe :branch "0.5")
(el-get-bundle tomoya/consult-ghq :branch "0.0.4")
(el-get-bundle rmuslimov/browse-at-remote :branch "0.14.0")

;; rg
(el-get-bundle mhayashi1120/Emacs-wgrep :branch "2.3.4")
(el-get-bundle dajva/rg.el :branch "2.3.0")

;; copilot
(el-get-bundle editorconfig)
(el-get-bundle jsonrpc)
(el-get-bundle copilot
  :type github
  :pkgname "copilot-emacs/copilot.el"
  :branch "main"
  :depends (s dash editorconfig jsonrpc)
  :description "An Emacs plugin for GitHub Copilot."
  :post-init (progn
               (add-hook 'prog-mode-hook 'copilot-mode)
               (with-eval-after-load 'copilot
                 (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
                 (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))))

;; lsp
(el-get-bundle lsp-mode)
(el-get-bundle lsp-ui)

;; Nix
(el-get-bundle NixOS/nix-mode :branch "v1.5.0")

;; rust
(el-get-bundle project)
(el-get-bundle brotzeit/rustic :branch "3.4")

;; PHP
(el-get-bundle emacs-php/php-mode :branch "v1.24.3" :load-path "./lisp")

;; docker
(el-get-bundle spotify/dockerfile-mode)
(el-get-bundle yoshiki/yaml-mode :branch "0.0.15")
(el-get-bundle meqif/docker-compose-mode)

(el-get-bundle anzu)
(el-get-bundle company-mode/company-mode :branch "0.9.13")

(el-get-bundle magnars/expand-region.el :branch "0.11.0")

(el-get-bundle elscreen)
(el-get-bundle magit :branch "v3.3.0")

(el-get-bundle elpa:org)

(el-get-bundle flycheck/flycheck :branch "32")

;; org-roam
(el-get-bundle magit/emacsql :branch "3.1.1")
(el-get-bundle org-roam/org-roam :branch "v2.2.2")

;; org-roam-ui
(el-get-bundle websocket)
(el-get-bundle simple-httpd)
(el-get-bundle org-roam-macs ;; bug: depends from org-roam-ui
  :url "https://raw.githubusercontent.com/org-roam/org-roam-v1/master/org-roam-macs.el")
(el-get-bundle org-roam-dailies ;; bug: depends from org-roam-ui
  :url "https://raw.githubusercontent.com/org-roam/org-roam-v1/master/org-roam-dailies.el") ;; bug
(el-get-bundle org-roam/org-roam-ui)

(el-get-bundle ddskk)

(el-get-bundle bind-key
  :url "https://raw.githubusercontent.com/jwiegley/use-package/master/bind-key.el")

(el-get-bundle init-loader)
(init-loader-load (locate-user-emacs-file "inits"))

(package-initialize)
(el-get 'sync)
