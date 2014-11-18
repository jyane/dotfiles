(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(require 'cl)
(defvar installing-package-list
  '(anzu
    auto-complete
    coffee-mode
    color-theme
    helm
    js2-mode
    markdown-mode
    molokai-theme
    powerline
    sass-mode
    scss-mode
    slim-mode
    volatile-highlights
    web-mode
    yaml-mode))
(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))
