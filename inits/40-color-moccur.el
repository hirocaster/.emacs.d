(el-get 'sync 'color-moccur)

(require 'color-moccur)
(setq dmoccur-exclusion-mask
      (append '("\\~$" "\\.git\\/\*" "\\vendor\\/\*" "\\log\\/\*" "\\tmp\\/\*") dmoccur-exclusion-mask))
