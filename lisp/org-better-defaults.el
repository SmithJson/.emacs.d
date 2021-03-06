(setq ring-bell-function 'ignore)

(global-linum-mode t)

(global-auto-revert-mode t)
(setq make-backup-files nil)

(setq auto-save-default nil)

(set-default 'abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; entry 触发
					    ("8se" "Stone")
					    ))

(recentf-mode t)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

;; buffer 缩紧格式化
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

;; buffer 缩紧格式化
(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol
					 ))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)
(setq dired-dwim-target t)

;; (electric-indent-mode -1)

(provide 'init-better-defaults)
