
;============================ 语言环境字符集设置 =================================
;;这一部份主要用在linux 环境下，windows下没什么作用

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
(setq ansi-color-for-comint-mode t) ;;处理shell-mode乱码,好像没作用

;=========================== 语言环境字符集设置结束 =============================== 
;============================ Linux环境下字体设置 =================================

(set-default-font "Monospace-11") 

;============================ Linux环境下字体设置结束 ==============================

 
 (set-scroll-bar-mode nil)
 ;;取消滚动栏
 
 ;;(customize-set-variable 'scroll-bar-mode 'right))
 ;;设置滚动栏在窗口右侧，而默认是在左侧
 
 (tool-bar-mode nil)
 ;;取消工具栏
 

 
 ;;启动自动最大化(数据自己调整，注意格式，如(top . 0)，圆点前后都要留有空格)
(setq initial-frame-alist '((top . 30) (left . 20) (width . 120) (height . 36)))
 
 
 ;; 设置另外一些颜色：语法高亮显示的背景和主题，区域选择的背景和主题，二次选择的背景和选择
(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")
(set-face-foreground 'region "cyan")
(set-face-background 'region "blue")
(set-face-foreground 'secondary-selection "skyblue")
(set-face-background 'secondary-selection "darkblue")
 
 ;;------------窗口界面设置结束-----------------
 
 ;;------------显示时间设置------------------------------
 
 (display-time-mode 1);;启用时间显示设置，在minibuffer上面的那个杠上
 (setq display-time-24hr-format t);;时间使用24小时制
 (setq display-time-day-and-date t);;时间显示包括日期和具体时间
 (setq display-time-use-mail-icon t);;时间栏旁边启用邮件设置
 (setq display-time-interval 10);;时间的变化频率，单位多少来着？
 
 ;;------------显示时间设置结束--------------
 
 ;;------------定制操作习惯--------------------
 
 ;;设置打开文件的缺省路径
 ;;(setq default-directory "~/")
 ;;(setenv "HOME" "D:/My Documents/Visual Studio 2008/Projects") 
 ;;(setenv "PATH" "D:/My Documents/Visual Studio 2008/Projects") 
 ;;set the default file path 
 (setq default-directory "~/work/") 
 
 ;;------------------------------------------
 
 ;;ido的配置,这个可以使你在用C-x C-f打开文件的时候在后面有提示;
 ;;这里是直接打开了ido的支持，在emacs23中这个是自带的.
 (ido-mode t)
 
 (setq ido-save-directory-list-file nil)
 ;;ido模式中不保存目录列表,解决退出Emacs时ido要询问编码的问题。
 
 ;;(setq visible-bell t)
 ;;关闭烦人的出错时的提示声
 
 (setq inhibit-startup-message t)
 ;;关闭emacs启动时的画面
 
 (setq gnus-inhibit-startup-message t)
 ;;关闭gnus启动时的画面
 
 (fset 'yes-or-no-p 'y-or-n-p)
 ;; 改变 Emacs 固执的要你回答 yes 的行为。按 y 或空格键表示 yes，n 表示 no。
 
 
 (setq column-number-mode t)
;; (setq line-number-mode t)
 ;;显示行列号


(require 'linum)        ;;加载相应插件       
(global-linum-mode 1)   ;;设置自动启用行号模式

 (setq mouse-yank-at-point t)
 ;;不要在鼠标点击的那个地方插入剪贴板内容。我不喜欢那样，经常把我的文档搞的一团糟。我觉得先用光标定位，然后鼠标中键点击要好的多。不管你的光标在文档的那个位置，或是在 minibuffer，鼠标中键一点击，X selection 的内容就被插入到那个位置。
 
 (setq kill-ring-max 200)
 ;;设置粘贴缓冲条目数量.用一个很大的kill ring(最多的记录个数). 这样防止我不小心删掉重要的东西
 
 (setq-default auto-fill-function 'do-auto-fill)
  ; Autofill in all modes;;
 (setq default-fill-column 120)
 ;;把 fill-column 设为 60. 这样的文字更好读
 
 (setq-default indent-tabs-mode nil)
 (setq default-tab-width 8);;tab键为8个字符宽度
 (setq tab-stop-list ())
 ;;不用 TAB 字符来indent, 这会引起很多奇怪的错误。编辑 Makefile 的时候也不用担心，因为 makefile-mode 会把 TAB 键设置成真正的 TAB 字符，并且加亮显示的。
 
 (setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
 (setq sentence-end-double-space nil)
 ;;设置 sentence-end 可以识别中文标点。不用在 fill 时在句号后插入两个空格。
 
 (setq enable-recursive-minibuffers t)
 ;;可以递归的使用 minibuffer
 
 (setq scroll-margin 3  scroll-conservatively 10000)
 ;;防止页面滚动时跳动， scroll-margin 3 可以在靠近屏幕边沿3行时就开始滚动，可以很好的看到上下文。
 
 (setq default-major-mode 'text-mode)
 (add-hook 'text-mode-hook 'turn-on-auto-fill)
 ;;设置缺省主模式是text，,并进入auto-fill次模式.而不是基本模式fundamental-mode
 
 (show-paren-mode t)
 ;;打开括号匹配显示模式
 
 (setq show-paren-style 'parenthesis)
 ;;括号匹配时可以高亮显示另外一边的括号，但光标不会烦人的跳到另一个括号处。
 
 (mouse-avoidance-mode 'animate)
 ;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
 
 (setq frame-title-format "emacs@%b")
 ;;在标题栏显示buffer的名字，而不是 emacs@wangyin.com 这样没用的提示。
 
 (setq uniquify-buffer-name-style 'forward);;好像没起作用
 ;; 当有两个文件名相同的缓冲时，使用前缀的目录名做 buffer 名字，不用原来的foobar<?> 形式。
 
 (setq auto-image-file-mode t)
 ;;让 Emacs 可以直接打开和显示图片。
 
 ;(auto-compression-mode 1)
 ;打开压缩文件时自动解压缩。
 
 (setq global-font-lock-mode t)
 ;;进行语法加亮。
 
 (setq-default kill-whole-line t)
 ;; 在行首 C-k 时，同时删除该行。
 
 (add-hook 'comint-output-filter-functions
       'comint-watch-for-password-prompt)
 ;;当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码
 
 ;;(setq version-control t);;启用版本控制，即可以备份多次
 ;; (setq kept-old-versions 2);;备份最原始的版本两次，及第一次编辑前的文档，和第二次编辑前的文档
 ;; (setq kept-new-versions 1);;备份最新的版本1次，理解同上
 ;; (setq delete-old-versions t);;删掉不属于以上3中版本的版本
 ;; (setq backup-directory-alist '(("." . "~/backups")));;设置备份文件的路径
 ;; (setq backup-by-copying t);;备份设置方法，直接拷贝
 ;; Emacs 中，改变文件时，默认都会产生备份文件(以 ~ 结尾的文件)。可以完全去掉; (并不可取)，也可以制定备份的方式。这里采用的是，把所有的文件备份都放在一个固定的地方("~/backups")。对于每个备份文件，保留最原始的两个版本和最新的1个版本。并且备份的时候，备份文件是复本，而不是原件。
 
 (setq make-backup-files nil)
 ;; 设定不产生备份文件
 
 ;;(setq auto-save-mode nil)
 ;;自动保存模式
 
 (setq-default make-backup-files nil)
 ;; 不生成临时文件
 
 (put 'scroll-left 'disabled nil)     ;允许屏幕左移
 (put 'scroll-right 'disabled nil)    ;允许屏幕右移
 (put 'set-goal-column 'disabled nil)
 (put 'narrow-to-region 'disabled nil)
 (put 'upcase-region 'disabled nil)
 (put 'downcase-region 'disabled nil)
 (put 'LaTeX-hide-environment 'disabled nil)
 ;;把这些缺省禁用的功能打开。
 
 ;;允许emacs和外部其他程序的粘贴
 (setq x-select-enable-clipboard t)
 
 ;;(setq mouse-yank-at-point t)
 ;;使用鼠标中键可以粘贴
 
 (setq user-full-name "lankiny")
 (setq user-mail-address "leverage.s05e11@gmail.com")
 ;;设置有用的个人信息,这在很多地方有用。
 
 (setq require-final-newline t)
 ;; 自动的在文件末增加一新行
 
 (setq-default transient-mark-mode t)
 ;;Non-nil if Transient-Mark mode is enabled.
 
 (setq track-eol t)
 ;; 当光标在行尾上下移动的时候，始终保持在行尾。
 
 (setq Man-notify-method 'pushy)
 ;; 当浏览 man page 时，直接跳转到 man buffer。
 
 ;;(setq next-line-add-newlines nil)
 ;;Emacs 21 中已经是缺省设置。按 C-n 或向下键时不添加新行。
 
 (global-set-key [home] 'beginning-of-buffer)
 (global-set-key [end] 'end-of-buffer)
 ;;设置home键指向buffer开头，end键指向buffer结尾
 
 
 (global-set-key (kbd "C-,") 'scroll-left)
 ;; "C-,"设为屏幕左移命令
 (global-set-key (kbd "C-.") 'scroll-right)
 ;; "C-."设为屏幕右移命令
 
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
 ;;目的是开一个shell的小buffer，用于更方便地测试程序(也就是运行程序了)，我经常会用到。
 ;;f8就是另开一个buffer然后打开shell，C-f8则是在当前的buffer打开shell
 
 (setq speedbar-show-unknown-files t);;可以显示所有目录以及文件
 (setq dframe-update-speed nil);;不自动刷新，手动 g 刷新
 (setq speedbar-update-flag nil)
 (setq speedbar-use-images nil);;不使用 image 的方式
 (setq speedbar-verbosity-level 0)
 
 
 (setq dired-recursive-copies 'top)
 (setq dired-recursive-deletes 'top)
 ;;让 dired 可以递归的拷贝和删除目录。
 

 
 (setq time-stamp-active t)
 (setq time-stamp-warn-inactive t)
 (setq time-stamp-format "%:y-%02m-%02d %3a %02H:%02M:%02S chunyu")
 ;; 设置时间戳，标识出最后一次保存文件的时间。
 
 (global-set-key (kbd "M-g") 'goto-line)
 ;;设置M-g为goto-line
 
 (global-set-key (kbd "C-SPC") 'nil)
 ;;取消control+space键设为mark
 
 (global-set-key (kbd "s-SPC") 'set-mark-command)
 ;;用win+space键来set-mark，这样，C-SPC就可以用来调用外部输入法了。
 
 ;;----------定制操作习惯结束-------------
 
 ;;----------日历设置--------------------
 
 ;;设置日历的一些颜色
 (setq calendar-load-hook
 '(lambda ()
 (set-face-foreground 'diary-face "skyblue")
 (set-face-background 'holiday-face "slate blue")
 (set-face-foreground 'holiday-face "white")))
 
 ;;设置我所在地方的经纬度，calendar里有个功能是日月食的预测，和你的经纬度相联系的。
 ;; 让emacs能计算日出日落的时间，在 calendar 上用 S 即可看到
 (setq calendar-latitude +39.54)
 (setq calendar-longitude +116.28)
 (setq calendar-location-name "北京")
 
 ;; 设置阴历显示，在 calendar 上用 pC 显示阴历
 (setq chinese-calendar-celestial-stem
   ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
 (setq chinese-calendar-terrestrial-branch
   ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])
 
 ;; 设置 calendar 的显示
 (setq calendar-remove-frame-by-deleting t)
 (setq calendar-week-start-day 1)            ; 设置星期一为每周的第一天
 (setq mark-diary-entries-in-calendar t)     ; 标记calendar上有diary的日期
 (setq mark-holidays-in-calendar nil)        ; 为了突出有diary的日期，calendar上不标记节日
 (setq view-calendar-holidays-initially nil) ; 打开calendar的时候不显示一堆节日
 
 ;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
 (setq christian-holidays nil)
 (setq hebrew-holidays nil)
 (setq islamic-holidays nil)
 (setq solar-holidays nil)
 (setq general-holidays '((holiday-fixed 1 1 "元旦")
                          (holiday-fixed 2 14 "情人节")
                          (holiday-fixed 3 14 "白色情人节")
                          (holiday-fixed 4 1 "愚人节")
                          (holiday-fixed 5 1 "劳动节")
                          (holiday-float 5 0 2 "母亲节")
                          (holiday-fixed 6 1 "儿童节")
                          (holiday-float 6 0 3 "父亲节")
                          (holiday-fixed 7 1 "建党节")
                          (holiday-fixed 8 1 "建军节")
                          (holiday-fixed 9 10 "教师节")
                          (holiday-fixed 10 1 "国庆节")
                          (holiday-fixed 12 25 "圣诞节")))
 

 
 ;;-----------日历设置结束----------------

 
 ;;-------------方便编程操作设置----------------
 
 (autoload 'css-mode "css-mode" "CSS editing mode" t)
 ;;css-mode.el编辑css文件
 
 (autoload 'htmlize-buffer "htmlize" "HTMLize mode" t)
 ;;把buffer的内容连同颜色转为html格式
 
 (autoload 'folding-mode          "folding" "Folding mode" t)
 (autoload 'turn-off-folding-mode "folding" "Folding mode" t)
 (autoload 'turn-on-folding-mode  "folding" "Folding mode" t)
 ;;folding.el 编辑文本的一部分，其它部分折叠起来
 
 (setq auto-mode-alist
       ;; 将文件模式和文件后缀关联起来
       (append '(("\\.py\\'" . python-mode)
                 ("\\.s?html?\\'" . html-helper-mode)
                 ("\\.asp\\'" . html-helper-mode)
                 ("\\.phtml\\'" . html-helper-mode)
                 ("\\.css\\'" . css-mode))
               auto-mode-alist))
 
 ;;------------方便编程操作设置结束--------------------

;; -----------------------------------------
;; 将子窗口自动编号,然后按M-0…9跳转(最爱)
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

;; ------------一些小而有用的扩展--------------------
(require 'ascii)

(require 'dired+)

(require 'tabbar-settings)

(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-load-default)
(desktop-read);
;;---------------------------------------------------

;;------------代码注释doxymacs-----------------------
(add-to-list 'load-path
             "~/.emacs.d/install/doxymacs-1.8.0/lisp/");
(require 'doxymacs) ;; 启动doxymacs
;;注释高亮，针对C和C++程序
(defun my-doxymacs-font-lock-hook ()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock)))
(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(doxymacs-mode);doxymacs-mode常true
(add-hook 'c-mode-common-hook 'doxymacs-mode) ;; 启动doxymacs-mode
(add-hook 'c++-mode-common-hook 'doxymacs-mode) ;; 启动doxymacs-mode
;;---C-c d i
;;----------------------------------------------------------------------

;解决emacs shell 乱码
(setq ansi-color-for-comint-mode t)
(customize-group 'ansi-colors)
(kill-this-buffer);关闭customize窗口


;;========================================

;;列编辑
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
;;启动和初始化w3m.el
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
;;使用w3m作为默认的浏览器
(setq browse-url-browser-function 'w3m-browse-url)
;;使用工具包
(setq w3m-use-toolbar t)
;;启用cookie
(setq w3m-use-cookies t)
;;显示图标
(setq w3m-show-graphic-icons-in-header-line t)
(setq w3m-show-graphic-icons-in-mode-line t)
;;设定w3m运行的参数，分别为使用cookie和使用框架
(setq w3m-command-arguments '("-cookie" "-F"))
;;用w3m浏览网页时也显示图片
(setq w3m-display-inline-image t)
;;w3m是使用tab的，设定Tab的宽度
(setq w3m-tab-width 4)
;;设定w3m的主页
(setq w3m-home-page "http://cn.bing.com")
(setq w3m-use-favicon nil)

;;代理的设置
(setq w3m-command-arguments
      (nconc w3m-command-arguments
             '("-o" "http_proxy=http://127.0.0.1:8087/")))


;;;============================================================
