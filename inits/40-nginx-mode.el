(lazyload (nginx-mode) "nginx-mode")

(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . nginx-mode))
