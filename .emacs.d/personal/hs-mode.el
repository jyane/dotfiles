;; hs-minor
(add-hook 'js-mode-hook
          '(lambda ()
    (hs-minor-mode 1)))
(define-key
  global-map
  (kbd "C-#") 'hs-toggle-hiding)
