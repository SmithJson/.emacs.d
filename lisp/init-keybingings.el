;; swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-c p f") 'counsel-git)

;; 跳转查询内容所在文件
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 历史记录列表
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 快速打开 init.el
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; 格式化缩紧
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(provide 'init-keybingings)
