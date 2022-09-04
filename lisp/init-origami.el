(use-package origami
  :ensure t
  :hook ((c++-mode . origami-mode)
         (java-mode . origami-mode)
         (python-mode . origami-mode)
         )
  :bind (("C-c c". origami-toggle-node)
         )
  )

(provide 'init-origami)
