(add-hook 'org-ref-clean-bibtex-entry-hook 'org-ref-replace-nonascii)
(add-hook 'org-export-before-parsing-hook 'orcp-citeproc)
(setq bibtex-dialect 'biblatex)

(require 'org-ref)
