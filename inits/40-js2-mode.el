(custom-set-variables
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 )

(lazyload (js2-mode) "js2-mode")

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
