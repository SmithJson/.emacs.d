;; 警告声音
(setq ring-bell-function 'ignore)

;; 行号
(global-linum-mode t)

(global-auto-revert-mode t)

;; 备份文件
(setq make-backup-files nil)

;; 自动恢复
(setq auto-save-default nil)

;; 缩写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; entry 触发
					    ("8se" "Stone")
					    ))

;; 文件记录
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 替换选中文本
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

;; 增强 hippie 提示
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

;; 交互问答中的回答使用缩写
(fset 'yes-or-no-p 'y-or-n-p)

;; 递归删除
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 复用 buffer
(put 'dired-find-alternate-file 'disabled nil)
(require 'dired-x)

(setq dired-dwim-target t)

;; 自动缩紧
;; (electric-indent-mode -1)

(provide 'init-better-defaults)
