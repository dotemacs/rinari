(defvar current-rails-application nil
  "Path to current active Rails application.")

(let ((current-directory (file-name-directory load-file-name)))
  (setq rinari-root-path (expand-file-name ".." current-directory))
  (setq rinari-util-path (expand-file-name "util" rinari-root-path)))

(add-to-list 'load-path rinari-root-path)
(add-to-list 'load-path (expand-file-name "espuds" (expand-file-name "test" rinari-util-path)))
(add-to-list 'load-path (expand-file-name "ert" (expand-file-name "test" rinari-util-path)))

(require 'rinari)
(require 'espuds)
(require 'ert)

(require 'cl)

(defun rails-version()
  "Determine rails version"
  (save-excursion
    (let ((buffer "*rails-version*"))
      (flet ((kill-buffer-and-return-version (buffer version) 
					     (progn 
					       (kill-buffer buffer)
					       version)))
	(progn 
	  (shell-command "rails -v" buffer)
	  (switch-to-buffer buffer)
	  (goto-char (point-min))
	  (if (search-forward "Rails 2" (point-max) t)
	      (kill-buffer-and-return-version buffer 2)
	    (progn 
	      (goto-char (point-min))
	      (if (search-forward "Rails 3" (point-max) t)
		  (kill-buffer-and-return-version buffer 3)))))))))

(Setup
 (make-directory (expand-file-name "tmp" rinari-root-path)))

(Teardown
;(After
 (shell-command (concat "rm -Rf " (expand-file-name "tmp" rinari-root-path)))
 (setq rinari-minor-mode-hook '()))
