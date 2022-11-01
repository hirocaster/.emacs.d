(setq default-input-method "japanese-skk")

(setq skk-server-host "localhost")
(setq skk-server-portnum 1178)
(setq skk-share-private-jisyo t)

(setq skk-use-azik t)
(setq skk-azik-keyboard-type 'en)

(setq skk-save-jisyo-instantly t)

(setq skk-show-candidates-always-pop-to-buffer t) ; 変換候補の表示位置
(setq skk-henkan-show-candidates-rows 2)          ; 候補表示件数

(setq skk-japanese-message-and-error t)
(setq skk-show-icon t)

(setq skk-show-mode-show t)

(setq skk-dcomp-activate t)
(setq skk-dcomp-multiple-activate t)
(setq skk-dcomp-multiple-rows 5)


;; dictionary
(setq skk-jisyo-code 'utf-8)
(setq skk-large-jisyo "~/skk/SKK-JISYO.L.utf8")
(setq skk-jisyo "~/skk/skk-jisyo")  ; 個人辞書
(setq skk-extra-jisyo-file-list
      (list "~/skk/SKK-JISYO.jinmei.utf8"
            "~/skk/SKK-JISYO.geo.utf8"
            "~/skk/SKK-JISYO.propernoun.utf8"
            "~/skk/SKK-JISYO.station.utf8"
            "~/skk/SKK-JISYO.edict.utf8"
            "~/skk/SKK-JISYO.zipcode.utf8"
            "~/skk/SKK-JISYO.itaiji.utf8"))
