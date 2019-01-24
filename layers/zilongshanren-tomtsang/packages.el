                                        ; -*- lexical-binding: t -*-
;;; packages.el --- zilongshanren Layer packages File for Spacemacs
;;
;; Copyright (c) 2014-2016 zilongshanren
;;
;; Author: zilongshanren <guanghui8827@gmail.com>
;; URL: https://github.com/zilongshanren/spacemacs-private
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defconst zilongshanren-tomtsang-packages
  '(
    ;; (go :variables gofmt-command "goimports"
    ;;     go-use-gometalinter t
    ;;     go-tab-width 4)
    ;; go-mode
    ac-ispell
    command-log-mode
    easy-hugo
    ein
    elpy
    flycheck

    (org :location built-in)
    ox-hugo
    py-autopep8
    ;; vmd-mode
    ;; (ox-hugo :location (recipe :fetcher github :repo "kaushalmodi/ox-hugo"))
    ;; (zilongshanren-org :location built-in)
    ;; (blog-admin :location (recipe
    ;;                        :fetcher github
    ;;                        :repo "codefalling/blog-admin"))
    ;; org-tree-slide
    ;; ox-reveal
    ;; worf
    ;; org-download
    ;; plain-org-wiki
    ))

(defun zilongshanren-tomtsang/init-ein ()
  (use-package ein
    :init))

(defun zilongshanren-tomtsang/init-py-autopep8 ()
  (use-package py-autopep8
    :init))

(defun zilongshanren-tomtsang/init-flycheck ()
  (use-package flycheck
    :init))


