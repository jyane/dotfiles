;; c++ modeの細かいインデント設定など
;; 競技プログラミングカスタム
(add-hook 'c++-mode-hook
          '(lambda ()
             (setq tab-width 2)
             (setq c-basic-offset 2)
             (setq c++-auto-newline nil)
             (setq c++-tab-always-indent t)
             (c-set-offset 'arglist-close 0)
             (c-set-offset 'arglist-cont 0)
             (c-set-offset 'arglist-cont-nonempty 0)
             (c-set-offset 'arglist-intro '+)
             (c-set-offset 'substatement 0)
             ))

(define-key global-map (kbd "M-q") 'fill-region)
