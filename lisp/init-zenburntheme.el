;; zenburn-theme
(use-package zenburn-theme
  :ensure t
  :init
  (load-theme 'zenburn t)
  (set-face-attribute 'hl-line nil :background "#595959")
  (set-face-attribute 'region nil :background "#7e7e7e")
  )

(provide 'init-zenburntheme)