(defun zilongshanren-tomtsang/init-elpy ()
  (use-package elpy
    :init
    (elpy-enable)
    ;; (elpy-use-ipython) ;; can't use, ref: https://elpy.readthedocs.io/en/latest/ide.html#interpreter-setup
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt")
    ;; use flycheck not flymake with elpy
    (when (require 'flycheck nil t)
      (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
      (add-hook 'elpy-mode-hook 'flycheck-mode)
      (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))))

;; (defun zilongshanren-tomtsang/init-go ()
;;   (use-package go
;;     :init
;;     )
;;   )

;; (defun zilongshanren-tomtsang/init-go-mode ()
;;   (use-package go-mode
;;     :init
;;     )
;;   )




;; (defun zilongshanren-tomtsang/init-vmd-mode ()
;;   (use-package vmd-mode
;;     :init
;;     )
;;   )

(defun zilongshanren-tomtsang/post-init-vmd-mode ()
  (global-set-key (kbd "M-m p") 'vmd-mode) ;; make a global binding for that,
  (add-hook 'markdown-mode-hook 'vmd-mode) ;; or add a hook...
  )


(defun zilongshanren-tomtsang/pre-init-org ()
  (setq org-enable-hugo-support t) ; 这个参数，放在 post-init-org 下，是失效的。
  )

(defun zilongshanren-tomtsang/init-ox-hugo ()
  ;; ox-hugo config
  (use-package ox-hugo
    :ensure t                    ;Auto-install the package from Melpa (optional)
    :after ox
    :init
    )

  )

(defun zilongshanren-tomtsang/init-ox-hugo-auto-export ()
  (use-package ox-hugo-auto-export
    :init) ;If you want the auto-exporting on file saves
  )

;; (defun zilongshanren-tomtsang/init-easy-hugo ()
;;   (use-package easy-hugo
;;     :init
;;     (setq easy-hugo-basedir "~/bitbucket/qqbb/tomtsang-rootsongjc-hugo/content/posts/")
;;     ;; (setq easy-hugo-postdir-list ("content/post/" "content/posts/"))
;;     (setq easy-hugo-postdir "content/posts")
;;     (setq easy-hugo-select-postdir t)
;;     ;; (setq easy-hugo-select-postdir "~/bitbucket/qqbb/tomtsang-rootsongjc-hugo/content/posts/")
;;     (setq easy-hugo-url "https://b.qqbb.app")
;;     ;; (setq easy-hugo-sshdomain "blogdomain")
;;     (setq easy-hugo-root "/home/tomtsang/")
;;     (setq easy-hugo-previewtime "300")
;;     (setq easy-hugo-default-ext ".org")
;;     :bind ("C-c C-e" . easy-hugo)
;;     ))

;; (defun zilongshanren-tomtsang/easy-hugo ()
;;   ;; (defun zilongshanren-tomtsang/post-init-easy-hugo ()
;;   (interactive)
;;   (evil-define-key
;;     (list 'normal 'insert 'visual 'motion)
;;     easy-hugo-mode-map
;;     "n" 'easy-hugo-newpost
;;     "D" 'easy-hugo-article
;;     "p" 'easy-hugo-preview
;;     "P" 'easy-hugo-publish
;;     "o" 'easy-hugo-open
;;     "d" 'easy-hugo-delete
;;     "e" 'easy-hugo-open
;;     "c" 'easy-hugo-open-config
;;     "f" 'easy-hugo-open
;;     "N" 'easy-hugo-no-help
;;     "v" 'easy-hugo-view
;;     "r" 'easy-hugo-refresh
;;     "g" 'easy-hugo-refresh
;;     "s" 'easy-hugo-sort-time
;;     "S" 'easy-hugo-sort-char
;;     "G" 'easy-hugo-github-deploy
;;     "A" 'easy-hugo-amazon-s3-deploy
;;     "C" 'easy-hugo-google-cloud-storage-deploy
;;     "q" 'evil-delete-buffer
;;     (kbd "TAB") 'easy-hugo-open
;;     (kbd "RET") 'easy-hugo-preview)
;;   ;; (define-key global-map (kbd "C-c C-e") 'easy/hugo)
;;   )

(defun zilongshanren-tomtsang/init-easy-hugo ()
  (use-package easy-hugo
    ;; :after (helm-ag)
    :ensure t
    :config
    (setq easy-hugo-basedir "~/bitbucket/qqbb/tomtsang-rootsongjc-hugo/"
          easy-hugo-postdir "content/post"
          easy-hugo-url "https://b.qqbb.app"
          easy-hugo-preview-url "http://127.0.0.1:1313/"
          ;; easy-hugo-sshdomain "me"
          easy-hugo-root "/Users/tomtsang"
          easy-hugo-previewtime "20"
          easy-hugo-default-ext ".org"
          )
    ;; (add-hook 'easy-hugo-mode-hook 'zilongshanren-tomtsang/easy-hugo)
    :init
    :bind ("C-c e" . easy-hugo)
    ))

(defun zilongshanren-tomtsang/init-ac-ispell ()
  (use-package ac-ispell
    :init
    )
  )

(defun zilongshanren-tomtsang/init-command-log-mode ()
  (use-package command-log-mode
    :init
    )
  )

(defun zilongshanren-tomtsang/post-init-command-log ()
  (with-eval-after-load 'global-command-log-mode
    (setq open-command-log-buffer t)
    (setq clm/log-command-exceptions* (append clm/log-command-exceptions*
                                              '(evil-next-visual-line
                                                evil-previous-visual-line)))))

(defun zilongshanren-tomtsang/post-init-ac-ispell ()
  (with-eval-after-load 'global-ac-ispell
    (add-hook 'org-mode 'ac-ispell-ac-setup)
    )
  )

(defun zilongshanren-tomtsang/post-init-org ()
  (add-hook 'org-mode-hook (lambda () (spacemacs/toggle-line-numbers-off)) 'append)
  (with-eval-after-load 'org
    (progn
      (setq org-todo-keywords
            (quote ((sequence "TODO(t!)" "STARTED(s!)" "|" "DONE(d!/!)")
                    (sequence  "NEXT(n!)" "SOMEDAY(S)" "WAITING(w@/!)"  "|" "CANCELLED(c@/!)" "ABORT(a@/!)" "PHONE(p)"))))
      ;; (quote ((sequence "TODO(t!)" "STARTED(s)" "NEXT(n!)" "WAITING(w@/!)" "SOMEDAY(S)" "|" "DONE(d!/!)" "CANCELLED(c@/!)" "ABORT(a@/!)"))))

      ;; define the refile targets
      (setq org-agenda-file-inbox (expand-file-name "inbox.org" org-agenda-dir))
      (setq org-agenda-file-task (expand-file-name "task.org" org-agenda-dir))
      (setq org-agenda-file-finished (expand-file-name "finished.org" org-agenda-dir))
      (setq org-agenda-file-trash (expand-file-name "trash.org" org-agenda-dir))
      (setq org-agenda-file-project (expand-file-name "project.org" org-agenda-dir))
      (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
      (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
      (setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
      (setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
      (setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
      ;; (setq org-agenda-files (list org-agenda-dir))

      ;; https://github.com/15cm/spacemacs-config/blob/master/layers/my-writing/packages.el
      ;; agenda files for tag search
      (
       ;; let ((notes-dir "~/org-notes"))
       let ((notes-dir "~/org"))
       (if (file-exists-p notes-dir)
           (progn
             (load-library "find-lisp")
             (setq org-agenda-files (find-lisp-find-files "~/org" "\.org$")
                   ;; (setq org-agenda-files (find-lisp-find-files "~/org-notes" "\.org$")
                   )
             )))


      (with-eval-after-load 'org-agenda
        (define-key org-agenda-mode-map (kbd "P") 'org-pomodoro)
        (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
          "." 'spacemacs/org-agenda-transient-state/body)
        )
      ;; the %i would copy the selected text into the template
      ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
      ;;add multi-file journal
      (setq org-capture-templates
            '(("i" "Todo" entry (file+headline org-agenda-file-inbox "Ideas")
               "* TODO [#B] %?\n  %i\n"
               :empty-lines 1)
              ("t" "Todo" entry (file+headline org-agenda-file-gtd "Workspace")
               "* TODO [#B] %?\n  %i\n"
               :empty-lines 1)
              ("n" "notes" entry (file+headline org-agenda-file-note "Quick notes")
               "* %?\n  %i\n %U"
               :empty-lines 1)
              ("c" "Chrome" entry (file+headline org-agenda-file-note "Quick notes")
               "* TODO [#C] %?\n %(zilongshanren/retrieve-chrome-current-tab-url)\n %i\n %U"
               :empty-lines 1)
              ("l" "links" entry (file+headline org-agenda-file-note "Quick notes")
               "* TODO [#C] %?\n  %i\n %a \n %U"
               :empty-lines 1)
              ("b" "Blog Ideas" entry (file+headline org-agenda-file-note "Blog Ideas")
               "* TODO [#B] %?\n  %i\n %U"
               :empty-lines 1)
              ("s" "Code Snippet" entry
               (file org-agenda-file-code-snippet)
               "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC")
              ("w" "work" entry (file+headline org-agenda-file-gtd "WORK")
               "* TODO [#A] %?\n  %i\n %U"
               :empty-lines 1)
              ("j" "Journal Entry"
               entry (file+datetree org-agenda-file-journal)
               "* %?"
               :empty-lines 1)))
      ;;An entry without a cookie is treated just like priority ' B '.
      ;;So when create new task, they are default 重要且紧急
      (setq org-agenda-custom-commands
            '(
              ("w" . "任务安排")
              ("wa" "重要且紧急的任务" tags-todo "+PRIORITY=\"A\"")
              ("wb" "重要且不紧急的任务" tags-todo "-Weekly-Monthly-Daily+PRIORITY=\"B\"")
              ("wc" "不重要且紧急的任务" tags-todo "+PRIORITY=\"C\"")
              ("b" "Blog" tags-todo "BLOG")
              ("e" "Emacs" tags-todo "emacs")
              ("g" . "golang")
              ("gl" "Golang learn" tags-todo "golang")
              ("k" . "kubernetes")
              ("kl" "k8" tags-todo "k8s")
              ("d" "docker" tags-todo "docker")
              ("p" . "项目安排")
              ("pf" tags-todo "PROJECT+WORK+CATEGORY=\"future\"")
              ("pe" tags-todo "PROJECT=\"emacs\"")
              ("W" "Weekly Review"
               ((stuck "") ;; review stuck projects as designated by org-stuck-projects
                (tags-todo "PROJECT") ;; review all projects (assuming you use todo keywords to designate projects)
                ))))


      ;; Of course I’m using a handy capture template, as provided by the ox-hugo docs.
      ;; https://www.baty.net/2018/lets-try-using-ox-hugo-again/
      ;; This lets me type C-c c h to quickly create a new draft post.
      (with-eval-after-load 'org-capture
        (defun org-hugo-new-subtree-post-capture-template ()
          "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
          (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
                 (fname (org-hugo-slug title)))
            (mapconcat #'identity
                       `(
                         ,(concat "* TODO " title)
                         ":PROPERTIES:"
                         ,(concat ":EXPORT_FILE_NAME: " fname)
                         ":END:"
                         "%?\n")        ;Place the cursor here finally
                       "\n")))

        (add-to-list 'org-capture-templates
                     '("h"              ;`org-capture' binding + h
                       "Hugo post"
                       entry
                       ;; It is assumed that below file is present in `org-directory'
                       ;; and that it has a "Blog Ideas" heading. It can even be a
                       ;; symlink pointing to the actual location of all-posts.org!
                       (file+olp "all-posts.org" "Blog Ideas")
                       (function org-hugo-new-subtree-post-capture-template))))

      ;; (with-eval-after-load 'ox-hugo
      ;;   ()
      )))
