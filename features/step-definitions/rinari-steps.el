(Given "Rails application \"\\(.+\\)\""
       (lambda (name)
	 (let* ((tmp-dir (expand-file-name "tmp" rinari-root-path))
	       (app (expand-file-name name tmp-dir)))
	   (setq current-rails-application app)
	   (if (= (rails-version) 2)
	       (progn 
	       	 (if (not (file-exists-p tmp-dir))
	       	     (make-directory tmp-dir))
	       		 (shell-command (concat "rails " app)))
	     (shell-command (concat "# rails3 assumed, hence -> rails new " app))))))


(Given "Rinari is \\(active\\|inactive\\)"
       (lambda (status)
	 (rinari-minor-mode (if (string= status "active") 1 -1))))

(When "I visit \"\\(.+\\)\""
      (lambda (file)
        (find-file (expand-file-name file current-rails-application))))

(Then "Rinari should be active"
      (lambda ()
        (should rinari-minor-mode)))


(Given "^I generate scaffold for \"\\(.+\\)\"$"
       (lambda (scaffold-name)
	 (if (= (rails-version) 2)
	     (shell-command (concat 
			     (file-name-as-directory current-rails-application) 
			     (file-name-as-directory "script")
			     "generate scaffold " scaffold-name))
	   (message "rails3 command should go here"))))

(Then "^I should be in \"\\(.+\\)\"$"
       (lambda (buffer)
	 (string= (buffer-name) buffer)))

