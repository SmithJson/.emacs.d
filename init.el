(when (>= emacs-major-version 24)
	(require 'package)
	; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
	(add-to-list 'package-archives '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/") t)
	)
(require 'cl)

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
			 ) "Default packages")

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

(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; config for smartparens
(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; config for js2-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; config for exec-path-from-shell
(when (memq window-system '(mac ns))
	(exec-path-from-shell-initialize))

;; 跳转查询内容所在文件
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; tool-bar
(tool-bar-mode -1)

;; scroll-bar
(scroll-bar-mode -1)

;; 缩紧
;; (electric-indent-mode -1)

;; 行号
(global-linum-mode t)

;; 备份文件
(setq make-backup-files nil)

;; 文件记录
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 高亮 org-mode
(require 'org)
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(require 'org-tempo)

;; 替换选中文本
(delete-selection-mode t)

;; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮当前行
(global-hl-line-mode t)

;; 打开配置文件
(defun open-my-init-file()
	(interactive)
	(find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; company-mode
(global-company-mode t)

(load-theme 'monokai t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(package-selected-packages
   '(company monokai-theme hungry-delete swiper counsel smartparens js2-mode nodejs-repl exec-path-from-shell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "dark gray")))))
