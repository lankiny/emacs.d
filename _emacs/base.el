
;============================ ���Ի����ַ������� =================================
;;��һ������Ҫ����linux �����£�windows��ûʲô����

(set-language-environment 'Chinese-GB)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(setq ansi-color-for-comint-mode t) ;;����shell-mode����,����û����

;=========================== ���Ի����ַ������ý��� =============================== 
;============================ Linux�������������� =================================

(set-default-font "Monospace-11") 

;============================ Linux�������������ý��� ==============================

 
 (set-scroll-bar-mode nil)
 ;;ȡ��������
 
 ;;(customize-set-variable 'scroll-bar-mode 'right))
 ;;���ù������ڴ����Ҳ࣬��Ĭ���������
 
 (tool-bar-mode nil)
 ;;ȡ��������
 

 
 ;;�����Զ����(�����Լ�������ע���ʽ����(top . 0)��Բ��ǰ��Ҫ���пո�)
(setq initial-frame-alist '((top . 30) (left . 20) (width . 120) (height . 36)))
 
 
 ;; ��������һЩ��ɫ���﷨������ʾ�ı��������⣬����ѡ��ı��������⣬����ѡ��ı�����ѡ��
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")
 
 ;;------------���ڽ������ý���-----------------
 
 ;;------------��ʾʱ������------------------------------
 
 (display-time-mode 1);;����ʱ����ʾ���ã���minibuffer������Ǹ�����
 (setq display-time-24hr-format t);;ʱ��ʹ��24Сʱ��
 (setq display-time-day-and-date t);;ʱ����ʾ�������ں;���ʱ��
 (setq display-time-use-mail-icon t);;ʱ�����Ա������ʼ�����
 (setq display-time-interval 10);;ʱ��ı仯Ƶ�ʣ���λ�������ţ�
 
 ;;------------��ʾʱ�����ý���--------------
 
 ;;------------���Ʋ���ϰ��--------------------
 
 ;;���ô��ļ���ȱʡ·��
 ;;(setq default-directory "~/")
 ;;(setenv "HOME" "D:/My Documents/Visual Studio 2008/Projects") 
 ;;(setenv "PATH" "D:/My Documents/Visual Studio 2008/Projects") 
 ;;set the default file path 
 (setq default-directory "~/work/") 
 
 ;;------------------------------------------
 
 ;;ido������,�������ʹ������C-x C-f���ļ���ʱ���ں�������ʾ;
 ;;������ֱ�Ӵ���ido��֧�֣���emacs23��������Դ���.
 (ido-mode t)
 
 (setq ido-save-directory-list-file nil)
 ;;idoģʽ�в�����Ŀ¼�б�,����˳�EmacsʱidoҪѯ�ʱ�������⡣
 
 ;;(setq visible-bell t)
 ;;�رշ��˵ĳ���ʱ����ʾ��
 
 (setq inhibit-startup-message t)
 ;;�ر�emacs����ʱ�Ļ���
 
 (setq gnus-inhibit-startup-message t)
 ;;�ر�gnus����ʱ�Ļ���
 
 (fset 'yes-or-no-p 'y-or-n-p)
 ;; �ı� Emacs ��ִ��Ҫ��ش� yes ����Ϊ���� y ��ո����ʾ yes��n ��ʾ no��
 
 
 (setq column-number-mode t)
;; (setq line-number-mode t)
 ;;��ʾ���к�


(require 'linum)        ;;������Ӧ���       
(global-linum-mode 1)   ;;�����Զ������к�ģʽ

 (setq mouse-yank-at-point t)
 ;;��Ҫ����������Ǹ��ط�������������ݡ��Ҳ�ϲ���������������ҵ��ĵ����һ���㡣�Ҿ������ù�궨λ��Ȼ������м����Ҫ�õĶࡣ������Ĺ�����ĵ����Ǹ�λ�ã������� minibuffer������м�һ�����X selection �����ݾͱ����뵽�Ǹ�λ�á�
 
 (setq kill-ring-max 200)
 ;;����ճ��������Ŀ����.��һ���ܴ��kill ring(���ļ�¼����). ������ֹ�Ҳ�С��ɾ����Ҫ�Ķ���
 
 (setq-default auto-fill-function 'do-auto-fill)
  ; Autofill in all modes;;
 (setq default-fill-column 120)
 ;;�� fill-column ��Ϊ 60. ���������ָ��ö�
 
 (setq-default indent-tabs-mode nil)
 (setq default-tab-width 8);;tab��Ϊ8���ַ����
 (setq tab-stop-list ())
 ;;���� TAB �ַ���indent, �������ܶ���ֵĴ��󡣱༭ Makefile ��ʱ��Ҳ���õ��ģ���Ϊ makefile-mode ��� TAB �����ó������� TAB �ַ������Ҽ�����ʾ�ġ�
 
 (setq sentence-end "\\([������]\\|����\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
 (setq sentence-end-double-space nil)
 ;;���� sentence-end ����ʶ�����ı�㡣������ fill ʱ�ھ�ź���������ո�
 
 (setq enable-recursive-minibuffers t)
 ;;���Եݹ��ʹ�� minibuffer
 
 (setq scroll-margin 3  scroll-conservatively 10000)
 ;;��ֹҳ�����ʱ������ scroll-margin 3 �����ڿ�����Ļ����3��ʱ�Ϳ�ʼ���������ԺܺõĿ��������ġ�
 
 (setq default-major-mode 'text-mode)
 (add-hook 'text-mode-hook 'turn-on-auto-fill)
 ;;����ȱʡ��ģʽ��text��,������auto-fill��ģʽ.�����ǻ���ģʽfundamental-mode
 
 (show-paren-mode t)
 ;;������ƥ����ʾģʽ
 
 (setq show-paren-style 'parenthesis)
 ;;����ƥ��ʱ���Ը�����ʾ����һ�ߵ����ţ�����겻�ᷳ�˵�������һ�����Ŵ���
 
 (mouse-avoidance-mode 'animate)
 ;;��꿿�����ָ��ʱ�������ָ���Զ��ÿ�����ס���ߡ�
 
 (setq frame-title-format "emacs@%b")
 ;;�ڱ�������ʾbuffer�����֣������� emacs@wangyin.com ����û�õ���ʾ��
 
 (setq uniquify-buffer-name-style 'forward);;����û������
 ;; ���������ļ�����ͬ�Ļ���ʱ��ʹ��ǰ׺��Ŀ¼���� buffer ���֣�����ԭ����foobar<?> ��ʽ��
 
 (setq auto-image-file-mode t)
 ;;�� Emacs ����ֱ�Ӵ򿪺���ʾͼƬ��
 
 ;(auto-compression-mode 1)
 ;��ѹ���ļ�ʱ�Զ���ѹ����
 
 (setq global-font-lock-mode t)
 ;;�����﷨������
 
 (setq-default kill-whole-line t)
 ;; ������ C-k ʱ��ͬʱɾ�����С�
 
 (add-hook 'comint-output-filter-functions
       'comint-watch-for-password-prompt)
 ;;������shell��telnet��w3m��ģʽ��ʱ����Ȼ������Ҫ������������,��ʱ�����Գ��������
 
 ;;(setq version-control t);;���ð汾���ƣ������Ա��ݶ��
 ;; (setq kept-old-versions 2);;������ԭʼ�İ汾���Σ�����һ�α༭ǰ���ĵ����͵ڶ��α༭ǰ���ĵ�
 ;; (setq kept-new-versions 1);;�������µİ汾1�Σ����ͬ��
 ;; (setq delete-old-versions t);;ɾ������������3�а汾�İ汾
 ;; (setq backup-directory-alist '(("." . "~/backups")));;���ñ����ļ���·��
 ;; (setq backup-by-copying t);;�������÷�����ֱ�ӿ���
 ;; Emacs �У��ı��ļ�ʱ��Ĭ�϶�����������ļ�(�� ~ ��β���ļ�)��������ȫȥ��; (������ȡ)��Ҳ�����ƶ����ݵķ�ʽ��������õ��ǣ������е��ļ����ݶ�����һ���̶��ĵط�("~/backups")������ÿ�������ļ���������ԭʼ�������汾�����µ�1���汾�����ұ��ݵ�ʱ�򣬱����ļ��Ǹ�����������ԭ����
 
 (setq make-backup-files nil)
 ;; �趨�����������ļ�
 
 ;;(setq auto-save-mode nil)
 ;;�Զ�����ģʽ
 
 (setq-default make-backup-files nil)
 ;; ��������ʱ�ļ�
 
 (put 'scroll-left 'disabled nil)     ;������Ļ����
 (put 'scroll-right 'disabled nil)    ;������Ļ����
 (put 'set-goal-column 'disabled nil)
 (put 'narrow-to-region 'disabled nil)
 (put 'upcase-region 'disabled nil)
 (put 'downcase-region 'disabled nil)
 (put 'LaTeX-hide-environment 'disabled nil)
 ;;����Щȱʡ���õĹ��ܴ򿪡�
 
 ;;����emacs���ⲿ���������ճ��
 (setq x-select-enable-clipboard t)
 
 ;;(setq mouse-yank-at-point t)
 ;;ʹ������м�����ճ��
 
 (setq user-full-name "lankiny")
 (setq user-mail-address "leverage.s05e11@gmail.com")
 ;;�������õĸ�����Ϣ,���ںܶ�ط����á�
 
 (setq require-final-newline t)
 ;; �Զ������ļ�ĩ����һ����
 
 (setq-default transient-mark-mode t)
 ;;Non-nil if Transient-Mark mode is enabled.
 
 (setq track-eol t)
 ;; ���������β�����ƶ���ʱ��ʼ�ձ�������β��
 
 (setq Man-notify-method 'pushy)
 ;; ����� man page ʱ��ֱ����ת�� man buffer��
 
 ;;(setq next-line-add-newlines nil)
 ;;Emacs 21 ���Ѿ���ȱʡ���á��� C-n �����¼�ʱ��������С�
 
 (global-set-key [home] 'beginning-of-buffer)
 (global-set-key [end] 'end-of-buffer)
 ;;����home��ָ��buffer��ͷ��end��ָ��buffer��β
 
 
 (global-set-key (kbd "C-,") 'scroll-left)
 ;; "C-,"��Ϊ��Ļ��������
 (global-set-key (kbd "C-.") 'scroll-right)
 ;; "C-."��Ϊ��Ļ��������
 
 (global-set-key [f1] 'manual-entry)
 (global-set-key [C-f1] 'info )
 
 
 (global-set-key [C-f7] 'previous-error)
 (global-set-key [f7] 'next-error)
 
 (defun open-eshell-other-buffer ()
   "Open eshell in other buffer"
   (interactive)
   (split-window-vertically)
   (eshell))
 (global-set-key [(f8)] 'open-eshell-other-buffer)
 (global-set-key [C-f8] 'eshell)
 ;;Ŀ���ǿ�һ��shell��Сbuffer�����ڸ�����ز��Գ���(Ҳ�������г�����)���Ҿ������õ���
 ;;f8������һ��bufferȻ���shell��C-f8�����ڵ�ǰ��buffer��shell
 
 (setq speedbar-show-unknown-files t);;������ʾ����Ŀ¼�Լ��ļ�
 (setq dframe-update-speed nil);;���Զ�ˢ�£��ֶ� g ˢ��
 (setq speedbar-update-flag nil)
 (setq speedbar-use-images nil);;��ʹ�� image �ķ�ʽ
 (setq speedbar-verbosity-level 0)
 
 
 (setq dired-recursive-copies 'top)
 (setq dired-recursive-deletes 'top)
 ;;�� dired ���Եݹ�Ŀ�����ɾ��Ŀ¼��
 

 
 (setq time-stamp-active t)
 (setq time-stamp-warn-inactive t)
 (setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")
 ;; ����ʱ�������ʶ�����һ�α����ļ���ʱ�䡣
 
 (global-set-key (kbd "M-g") 'goto-line)
 ;;����M-gΪgoto-line
 
 (global-set-key (kbd "C-SPC") 'nil)
 ;;ȡ��control+space����Ϊmark
 
 (global-set-key (kbd "s-SPC") 'set-mark-command)
 ;;��win+space����set-mark��������C-SPC�Ϳ������������ⲿ���뷨�ˡ�
 
 ;;----------���Ʋ���ϰ�߽���-------------
 
 ;;----------��������--------------------
 
 ;;����������һЩ��ɫ
 (setq calendar-load-hook
 '(lambda ()
 (set-face-foreground 'diary-face "skyblue")
 (set-face-background 'holiday-face "slate blue")
 (set-face-foreground 'holiday-face "white")))
 
 ;;���������ڵط��ľ�γ�ȣ�calendar���и�����������ʳ��Ԥ�⣬����ľ�γ������ϵ�ġ�
 ;; ��emacs�ܼ����ճ������ʱ�䣬�� calendar ���� S ���ɿ���
 (setq calendar-latitude +39.54)
 (setq calendar-longitude +116.28)
 (setq calendar-location-name "����")
 
 ;; ����������ʾ���� calendar ���� pC ��ʾ����
 (setq chinese-calendar-celestial-stem
   ["��" "��" "��" "��" "��" "��" "��" "��" "��" "��"])
 (setq chinese-calendar-terrestrial-branch
   ["��" "��" "��" "î" "��" "��" "��" "δ" "��" "��" "��" "��"])
 
 ;; ���� calendar ����ʾ
 (setq calendar-remove-frame-by-deleting t)
 (setq calendar-week-start-day 1)            ; ��������һΪÿ�ܵĵ�һ��
 (setq mark-diary-entries-in-calendar t)     ; ���calendar����diary������
 (setq mark-holidays-in-calendar nil)        ; Ϊ��ͻ����diary�����ڣ�calendar�ϲ���ǽ���
 (setq view-calendar-holidays-initially nil) ; ��calendar��ʱ����ʾһ�ѽ���
 
 ;; ȥ�������ĵĽ��գ��趨�Լ�����Ľ��գ��� calendar ���� h ��ʾ����
 (setq christian-holidays nil)
 (setq hebrew-holidays nil)
 (setq islamic-holidays nil)
 (setq solar-holidays nil)
 (setq general-holidays '((holiday-fixed 1 1 "Ԫ��")
                          (holiday-fixed 2 14 "���˽�")
                          (holiday-fixed 3 14 "��ɫ���˽�")
                          (holiday-fixed 4 1 "���˽�")
                          (holiday-fixed 5 1 "�Ͷ���")
                          (holiday-float 5 0 2 "ĸ�׽�")
                          (holiday-fixed 6 1 "��ͯ��")
                          (holiday-float 6 0 3 "���׽�")
                          (holiday-fixed 7 1 "������")
                          (holiday-fixed 8 1 "������")
                          (holiday-fixed 9 10 "��ʦ��")
                          (holiday-fixed 10 1 "�����")
                          (holiday-fixed 12 25 "ʥ����")))
 

 
 ;;-----------�������ý���----------------

 
 ;;-------------�����̲�������----------------
 
 (autoload 'css-mode "css-mode" "CSS editing mode" t)
 ;;css-mode.el�༭css�ļ�
 
 (autoload 'htmlize-buffer "htmlize" "HTMLize mode" t)
 ;;��buffer��������ͬ��ɫתΪhtml��ʽ
 
 (autoload 'folding-mode          "folding" "Folding mode" t)
 (autoload 'turn-off-folding-mode "folding" "Folding mode" t)
 (autoload 'turn-on-folding-mode  "folding" "Folding mode" t)
 ;;folding.el �༭�ı���һ���֣����������۵�����
 
 (setq auto-mode-alist
       ;; ���ļ�ģʽ���ļ���׺��������
       (append '(("\\.py\\'" . python-mode)
                 ("\\.s?html?\\'" . html-helper-mode)
                 ("\\.asp\\'" . html-helper-mode)
                 ("\\.phtml\\'" . html-helper-mode)
                 ("\\.css\\'" . css-mode))
               auto-mode-alist))
 
 ;;------------�����̲������ý���--------------------

;; -----------------------------------------
;; ���Ӵ����Զ����,Ȼ��M-0��9��ת(�)
(require 'window-numbering)
(window-numbering-mode 1)

;;---------------------------------------------

;;------org-mode-------------------------------
(add-to-list 'load-path "~/.emacs.d/install/org-8.0.2/lisp")
 (require 'org)
 (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
 (define-key global-map "\C-cl" 'org-store-link)
 (define-key global-map "\C-ca" 'org-agenda)
 (setq org-log-done t)
;; -------------------------------------------------

;; ------------һЩС�����õ���չ--------------------
(require 'ascii)

(require 'dired+)

(require 'tabbar-settings)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-load-default)
(desktop-read);
;;---------------------------------------------------

;;------------����ע��doxymacs-----------------------
(add-to-list 'load-path
             "~/.emacs.d/install/doxymacs-1.8.0/lisp/");
(require 'doxymacs) ;; ����doxymacs
;;ע�͸��������C��C++����
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(doxymacs-mode);doxymacs-mode��true
(add-hook 'c-mode-common-hook 'doxymacs-mode) ;; ����doxymacs-mode
(add-hook 'c++-mode-common-hook 'doxymacs-mode) ;; ����doxymacs-mode
;;---C-c d i
;;----------------------------------------------------------------------

;���emacs shell ����
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer);�ر�customize����


;;========================================

;;�б༭
;;========================================
(require 'rect-mark)
(global-set-key (kbd "C-x r C-z") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-x") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

;;================================================================

;;==========Minimap==============================================
(require 'minimap)
(global-set-key (kbd "C-c m") 'minimap-create)

;;=============================================================

;;=============================================================
(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) 
;; Auto-start on any markup modes
;;====================================================================

;;=========slime=======================
(require 'slime)
(slime-setup '(slime-fancy))
;(slime) ;M-x slime
(defun lisp-indent-or-complete (&optional arg)
  (interactive "p")
  (if (or (looking-back "^\\s-*") (bolp))
      (call-interactively 'lisp-indent-line)
      (call-interactively 'slime-indent-and-complete-symbol)))
(eval-after-load "lisp-mode"
  '(progn
     (define-key lisp-mode-map (kbd "TAB") 'lisp-indent-or-complete)))
;;;;
;;;;====================================================================

;;;;========/editing-with-root-privileges/===========================
(defun djcb-find-file-as-root ()
  "Like `ido-find-file, but automatically edit the file with
root-privileges (using tramp/sudo), if the file is not writable by
user."
  (interactive)
  (let ((file (ido-read-file-name "Edit as root: ")))
    (unless (file-writable-p file)
      (setq file (concat "/sudo:root@localhost:" file)))
    (find-file file)))
;; or some other keybinding...
(global-set-key (kbd "C-x F") 'djcb-find-file-as-root)

;;=======================================================================

;;===============magit==================================
(add-to-list 'load-path "~/.emacs.d/install/magit")
(require 'magit)
;;====================================================

;;==============emacs-w3m=====================================
(add-to-list 'load-path "~/.emacs.d/install/emacs.w3m")
(require 'w3m-load)
(require 'mime-w3m)
;;�����ͳ�ʼ��w3m.el
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
;;ʹ��w3m��ΪĬ�ϵ������
(setq browse-url-browser-function 'w3m-browse-url)
;;ʹ�ù��߰�
(setq w3m-use-toolbar t)
;;����cookie
(setq w3m-use-cookies t)
;;��ʾͼ��
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)
;;�趨w3m���еĲ������ֱ�Ϊʹ��cookie��ʹ�ÿ��
(setq w3m-command-arguments '("-cookie" "-F"))
;;��w3m�����ҳʱҲ��ʾͼƬ
(setq w3m-display-inline-image t)
;;w3m��ʹ��tab�ģ��趨Tab�Ŀ��
(setq w3m-tab-width 4)
;;�趨w3m����ҳ
(setq w3m-home-page "http://cn.bing.com")
(setq w3m-use-favicon nil)

;;���������
(setq w3m-command-arguments
      (nconc w3m-command-arguments
             '("-o" "http_proxy=http://127.0.0.1:8087/")))


;;;============================================================
