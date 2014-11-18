(add-hook 'css-mode-hook
          '(lambda ()
             (setq indent-tabs-mode t)
             (setq tab-width 4)
             (setq css-indent-level tab-width)))
