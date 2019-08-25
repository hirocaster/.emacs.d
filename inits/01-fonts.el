;; Best one so far. Good rescaling, and working with Greek letters φ phi
;; http://d.hatena.ne.jp/setoryohei/20110117
;; Good overview of how to configure a multi-language environment
;; http://qiita.com/melito/items/238bdf72237290bc6e42
;; Overview of an alternative method
;; http://lioon.net/emacs-change-font-size-quickly
;; Detailed explanation with Japanese font-only config
;; http://extra-vision.blogspot.com/2016/07/emacs.html?m=1
;; 37.12.11 Fontsets (Emacs Lisp Manual)
;; A fontset is a list of fonts, each assigned to a range of character codes.
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Fontsets.html#Fontsets
;;
;; Strategy
;; 1. Create a fontset specifying Latin and Japanese letter separately
;; 2. Set default-frame fontset via default-frame-alist
;; 3. Set face-font-rescale-alist to match width of different fonts
;;
;;;  Step 1. Create a fontset specifying different fonts for Latin and Japanese letters
;; This creates a new fontset rather than overwriting the default fontset.
(let* ((my-fontset-name "myfonts")
       ;; Font size one of [9/10/12/14/15/17/19/20/...]
       (my-default-font-size 20)
       ;;
       ;; Ascii font name (pick from (font-family-list))
       (my-ascii-font "Ricty")
       ;; Japanese font name (pick from (font-family-list))
       (my-jp-font    "Ricty")
       ;;
       ;; Create a FONT string for create-fontset-from-ascii-font
       ;; "Menlo-14:weight=normal:slant=normal"
       (my-default-font-string (format "%s-%d:weight=normal:slant=normal" my-ascii-font my-default-font-size))
       ;;
       ;; Create a fontset from an ASCII font FONT.
       ;; Name as "fontset-" added to my-fontset-name
       ;; "-*-menlo-normal-normal-normal-*-*-140-*-*-m-0-fontset-myfonts"
       (my-font-set (create-fontset-from-ascii-font my-default-font-string nil my-fontset-name))
       ;;
       ;; Create :family-only font specifications (use later)
       ;; #<font-spec nil nil Menlo nil nil nil nil nil nil nil nil nil nil>
       (my-ascii-fontspec (font-spec :family my-ascii-font))
       ;; #<font-spec nil nil Hiragino\ Maru\ Gothic\ ProN nil nil nil nil nil nil nil nil nil nil>
       (my-jp-fontspec    (font-spec :family my-jp-font)))
  ;;
  ;; set-fontset-font function
  ;; Modify fontset NAME to use FONT-SPEC for TARGET characters.
  ;; (set-fontset-font NAME TARGET FONT-SPEC &optional FRAME ADD)
  ;; NAME is a fontset name string, nil for the fontset of FRAME, or t for the default fontset.
  ;; TARGET may be a cons (FROM . TO) or a charset or others.
  ;;  To list all possible choices, use M-x list-character-sets
  ;; FONT-SPEC may one of these:
  ;; * A font-spec object made by the function ‘font-spec’ (which see).
  ;; * A cons (FAMILY . REGISTRY), where FAMILY is a font family name and
  ;;   REGISTRY is a font registry name.  FAMILY may contain foundry
  ;;   name, and REGISTRY may contain encoding name.
  ;; * A font name string.
  ;; * nil, which explicitly specifies that there’s no font for TARGET.
  ;; FRAME is a frame or nil for the selected frame
  ;; ADD, if non-nil, specifies how to add FONT-SPEC to the font specifications for TARGET previously set
  ;; Use 'append if specifying overlapping
  ;;
  ;; For these Japanese character sets, use my-jp-fontspec
  (set-fontset-font my-font-set 'japanese-jisx0213.2004-1 my-jp-fontspec    nil 'append)
  (set-fontset-font my-font-set 'japanese-jisx0213-2      my-jp-fontspec    nil 'append)
  ;; For Half-sized katakana characters, use my-jp-fontspec
  (set-fontset-font my-font-set 'katakana-jisx0201        my-jp-fontspec    nil 'append)
  ;;
  ;; For the characters in the range #x0080 - #x024F, use my-ascii-fontspec
  ;; Latin with pronounciation annotations
  (set-fontset-font my-font-set '(#x0080 . #x024F)        my-ascii-fontspec nil 'append)
  ;; For the characters in the range #x0370 - #x03FF, use my-ascii-fontspec
  ;; Greek characters
  (set-fontset-font my-font-set '(#x0370 . #x03FF)        my-ascii-fontspec nil 'append))
;;
;;;  Step 2. Set default-frame fontset via default-frame-alist
;; Set the font set for the default frame (Used at frame creation)
;; Alist of default values for frame creation.
;; To check for the current frame, use M-x describe-fontset
;; To examine a specific character under cursor, use M-x describe-font
(add-to-list 'default-frame-alist '(font . "fontset-myfonts"))
;;
;;;  Step 3. Set face-font-rescale-alist to match width of different fonts
;; Rescaling parameters to adjust font sizes to match each other
(dolist (elt '(("Ricty"        . 1.0)
               ;; Below not relevant, but kept for historical reasons
               ;; ("^-apple-hiragino.*"               . 1.2)
               ;; (".*osaka-bold.*"                   . 1.2)
               ;; (".*osaka-medium.*"                 . 1.2)
               ;; (".*courier-bold-.*-mac-roman"      . 1.0)
               ;; (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
               ;; (".*monaco-bold-.*-mac-roman"       . 0.9)
               ))
  ;; Alist of fonts vs the rescaling factors.
  ;; Each element is a cons (FONT-PATTERN . RESCALE-RATIO)
  (add-to-list 'face-font-rescale-alist elt))
