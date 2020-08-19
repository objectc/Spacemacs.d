(defun make-buffer-subdir (name)
  (let ((path  (concat (file-name-directory buffer-file-name) name)))
    (make-directory path t)
    (file-name-as-directory path))
  )

;; Paste from clipboard
(defun org-paste-clipboard ()
  (interactive)
  (setq myvar/folder-name "images")	;

  (setq myvar/folder-path  (make-buffer-subdir myvar/folder-name)) ;  (file-name-directory buffer-file-name)
  (let* ((image-file (concat
		      myvar/folder-path
		      (read-string "Enter image name:")
		      ".png")))

    (message image-file)
    ;; requires pngpaste on OSX (brew install pngpaste)
    (call-process-shell-command (concat "pngpaste " image-file))

    (insert (concat  "#+CAPTION: " (read-string "Caption: ") "\n"))
    (insert (format "[[file:%s]]"  (concat "./" myvar/folder-name "/" (file-name-nondirectory image-file))  ))
    (org-display-inline-images)))
