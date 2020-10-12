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

;; 自动缩紧
;; (electric-indent-mode -1)

(provide 'init-better-defaults)
