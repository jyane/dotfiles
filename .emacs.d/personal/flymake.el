;; (require 'flymake)
;; (defun flymake-cc-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "g++" (list local-file))))
;; (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
;; (push '("\\.c$" flymake-cc-init) flymake-allowed-file-name-masks)
;; (defadvice flymake-post-syntax-check (before flymake-force-check-was-interrupted)
;;   (setq flymake-check-was-interrupted t))
;; (ad-activate 'flymake-post-syntax-check)
;; (add-hook 'c-mode-hook
;;           '(lambda ()
;;              (flymake-mode t)))
;; (add-hook 'c++-mode-hook
;;           '(lambda ()
;;              (flymake-mode t)))
