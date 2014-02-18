(el-get 'sync 'color-moccur)

(require 'color-moccur)
(setq dmoccur-exclusion-mask
      (append '("\\~$") dmoccur-exclusion-mask))
