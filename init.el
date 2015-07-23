;;
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Spaces for tabs
(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode nil)

;; Session management
(require 'desktop)
(desktop-save-mode 1)

;; Backup files into temp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Automatically reload files that was modified by external programs
(global-auto-revert-mode 1)

;; Ensime
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Run as server
(server-start)
