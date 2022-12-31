(use-package hungry-delete
  :ensure t
  :init
  (global-hungry-delete-mode)
  :custom
  (hungry-delete-join-reluctantly t)
  )

(provide 'init-hungry-delete)
