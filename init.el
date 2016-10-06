
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq gc-cons-threshold (* 128 1024 1024))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(init-loader-load "~/.emacs.d/inits")
(init-loader-load "~/.emacs.d/secrets")
