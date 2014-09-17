;;------------------------------------------------------------------
;;  色々基本的な設定
;;------------------------------------------------------------------
;; コマンドを探す
(dolist (dir (list
              "/sbin"
              "/usr/sbin"
              "/bin"
              "/usr/bin"
              "/opt/local/bin"
              "/sw/bin"
              "/usr/local/bin"
              "/usr/local/share/npm/bin"
              "/Users/jyane/.nodebrew/current/bin"
              (expand-file-name "~/bin")
              (expand-file-name "~/.emacs.d/bin")
              ))
 (when (and (file-exists-p dir) (not (member dir exec-path)))
   (setenv "PATH" (concat dir ":" (getenv "PATH")))
   (setq exec-path (append (list dir) exec-path))))

;; UTF-8を優先する
(prefer-coding-system 'utf-8)
;; メニューバーを表示しない
(menu-bar-mode -1)
;; ツールバーを表示しない
(tool-bar-mode -1)
;; スタートアップメッセージを表示しない
(setq inhibit-startup-message t)
;; バックアップファイルを作成しない
(setq make-backup-files nil)
;; 自動保存の機能を停止する
(setq auto-save-default nil)
;; 最後に改行を挿入する
(setq require-final-newline t)
;; UNDOを100000回まで保持する
(setq history-length 100000)
;; yes-no が面倒
(fset 'yes-or-no-p 'y-or-n-p)
;; line-wrap
(set-default 'fill-column 200)
;; バッファ開くと自動で再読み込み
(global-auto-revert-mode 1)

(global-set-key "\C-h" 'delete-backward-char)      ;; c-h でバックスペース
(global-set-key "\C-m" 'newline-and-indent)        ;; c-m で改行時自動インデント
(global-set-key (kbd "C-t") 'other-window-or-split) ;; c-t でウィンドウ分割か移動

;; 端で折り返さない
(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)

;; クリップボードとキルリングを同期する
(cond (window-system
       (setq x-select-enable-clipboard t)
       ))

;; filefind のデフォルト
(cd "~/")

;; 行数を表示する
(global-linum-mode t)


;; うるさいまぶしい
(setq visible-bell t)
(setq ring-bell-function 'ignore)


;;------------------------------------------------------------------
;;  インデントの設定
;;------------------------------------------------------------------
;; タブ幅は2にする
(setq-default tab-width 2)
(setq js-indent-level 2)
;; インデントは全て半角スペースで行う
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))



(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))
(set-face-background 'trailing-whitespace "purple4")
