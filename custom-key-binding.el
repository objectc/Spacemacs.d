;;Compatible with Mac shortcuts keys
(when (spacemacs/system-is-mac)
  (global-set-key (kbd "H-/") 'spacemacs/comment-or-uncomment-lines)

  (global-set-key (kbd "H-<up>") 'beginning-of-buffer)
  (global-set-key (kbd "H-<down>") 'end-of-buffer)
  (global-set-key (kbd "<H-left>") 'beginning-of-line)
  ;; (global-unset-key (kbd "<C-tab>") 'mac-next-tab-or-toggle-tab-bar)
  ;; (global-unset-key (kbd "<C-S-tab>") 'mac-previous-tab-or-toggle-tab-bar)
  (global-set-key (kbd "<C-tab>") 'next-buffer)
  (global-set-key (kbd "<C-S-tab>") 'previous-buffer)

  )
                                        ;(global-set-key (kbd "s-<left>") 'spacemacs/scale-up-font)

;;Python docstring
(defun python-args-to-google-docstring (text &optional make-fields)
  "Return a reST docstring format for the python arguments in yas-text."
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args text))
         (nr 0)
         (formatted-args
          (mapconcat
           (lambda (x)
             (concat "   " (nth 0 x)
                     (if make-fields (format " ${%d:arg%d}" (cl-incf nr) nr))
                     (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
           args
           indent)))
    (unless (string= formatted-args "")
      (concat
       (mapconcat 'identity
                  (list "" "Args:" formatted-args)
                  indent)
       "\n"))))

