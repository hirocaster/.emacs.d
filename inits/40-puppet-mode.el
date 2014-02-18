(el-get 'sync 'puppet-mode)

(require 'puppet-mode)
(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(add-hook 'puppet-mode-hook
          (lambda()
            (require 'flymake-puppet)
            (auto-complete-mode t)
            (electric-pair-mode t)
            (flymake-puppet-load)))
