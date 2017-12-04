
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

;; Cmake code colors
(require 'cmake-mode)

;;HELM stuff
(require 'helm-config)
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(global-set-key "\C-x\ \C-r" 'helm-recentf)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x r b") 'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)

(helm-mode 1)

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

;; Yasnippet for snippets
(require 'yasnippet)
(yas-global-mode 1)

;;irony
(require 'irony)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)

;; auto complete clang
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;;Company-clang
(require 'company)
  (add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode)

;; (require 'auto-complete-clang)
;;   (add-hook 'c++-mode-hook 'auto-complete-mode)
;;   (add-hook 'c-mode-hook 'auto-complete-mode)
;; (setq ac-quick-help-delay 0.5)

(require 'rtags)
;; Cmake-ide (let's find out! - installed: rtags, flycheck, auto-complete-clang, company-clang??, irony)

(cmake-ide-setup)
;; (setq cmake-ide-flags-c++ '(
;;                             "-I/usr/include/c++/7.2.0"
;;                             "-I/usr/include/c++/7.2.0/x86_64-linux-gnu/."
;;                             "-I/usr/include/c++/7.2.0/backward"
;;                             "-I/usr/lib/gcc/x86_64-linux-gnu/7.2.0/include"
;;                             "-I/usr/local/include"
;;                             "-I/usr/lib/gcc/x86_64-linux-gnu/7.2.0/include-fixed"
;;                             "-I/usr/include/x86_64-linux-gnu"
;;                             "-I/usr/include"
;;                        ))


;; Autocomplete - methods in class etc.
;; (define-key ac-mode-map  [(control tab)] 'ac-complete-clang)
(rtags-enable-standard-keybindings)
(global-set-key [C-tab] 'company-clang)
(global-set-key (kbd "<f1>") 'rtags-find-symbol-at-point)
(global-set-key (kbd "M-<f1>") 'rtags-location-stack-back)
(global-set-key (kbd "C-<f1>") 'rtags-location-stack-forward)
(global-set-key (kbd "<f2>") 'rtags-imenu)
(global-set-key (kbd "<f3>") 'rtags-find-file)
(global-set-key (kbd "<f4>") 'rtags-find-references-at-point)
(global-set-key (kbd "<f5>") 'cmake-ide-compile)


;; END OF CONFIG

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cmake-ide-build-dir "~/Documents/projects/Grunts")
 '(package-selected-packages
   (quote
    (company yasnippet cmake-mode helm clang-format auctex sr-speedbar smex rtags irony gruvbox-theme flycheck drag-stuff cmake-ide auto-complete-clang ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
