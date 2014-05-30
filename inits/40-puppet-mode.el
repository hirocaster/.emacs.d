(lazyload (puppet-mode) "puppet-mode")

(add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode))
(add-to-list 'auto-mode-alist '("Puppetfile" . puppet-mode))
