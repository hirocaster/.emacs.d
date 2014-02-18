(el-get 'sync 'motion-mode)

(require 'motion-mode)
(add-hook 'ruby-mode-hook 'motion-recognize-project)
(add-to-list 'ac-modes 'motion-mode)
(add-to-list 'ac-sources 'ac-source-dictionary)
