(use-package company
  :ensure t
  :init
  (global-company-mode)
  :custom
  ;; Disable downcasing
  (company-dabbrev-downcase nil)
  ;; Drop-down menu settings
  (company-tooltip-align-annotations t)
  (company-show-quick-access 'left)
  )

(provide 'init-company)
