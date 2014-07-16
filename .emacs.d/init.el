(load "~/.emacs.d/personal/defuns.el")
(load "~/.emacs.d/personal/global.el")
(load "~/.emacs.d/personal/templates.el")
(load "~/.emacs.d/personal/view.el")
(load "~/.emacs.d/personal/flymake.el")
(load "~/.emacs.d/personal/c++-mode.el")
(load "~/.emacs.d/personal/hs-mode.el")
(load "~/.emacs.d/personal/python-mode.el")
(load "~/.emacs.d/personal/ruby-mode.el")
(load "~/.emacs.d/personal/shell-mode.el")

;; vendor from defuns.el
(vendor 'coffee-mode)
(vendor 'less-css-mode 'less-css-mode)
(vendor 'emmet-mode 'emmet-mode)
(vendor 'haml-mode 'haml-mode)
(vendor 'helm)
(vendor 'sass-mode)
(vendor 'scss-mode)
(vendor 'web-mode)
(vendor 'yaml-mode 'yaml-mode)
(vendor 'js2-mode 'js2-mode) ;; 重い
(vendor 'haskell-mode 'haskell-mode) ;; 重い
(vendor 'scala-mode2)
(vendor 'auto-complete)
(vendor 'slim-mode)
(vendor 'markdown-mode)

(add-hook 'css-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (setq css-indent-level tab-width)))

(load "~/.emacs.d/personal/helm-mode.el")
