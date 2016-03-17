(setq initial-frame-alist
      (append (list
               ;; '(foreground-color . "white")    ;; 文字色
               ;; '(background-color . "black")    ;; 背景色
               '(top . 0)
               '(left . 0)
               '(width . 234)
               '(height . 71)
               '(alpha . 85)
               )))
(setq default-frame-alist initial-frame-alist)

(set-face-attribute 'default nil
                    :family "Ricty Diminished"
                    :height 140)

(if (display-graphic-p)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0208
                      (cons "Ricty" "iso10646-1")))
(if (display-graphic-p)
    (set-fontset-font (frame-parameter nil 'font)
                      'japanese-jisx0212
                      (cons "Ricty" "iso10646-1")))
(if (display-graphic-p)
    (set-fontset-font (frame-parameter nil 'font)
                      'katakana-jisx0201
                      (cons "Ricty" "iso10646-1")))


;; wombatのテーマを使う
;; (load-theme 'wombat t)
(load-theme 'molokai)
(setq molokai-theme-kit t)

;; 特定のキーワードをハイライトする（競技プログラミング用）
(defconst c-mode-keywords
  '("REP","rep","foreach", "aiueo"))

