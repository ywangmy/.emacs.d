(use-package whitespace
  :init
  (global-whitespace-mode t)
  :custom
  ;;(whitespace-space-regexp "\\(^ +\\)")
  ;;(whitespace-tab-regexp "\\(^\t+\\)")
  (whitespace-style '(face tabs trailing))
  )

(provide 'init-whitespace)
