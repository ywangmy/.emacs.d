;; aas and laas
;; (use-package laas
;;   :ensure t
;;   :hook ((LaTeX-mode . laas-mode)
;;          (org-mode . laas-mode)
;;          )
;;   :init
;;   (setq laas-accent-snippets nil)
;;   (setq laas-basic-snippets nil)
;;   ;;(setq laas-subscript-snippets nil)
;;   :custom
;;   (laas-enable-auto-space nil)
;;   :config
;;   (aas-set-snippets 'laas-mode
;;     "ii" nil
;;     "ip1" nil
;;     "jj" nil
;;     "jp1" nil
;;     "kk" nil
;;     "kp1" nil
;;     "nn" nil
;;     "np1" nil
;;     )
;;   (aas-set-snippets 'laas-mode
;;     ;; operators
;;     :cond #'texmathp
;;     "n->" "\\nrightarrow "
;;     "n=>" "\\nRightarrow "
;;     ;; symbols
;;     :cond #'texmathp
;;     ;; Calculus
;;     "eva" (lambda () (interactive) (yas-expand-snippet "\\bigg\\rvert_{${1:a}}^{${2:b}}"))
;;     ;; functions & symbols
;;     :cond #'texmathp
;;     "inv" "^{-1}"
;;     "lisu" (lambda () (interactive) (yas-expand-snippet "\\limsup\\limits_{${1:n} \\to ${2:\\infty}} $0"))
;;     "liin" (lambda () (interactive) (yas-expand-snippet "\\liminf\\limits_{${1:n} \\to ${2:\\infty}} $0"))
;;     "oint" (lambda () (interactive) (yas-expand-snippet "\\oint_{${1:C}} $0"))
;;     "curl" "\\nabla\\times "
;;     "dive" "\\nabla\\cdot "
;;     "var" "\\sigma^2"
;;     ;; wrappers
;;     :cond #'texmathp
;;     "abs" (lambda () (interactive) (yas-expand-snippet "\\left\\lvert $0 \\right\\rvert"))
;;     "vv" (lambda () (interactive) (yas-expand-snippet "\\vv{$0}"))
;;     "hh" (lambda () (interactive) (yas-expand-snippet "\\hat{$0}"))
;;     :cond #'laas-object-on-left-condition
;;     )
;;   )

(provide 'init-aas)
