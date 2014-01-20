;; helm
(require 'helm-config)
(helm-mode 1)

(defun my-helm ()
  (interactive)
  (helm :sources '(helm-c-source-buffers-list
                   helm-c-source-recentf
                   helm-c-source-files-in-current-dir
                   helm-c-source-buffer-not-found)
        :buffer "*my helm*"))
;; for find files
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
(define-key helm-c-read-file-map (kbd "C-h") 'delete-backward-char)
(define-key helm-c-read-file-map (kbd "C-f") 'helm-execute-persistent-action)
(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key global-map (kbd "C-;") 'my-helm)
