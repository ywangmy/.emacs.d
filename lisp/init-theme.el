;; Configure Themes

;; zenburn-theme
;;(require 'init-zenburntheme)

;;(load-theme 'tango t)

;; Settings for the plain theme
(set-face-attribute 'region nil
                    :background "AntiqueWhite1")
(set-face-attribute 'highlight nil
                    :background "AntiqueWhite3")
(set-face-attribute 'font-lock-function-name-face nil
                    :foreground "dark green")

(provide 'init-theme)
