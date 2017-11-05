
;;Start package.el with emacs
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; My new "lightweight" config for emacs

;; First some emacs-built-in features:
(cua-mode)
(line-number-mode 1)
(global-linum-mode t)
(tool-bar-mode -1)
(show-paren-mode 1)
(setq auto-save-default nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq backup-directory-alist `(("." . "/tmp/emacs_saves")))

;; I have installed also AUCTeX!!

;; Change tab to 4 spaces?
;; (setq-default indent-tabs-mode nil)
;; (setq-default tab-width 4)
;; (setq indent-line-function 'insert-tab)

;; Some tabulation
(setq-default indent-tabs-mode nil)
(setq c-default-style "linux" c-basic-offset 4)


;; Clang format!
(global-set-key (kbd "C-M-f") 'clang-format)

;;Easy switch windows
 (global-set-key (kbd "C-M-z") 'ace-window)

;; Last opened files 
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;SMEX- easier enter of commands
(global-set-key (kbd "M-x") 'smex)

;; Theme- gruvbox for everyone!
(load-theme 'gruvbox-dark-medium t)

;; Drag lines and other stuff
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;; Files tree on the left
 (require 'sr-speedbar)
 (global-set-key (kbd "M-s") 'sr-speedbar-toggle)

;;flycheck
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)

;;irony
(require 'irony)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)

;; auto complete clang
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'auto-complete-clang)
  (add-hook 'c++-mode-hook 'auto-complete-mode)
  (add-hook 'c-mode-hook 'auto-complete-mode)

(require 'rtags)
;; Cmake-ide (let's find out! - installed: rtags, flycheck, auto-complete-clang, company-clang??, irony)
(cmake-ide-setup)

;; END OF CONFIG

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (clang-format auctex sr-speedbar smex rtags irony gruvbox-theme flycheck drag-stuff cmake-ide auto-complete-clang ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
