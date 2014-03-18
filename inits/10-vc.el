(setq vc-handled-backends '())
(eval-after-load "vc"
  '(remove-hook 'find-file-hooks 'vc-find-file-hook))
