;; Exporting
(setq org-latex-pdf-process
      '("ptex2pdf -l -ot '-synctex=1 -shell-escape' %f"
        "ptex2pdf -l -ot '-synctex=1 -shell-escape' %f"
        "ptex2pdf -l -ot '-synctex=1 -shell-escape' %f"))


(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
               '("jsarticle" "\\documentclass[14pt]{jsarticle}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("jsreport" "\\documentclass[report]{jsbook}"
                 ("\\part{%s}" . "\\part*{%s}")
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (add-to-list 'org-latex-classes
               '("jsbook" "\\documentclass{jsbook}"
                 ("\\part{%s}" . "\\part*{%s}")
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (add-to-list 'org-latex-classes
               '("jsarticle2" "\\documentclass[twocolumn,10pt]{jsarticle}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq org-latex-default-packages-alist
      '(("AUTO" "inputenc"  t)
        ("T1"   "fontenc"   t)
        (""     "fixltx2e"  nil)
        ("dvipdfmx"     "graphicx"  t)
        (""     "grffile"   t)
        (""     "longtable" nil)
        (""     "wrapfig"   nil)
        (""     "rotating"  nil)
        ("normalem" "ulem"  t)
        (""     "amsmath"   t)
        (""     "textcomp"  t)
        (""     "amssymb"   t)
        (""     "capt-of"   nil)
        (""     "hyperref"  nil)
        ("margin=2cm,nohead, nofoot"     "geometry")))

(setq org-latex-default-class "jsarticle")
