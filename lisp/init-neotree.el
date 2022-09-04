(use-package neotree
  :ensure t
  :bind
  ("<f8>" . 'neotree-toggle)
  :init
  (setq neo-theme 'ascii)
  :custom
   (neo-toggle-window-keep-p t)
   )

(provide 'init-neotree)
