(add-to-list 'auto-mode-alist '("\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(defun revert-compiled-coffee ()
  (interactive)
  (with-current-buffer
      (concat (file-name-sans-extension (buffer-name (current-buffer))) ".js")
    (revert-buffer nil t)))
(add-hook 'coffee-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'revert-compiled-coffee nil t)))
(custom-set-variables '(coffee-tab-width 2))
(setq coffee-command "/Users/jyane/.nodebrew/current/bin/coffee")
