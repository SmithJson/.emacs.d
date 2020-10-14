(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
  )

;; add whatever packages you want here
(defvar stone/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 popwin
			 reveal-in-osx-finder
			 ) "Default packages")

(setq package-selected-packages stone/packages)

(defun stone/packages-installed-p ()
	(loop for pkg in stone/packages
				when (not (package-installed-p pkg)) do (return nil)
				finally (return t)))

(unless (stone/packages-installed-p)
	(message "%s" "Refreshing package database...")
	(package-refresh-contents)
	(dolist (pkg stone/packages)
		(when (not (package-installed-p pkg))
			(package-install pkg))))

(global-hungry-delete-mode)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

(smartparens-global-mode t)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(when (memq window-system '(mac ns))
	(exec-path-from-shell-initialize))

(require 'popwin)
(popwin-mode t)

(global-company-mode t)

(load-theme 'monokai t)

(provide 'init-packages)
