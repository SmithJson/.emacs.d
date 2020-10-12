(require 'org)

(require 'org-tempo)

;; 高亮 org-mode
(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
