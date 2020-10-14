(package-initialize)

(setq lisp-path "~/.emacs.d/lisp/")

(add-to-list 'load-path lisp-path)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybingings)
(require 'init-org)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
