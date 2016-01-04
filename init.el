(setq gc-cons-threshold (* 128 1024 1024))

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(init-loader-load "~/.emacs.d/inits")
(init-loader-load "~/.emacs.d/secrets")
