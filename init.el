(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get-bundle moe-theme)

(el-get-bundle bind-key)
(el-get-bundle migemo)
(el-get-bundle helm)

(el-get-bundle exec-path-from-shell)

(el-get-bundle ac-alchemist)
(el-get-bundle ac-ispell)
(el-get-bundle ace-jump-mode)
(el-get-bundle ag)
(el-get-bundle ahk-mode
  :url "https://raw.githubusercontent.com/ralesi/ahk-mode/master/ahk-mode.el")
(el-get-bundle alchemist)
(el-get-bundle anzu)
(el-get-bundle auto-complete)
(el-get-bundle auto-highlight-symbol)
(el-get-bundle bm)
(el-get-bundle company)
(el-get-bundle dash-at-point)
(el-get-bundle ddskk)
(el-get-bundle elscreen)
(el-get-bundle exec-path-from-shell)
(el-get-bundle expand-region)
(el-get-bundle flycheck)
(el-get-bundle flycheck-cask)
(el-get-bundle flycheck-credo)
(el-get-bundle flycheck-elixir)
(el-get-bundle flycheck-pos-tip)
(el-get-bundle free-keys)
(el-get-bundle git-gutter)
(el-get-bundle helm-ag)
(el-get-bundle helm-c-yasnippet)
(el-get-bundle helm-etags-plus)
(el-get-bundle helm-ghq)
(el-get-bundle helm-ls-git)
(el-get-bundle helm-swoop)
(el-get-bundle init-open-recentf)
(el-get-bundle js2-mode)
(el-get-bundle json-reformat)
(el-get-bundle lispxmp)
(el-get-bundle magit)
(el-get-bundle multi-term)
(el-get-bundle multiple-cursors)
(el-get-bundle org-mode)
(el-get-bundle org-seek)
(el-get-bundle ox-gfm)
(el-get-bundle paredit)
(el-get-bundle emacsfodder/pbcopy.el)
(el-get-bundle popup)
(el-get-bundle popwin)
(el-get-bundle projectile)
(el-get-bundle rbenv)
(el-get-bundle recentf-ext)
(el-get-bundle ripgrep)
(el-get-bundle robe)
(el-get-bundle smartparens)
(el-get-bundle smartrep)
(el-get-bundle string-inflection)
(el-get-bundle tide)
(el-get-bundle undo-tree)
(el-get-bundle w3m)
(el-get-bundle wgrep)
(el-get-bundle wgrep-ag)
(el-get-bundle yasnippet)
(el-get-bundle zop-to-char)

(el-get-bundle rcodetools
  :url "https://raw.githubusercontent.com/hirocaster/.emacs.d/master/vendor/rcodetools/rcodetools.el")

(el-get-bundle direnv
  :url "https://raw.githubusercontent.com/hirocaster/.emacs.d/master/vendor/direnv/direnv.el")

(el-get-bundle w-vi/apib-mode)
(el-get-bundle coffee-mode)
(el-get-bundle dockerfile-mode)
(el-get-bundle elixir-mode)
(el-get-bundle enh-ruby-mode)
(el-get-bundle feature-mode)
(el-get-bundle go-mode)
(el-get-bundle groovy-mode
  :url "https://raw.githubusercontent.com/Groovy-Emacs-Modes/groovy-emacs-modes/master/groovy-mode.el")
(el-get-bundle js2-mode)
(el-get-bundle json-mode)
(el-get-bundle markdown-mode)
(el-get-bundle markdown-preview-mode)
(el-get-bundle motion-mode)
(el-get-bundle nginx-mode)
(el-get-bundle php-mode)
(el-get-bundle puppet-mode)
(el-get-bundle rjsx-mode)
(el-get-bundle rspec-mode)
(el-get-bundle scss-mode)
(el-get-bundle terraform-mode)
(el-get-bundle tide)
(el-get-bundle typescript-mode)
(el-get-bundle web-mode)
(el-get-bundle yaml-mode)



(el-get-bundle init-loader)
(init-loader-load "~/.emacs.d/inits")
(init-loader-load "~/.emacs.d/secrets")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (wgrep-ag w3m string-inflection robe ripgrep ox-gfm org-seek flycheck-elixir flycheck-credo ac-ispell ac-alchemist bind-key))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
