(use-package org
  :hook ((org-mode . turn-on-auto-fill)
         )
  :custom
  (org-descriptive-links . nil)
  )

(provide 'init-org)
