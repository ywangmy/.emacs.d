(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
  )

(provide 'init-multiplecursors)
