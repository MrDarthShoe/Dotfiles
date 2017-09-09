					;Start package.el with emacs
(require 'package)
					;add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
					;initialize package.el
(package-initialize)



;User defined configs
(cua-mode)
(line-number-mode 1)
;(setq frame-title-format "tylko emacs")
(tool-bar-mode -1)
(global-set-key (kbd "M-x") 'smex)
(winner-mode 1)
(global-linum-mode 1)
(global-set-key(kbd "C-M-z") 'switch-window)
(show-paren-mode 1)
(setq auto-save-default nil)
;; (setq x-select-enable-clipboard-manager t)
;; (setq x-select-enable-clipboard t)

(defalias 'yes-or-no-p 'y-or-n-p)

(clipmon-mode)


;MOVING TEXT
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 0)


;(global-set-key (kbd "C-j") 'previous)

(require 'cc-mode)       ;SEMANTYKA costam
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1 )
(semantic-mode 1)

(require 'recentf)        ; Recent files mode (good very very good)
(recentf-mode 1)
(setq recentf-max-menu-items 35)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

(setq gdb-many-windows 1)

(autopair-global-mode)

(require 'auto-complete)

(require 'auto-complete-config)
(ac-config-default)

(require 'clang-format)
(global-set-key [C-M-tab] 'clang-format-region)


(require 'yasnippet)

(add-hook 'c++-mode-hook 'yas-global-mode 1)
(add-hook 'python-mode-hook 'yas-global-mode 1)
(add-hook 'c-mode-hook 'yas-global-mode 1)


(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/6.3.1")
 ; (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/4.9")
 (add-to-list 'achead:include-directories '"/usr/include/c++/6.3.1/backward")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-linux-gnu/6.3.1/include")
  (add-to-list 'achead:include-directories '"/usr/local/include")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-linux-gnu/6.3.1/include-fixed")
  ;(add-to-list 'achead:include-directories '"/usr/include/x86_64-pc-linux-gnu")
  (add-to-list 'achead:include-directories '"/usr/include")
)
					;call function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


;Iedit (edytuje wiele powtórzeń słowa jednocześnie)
(define-key global-map (kbd "C-:") 'iedit-mode) ;

;Ace jump - to skacze do konkretnego znaku downie
(global-set-key(kbd "C-;") 'ace-jump-mode)



;No speedbar po prostu (po prawej okienko z plikami )
(require 'sr-speedbar)
(global-set-key(kbd "C-'") 'sr-speedbar-toggle)
(sr-speedbar-refresh-turn-off)
(setq sr-speedbar-width 25)


(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++14")))
(add-hook 'c++-mode-hook (lambda () (setq flycheck-irony-language-standard "c++14")))



(require 'irony)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(setq irony-additional-clang-options '("-std=c++14"))

;(setq irony--compile-options
 ;     '("-std=c++11"))


(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))


(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
;(with-eval-after-load 'flycheck
;  (flycheck-pos-tip-mode))



(require 'company)
(add-hook 'c++-mode-hook 'company-mode)
  (add-hook 'python-mode-hook 'company-mode)
  (add-hook 'c-mode-hook 'company-mode)
 
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))


;(require 'rtags) ;; optional, must have rtags installed
;(cmake-ide-setup)

(require 'helm-config)

(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x m") 'helm-M-x)


(global-set-key (kbd "M-c") 'helm-show-kill-ring) ;Zapisuje skopiowane regiony tekstu ;oooo 
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(setq helm-split-window-in-side-p  t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(helm-mode 1)

(require 'helm-gtags)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)

(setq helm-gtags-auto-update 5)
(setq helm-gtags-update-interval-second 1)
(global-set-key (kbd "M-,") 'helm-gtags-dwim)
(global-set-key (kbd "M-.") 'helm-gtags-find-files)


(add-hook 'c++-mode-hook 'function-args-mode)
(add-hook 'c-mode-hook 'function-args-mode)


(global-set-key (kbd "M-/") 'moo-jump-local)
(global-set-key (kbd "C-/") 'moo-jump-directory)


;(add-hook 'c++-mode-hook 'fa-config-default)








;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& POCZATEK THEME
;THEME CYBERPUNK BELOW 
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector
;;    ["#000000" "#8b0000" "#00ff00" "#ffa500" "#7b68ee" "#dc8cc3" "#93e0e3" "#dcdccc"])
;;  '(custom-enabled-themes (quote (solarized-dark)))
;;  '(custom-safe-themes
;;    (quote
;;     ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "38e64ea9b3a5e512ae9547063ee491c20bd717fe59d9c12219a0b1050b439cdd" default)))
;;  '(fci-rule-color "#383838")
;;  '(flycheck-checkers
;;    (quote
;;     (irony ada-gnat asciidoctor avr-gcc asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint css-stylelint d-dmd dockerfile-hadolint elixir-dogma emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck go-unconvert groovy haml handlebars haskell-stack-ghc haskell-ghc haskell-hlint html-tidy javascript-eslint javascript-jshint javascript-jscs javascript-standard json-jsonlint json-python-json less less-stylelint lua-luacheck lua perl perl-perlcritic php php-phpmd php-phpcs processing protobuf-protoc pug puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint markdown-mdl nix rst-sphinx rst ruby-rubocop ruby-rubylint ruby ruby-jruby rust-cargo rust scala scala-scalastyle scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim slim-lint sql-sqlint systemd-analyze tex-chktex tex-lacheck texinfo typescript-tslint verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
;;  '(flycheck-gcc-include-path (quote ("/usr/avr/include/avr")))
;;  '(font-use-system-font t)
;;  '(initial-buffer-choice nil)
;;  '(package-selected-packages
;;    (quote
;;     (gruvbox-theme evil clipmon go-mode drag-stuff move-text auto-complete-c-headers switch-window swiper-helm sr-speedbar solarized-theme smex rtags projectile levenshtein iedit helm-gtags function-args flycheck-title flycheck-pos-tip flycheck-irony flycheck-color-mode-line cyberpunk-theme company-irony-c-headers company-irony autopair ace-jump-mode ac-clang ac-c-headers)))
;;  '(speedbar-visiting-file-hook (quote (sr-speedbar-visiting-file-hook)))
;;  '(sr-speedbar-default-width 25)
;;  '(sr-speedbar-max-width 40))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; ;;Tutaj do -nw 
;; (if (display-graphic-p)
;;     (enable-theme 'solarized-dark)


;;   (disable-theme 'solarized-dark))

;; (if display-graphic-p)
;;      (enable-theme 'gruvbox-theme )

;; (disable-theme 'gruvbox-theme)
;;(enable-theme 'gruvbox-dark-medium)

;; ;&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& KONIEC THEME
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a33858123d3d3ca10c03c657693881b9f8810c9e242a62f1ad6380adf57b031c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
