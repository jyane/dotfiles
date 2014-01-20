(setq auto-insert-directory "~/Dropbox/dotfiles/.emacs.d/templates/")
(load "autoinsert" t)
(setq auto-insert-alist
      (append '(("\\.cpp" . "template.cpp")
                ("\\.c" . "template.c")
                ("[Mm]akefile" . "Makefile"))
              auto-insert-alist))
(add-hook 'find-file-hooks 'auto-insert)
