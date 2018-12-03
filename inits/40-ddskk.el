(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)
(setq skk-share-private-jisyo t)
(setq skk-jisyo-code 'utf-8-unix)
(setq skk-use-azik t)
(setq skk-azik-keyboard-type 'en)

(setq skk-show-candidates-always-pop-to-buffer t) ; 変換候補の表示位置
(setq skk-henkan-show-candidates-rows 2)          ; 候補表示件数

(setq skk-japanese-message-and-error t)
(setq skk-show-icon t)

(setq skk-show-mode-show t)

(setq skk-dcomp-activate t)
(setq skk-dcomp-multiple-activate t)
(setq skk-dcomp-multiple-rows 5)

(setq skk-jisyo "~/Dropbox/skk/skk-jisyo")  ; 個人辞書

(when (eq system-type 'gnu/linux)
  (setq skk-extra-jisyo-file-list
        (list "/usr/share/skk/SKK-JISYO.fullname"
              "/usr/share/skk/SKK-JISYO.geo"
              "/usr/share/skk/SKK-JISYO.jinmei"
              "/usr/share/skk/SKK-JISYO.propernoun"
              "/usr/share/skk/SKK-JISYO.station"
              "/usr/share/skk/SKK-JISYO.zipcode")))
