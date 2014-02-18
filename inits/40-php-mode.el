(el-get 'sync 'php-mode)

(require 'php-mode)
(add-hook 'php-mode-user-hook
  '(lambda ()
  (setq tab-width 4)
  (setq indent-tabs-mode nil))
)
