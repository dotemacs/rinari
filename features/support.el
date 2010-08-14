(defvar current-rails-application nil
  "Path to current active Rails application.")

(let ((current-directory (file-name-directory load-file-name)))
  (setq rinari-root-path (expand-file-name ".." current-directory))
  (setq rinari-util-path (expand-file-name "util" rinari-root-path)))

(add-to-list 'load-path rinari-root-path)
(add-to-list 'load-path (expand-file-name "features" rinari-root-path))
(add-to-list 'load-path (expand-file-name "espuds" (expand-file-name "test" rinari-util-path)))
(add-to-list 'load-path (expand-file-name "ert" (expand-file-name "test" rinari-util-path)))

(require 'rinari)
(require 'espuds)
(require 'ert)
(require 'rails-helpers)
(require 'cl)

(Setup
 (make-directory (expand-file-name "tmp" rinari-root-path)))

(Teardown
 (shell-command (concat "rm -Rf " (expand-file-name "tmp" rinari-root-path))))

(After
 (setq rinari-minor-mode-hook '()))
