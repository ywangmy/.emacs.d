;; aas and laas
(use-package laas
  :ensure t
  :hook ((LaTeX-mode . laas-mode)
         (org-mode . laas-mode)
         )
  :init
  (setq laas-accent-snippets nil)
  (setq laas-basic-snippets nil)
  ;;(setq laas-subscript-snippets nil)
  :custom
  (laas-enable-auto-space nil)
  :config
  (aas-set-snippets 'laas-mode
    "ii" nil
    "ip1" nil
    "jj" nil
    "jp1" nil
    "kk" nil
    "kp1" nil
    "nn" nil
    "np1" nil
    )
  (aas-set-snippets 'laas-mode
    ;; operators
    :cond #'texmathp
    "sp" (lambda () (interactive) (yas-expand-snippet "^{$0}"))
    "sb" (lambda () (interactive) (yas-expand-snippet "_{$0}"))
    "eqv" "\\equiv "
    "!=" "\\neq "
    "<=" "\\leq "
    ">=" "\\geq "
    ">>" "\\gg "
    "<<" "\\ll "
    "->" "\\to "
    "+-" "\\pm "
    "-+" "\\mp "
    "<-" "\\gets "
    "=>" "\\implies "
    "~=" "\\approx "
    "iff" "\\iff "
    "n->" "\\nrightarrow "
    "n=>" "\\nRightarrow "
    "AA" "\\forall "
    "EE" "\\exists "
    "o+" "\\oplus "
    "o*" "\\otimes "
    "cc" "\\circ "
    "s\\" "\\setminus "
    ;; symbols
    :cond #'texmathp
    "NN" "\\mathbb{N} "
    "RR" "\\mathbb{R} "
    "ZZ" "\\mathbb{Z} "
    "QQ" "\\mathbb{Q} "
    "CC" "\\mathbb{C} "
    "FF" "\\mathcal{F}"
    "TT" "^{\\intercal}"
    "..." "\\dots "
    "..v" "\\vdots "
    "..d" "\\ddots "
    "..c" "\\cdots "
    ".*" "\\cdot "
    "x*" "\\times "
    ;; Calculus
    "eva" (lambda () (interactive) (yas-expand-snippet "\\bigg\\rvert_{${1:a}}^{${2:b}}"))
    ;; functions & symbols
    :cond #'texmathp
    "sin" "\\sin "
    "cos" "\\cos "
    "tan" "\\tan "
    "cot" "\\cot "
    "sec" "\\sec "
    "csc" "\\csc "
    "arcsin" "\\arcsin "
    "arccos" "\\arccos "
    "arctan" "\\arctan "
    "arccot" "\\arccot "
    "arcsec" "\\arcsec "
    "arccsc" "\\arccsc "
    "ln" "\\ln "
    "lg" "\\lg "
    "log" "\\log "
    "sq" (lambda () (interactive) (yas-expand-snippet "\\sqrt{$0}"))
    "sr" "^2"
    "cb" "^3"
    "inv" "^{-1}"
    "lim" (lambda () (interactive) (yas-expand-snippet "\\lim\\limits_{${1:n} \\to ${2:\\infty}} $0"))
    "lisu" (lambda () (interactive) (yas-expand-snippet "\\limsup\\limits_{${1:n} \\to ${2:\\infty}} $0"))
    "liin" (lambda () (interactive) (yas-expand-snippet "\\liminf\\limits_{${1:n} \\to ${2:\\infty}} $0"))
    "dint" (lambda () (interactive) (yas-expand-snippet "\\int_{${1:a}}^{${2:b}} $0"))
    "iint" (lambda () (interactive) (yas-expand-snippet "\\iint_{${1:R}} $0"))
    "tint" (lambda () (interactive) (yas-expand-snippet "\\iiint_{${1:D}} $0"))
    "oint" (lambda () (interactive) (yas-expand-snippet "\\oint_{${1:C}} $0"))
    "sum" (lambda () (interactive) (yas-expand-snippet "\\sum_{${1:k=1}}^{${n}} $0"))
    "prod" (lambda () (interactive) (yas-expand-snippet "\\prod_{${1:k=1}}^{${n}} $0"))
    "sup" "\\sup"
    "inf" "\\inf"
    "curl" "\\nabla\\times "
    "dive" "\\nabla\\cdot "
    "var" "\\sigma^2"
    ;; wrappers
    :cond #'texmathp
    "floor" (lambda () (interactive) (yas-expand-snippet "\\lfloor $0 \\rfloor"))
    "ceil" (lambda () (interactive) (yas-expand-snippet "\\lceil $0 \\rceil"))
    "set" (lambda () (interactive) (yas-expand-snippet "\\\\{ $0 \\\\}"))
    "abs" (lambda () (interactive) (yas-expand-snippet "\\left\\lvert $0 \\right\\rvert"))
    "lr(" (lambda () (interactive) (yas-expand-snippet "\\left( $0 \\right)"))
    "lr[" (lambda () (interactive) (yas-expand-snippet "\\left[ $0 \\right]"))
    "lr<" (lambda () (interactive) (yas-expand-snippet "\\langle $0 \\rangle"))
    "vv" (lambda () (interactive) (yas-expand-snippet "\\vv{$0}"))
    "hh" (lambda () (interactive) (yas-expand-snippet "\\hat{$0}"))
    :cond #'laas-object-on-left-condition
    )
  )

(provide 'init-aas)
