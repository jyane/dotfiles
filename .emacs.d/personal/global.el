;;------------------------------------------------------------------
;;  misc
;;------------------------------------------------------------------
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

(prefer-coding-system 'utf-8)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq require-final-newline t)
(setq history-length 100000)
(fset 'yes-or-no-p 'y-or-n-p)
(set-default 'fill-column 200)
(global-auto-revert-mode 1)
(show-paren-mode 1)
(global-set-key "\C-h" 'delete-backward-char)      ;; c-h でバックスペース
(global-set-key "\C-m" 'newline-and-indent)        ;; c-m で改行時自動インデント
(global-set-key (kbd "C-t") 'other-window-or-split) ;; c-t でウィンドウ分割か移動
(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;; クリップボードとキルリングを同期する
(cond (window-system
       (setq x-select-enable-clipboard t)
       ))

;; filefind のデフォルト
(cd "~/")

(global-linum-mode t)





;;------------------------------------------------------------------
;;  indent
;;------------------------------------------------------------------
(setq-default tab-width 2)
(setq js-indent-level 2)

(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; meta key settings
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))
(set-face-background 'trailing-whitespace "purple4")
