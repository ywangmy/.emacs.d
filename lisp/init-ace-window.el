(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)
         )
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-dispatch-always t)
  (setq aw-scope 'frame)
  )

(provide 'init-ace-window)
