(setq interpreter-mode-alist
      (append '(list
                '("ruby" . ruby-mode)
                '("perl" . cperl-mode)
                )
              interpreter-mode-alist))
