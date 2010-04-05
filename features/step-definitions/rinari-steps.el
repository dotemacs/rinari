(Given "Rails application \"\\(.+\\)\""
       (lambda (name)
         (let ((app (expand-file-name name (expand-file-name "tmp" rinari-root-path))))
           (setq current-rails-application app)
           (shell-command (concat "rails _2.3.5_ -q " app)))))

(Then "TAGS should be set to \"\\(.+\\)\""
      (lambda (tags)
        (should tags)
        (should tags-file-name)
        (should (string-match-p tags tags-file-name))))

(When "I visit \"\\(.+\\)\""
      (lambda (file)
        (find-file (expand-file-name file current-rails-application))))

(When "I create a TAGS file"
      (lambda ()
        (write-file (expand-file-name "TAGS" current-rails-application))))

(Given "Rinari is \\(active\\|inactive\\)"
       (lambda (status)
         (rinari-minor-mode (if (string= status "active") 1 -1))))

(Then "Rinari should be active"
      (lambda ()
        (should rinari-minor-mode)))
