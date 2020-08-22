(defun xlfd-at (pos)
  "Return X logical font description (XLFD) of the font at POS in the current buffer."
  (if (not (display-graphic-p))
      (message "Display is not graphic. So font is not used.")
    (font-xlfd-name (font-at pos))))

(defun xlfd-cursor-position (pos)
  "Return X logical font description (XLFD) of the font at the point."
  (interactive "d")
  (message (xlfd-at pos)))

(set-face-attribute 'default nil
                    :family "Ricty Diminished"
                    :height 210)

