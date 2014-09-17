
;; iroiroの設定
(setq initial-frame-alist
      (append (list
               ;; '(foreground-color . "white")    ;; 文字色
               '(background-color . "black")    ;; 背景色
               '(top . 0)
               '(left . 12)
               '(width . 198)
               '(height . 56)
               '(alpha . 85)
               )))
(setq default-frame-alist initial-frame-alist)

;; (set-face-background 'default "#ffffff")


;; フォントの設定
(set-face-attribute 'default nil
                    :family "Ricty"
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

;; molokaiのテーマを使う
;; (load "~/.emacs.d/personal/molokai.el")
;; (enable-theme 'molokai)

;; wombatのテーマを使う
(load-theme 'wombat t)

;; 特定のキーワードをハイライトする（競技プログラミング用）
(defconst c-mode-keywords
  '("REP","rep","foreach", "aiueo"))

;; 起動時に画面分割状態にする
;; (setq w (selected-window))
;; (setq w2 (split-window w nil t))
