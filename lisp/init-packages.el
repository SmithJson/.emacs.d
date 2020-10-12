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

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; smartparens
(require 'smartparens-config)
(smartparens-global-mode t)

;; js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; exec-path-from-shell
(when (memq window-system '(mac ns))
	(exec-path-from-shell-initialize))

;; popwin
(require 'popwin)
(popwin-mode t)

;; company-mode
(global-company-mode t)

;; monokai
(load-theme 'monokai t)

(provide 'init-packages)
