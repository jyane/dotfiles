(add-to-list 'auto-mode-alist '("\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\.json$" . js2-mode)) 
(add-hook 'js2-mode-hook
          #'(lambda ()
              (require 'js)
              (setq js-indent-level 2
                    js-expr-indent-offset 2
                    indent-tabs-mode nil)
              (set (make-local-variable 'indent-line-function) 'js-indent-line)))
