(load "~/.emacs.d/personal/defuns.el")
(load "~/.emacs.d/personal/global.el")

(load "~/.emacs.d/personal/templates.el")
(load "~/.emacs.d/personal/flymake.el")
(load "~/.emacs.d/personal/c++-mode.el")
(load "~/.emacs.d/personal/hs-mode.el")
(load "~/.emacs.d/personal/python-mode.el")
(load "~/.emacs.d/personal/ruby-mode.el")
(load "~/.emacs.d/personal/shell-mode.el")
(load "~/.emacs.d/personal/package.el")
(load "~/.emacs.d/personal/view.el")

(load "~/.emacs.d/personal/anzu.el")
(load "~/.emacs.d/personal/auto-complete.el")
(load "~/.emacs.d/personal/coffee-mode.el")
(load "~/.emacs.d/personal/helm-mode.el")
(load "~/.emacs.d/personal/js2-mode.el")
(load "~/.emacs.d/personal/markdown-mode.el")
(load "~/.emacs.d/personal/powerline.el")
(load "~/.emacs.d/personal/sass-mode.el")
(load "~/.emacs.d/personal/scss-mode.el")
(load "~/.emacs.d/personal/volatile-highlights.el")
(load "~/.emacs.d/personal/web-mode.el")
(load "~/.emacs.d/personal/yaml-mode.el")


;; ;; vendor from defuns.el
;; (vendor 'less-css-mode 'less-css-mode)
;; (vendor 'emmet-mode 'emmet-mode)
;; (vendor 'haml-mode 'haml-mode)
;; (vendor 'haskell-mode 'haskell-mode) ;; 重い
;; (vendor 'scala-mode2)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(custom-safe-themes
   (quote
    ("0e121ff9bef6937edad8dfcff7d88ac9219b5b4f1570fd1702e546a80dba0832" default)))
 '(helm-ff-auto-update-initial-value nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
