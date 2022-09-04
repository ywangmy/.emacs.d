(use-package company
  :ensure t
  :init
  (global-company-mode)
  :custom
  (company-tooltip-align-annotations t)
  (company-show-quick-access 'left)
  )

(provide 'init-company)
