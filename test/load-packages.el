(require 'cl)
(require 'ert)

(defun test-check-package (pkg)
  (ignore-errors
    (el-get-package-is-installed pkg)))

(defmacro deftest-load-package (pkg)
  `(ert-deftest ,(intern (concat "test-load-package-" (symbol-name pkg))) ()
     ,(concat "test for loading " (symbol-name pkg))
     (should (test-check-package ',pkg))))

(defun deftest-load-package-func (pkg)
  (eval `(deftest-load-package ,pkg)))

(defvar el-get-packages
  '(
    cl-lib     ;; cl-lib load at first to compile other pacakges
    ace-jump-mode
    ag
    apache-mode
    ansi-color
    auto-complete
    auto-highlight-symbol
    coffee-mode
    color-moccur
    copyedit-ja
    dash
    dmacro
    edit-server
    exec-path-from-shell
    expand-region
    flycheck
    fuzzy
    git-gutter
    git-modes
    hatena-markup-mode
    hatena-multi-mode
    helm
    helm-c-yasnippet
    inf-ruby
    js2-mode
    magit
    markdown-mode
    moccur-edit
    motion-mode
    multi-mode
    multi-mode-util
    nginx-mode
    pbcopy
    php-mode
    popup
    puppet-mode
    review-mode
    riece
    robe-mode
    rspec-mode
    ruby-mode
    scss-mode
    smartparens
    undo-tree
    web-mode
    yaml-mode
    yasnippet
    ))

(mapcar 'deftest-load-package-func el-get-packages)

;; (ert-deftest load-package-helm ()
;;     "test for loading helm"
;;       (should (check-package 'helm)))

(ert-run-tests-batch-and-exit)
