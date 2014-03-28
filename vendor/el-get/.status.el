((ace-jump-mode status "installed" recipe
                (:name ace-jump-mode :website "https://github.com/winterTTr/ace-jump-mode/wiki" :description "A quick cursor location minor mode for emacs" :type github :pkgname "winterTTr/ace-jump-mode" :features ace-jump-mode))
 (ag status "installed" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el." :type github :pkgname "Wilfred/ag.el"))
 (ansi-color status "installed" recipe
             (:name ansi-color :description "translate ANSI escape sequences into faces" :type emacswiki :website "http://www.emacswiki.org/emacs/download/ansi-color.el"))
 (apache-mode status "installed" recipe
              (:name apache-mode :description "Major mode for editing Apache configuration files" :type github :pkgname "emacsmirror/apache-mode"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)))
 (auto-highlight-symbol status "installed" recipe
                        (:name auto-highlight-symbol :type github :pkgname "emacsmirror/auto-highlight-symbol" :description "Automatic highlighting current symbol minor mode" :website "https://github.com/emacsmirror/auto-highlight-symbol/"))
 (cl-lib status "installed" recipe
         (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (coffee-mode status "installed" recipe
              (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :post-init
                     (progn
                       (add-to-list 'auto-mode-alist
                                    '("\\.coffee$" . coffee-mode))
                       (add-to-list 'auto-mode-alist
                                    '("Cakefile" . coffee-mode))
                       (setq coffee-js-mode 'javascript-mode))))
 (color-moccur status "installed" recipe
               (:name color-moccur :type http :url "http://www.bookshelf.jp/elc/color-moccur.el" :description "multi-buffer occur (grep) mode" :website "http://www.bookshelf.jp/soft/meadow_50.html"))
 (copyedit-ja status "installed" recipe
              (:name copyedit-ja :description "Copyediting utilities for editors" :type github :pkgname "hisashim/copyedit" :post-init
                     (load-library "copyedit-ja")))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (dmacro status "installed" recipe
         (:name dmacro :type http :website "http://www.pitecan.com/DynamicMacro/" :description "detect repeatable operation and repeat it" :url "http://www.pitecan.com/papers/JSSSTDmacro/dmacro.el"))
 (edit-server status "installed" recipe
              (:name edit-server :description "Emacs edit-server. This provides an edit server to respond to requests from the Chrome Emacs Chrome plugin." :type http :url "http://github.com/stsquad/emacs_chrome/raw/master/servers/edit-server.el"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :load "el-get.el"))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (exec-path-from-shell status "installed" recipe
                       (:name exec-path-from-shell :website "https://github.com/purcell/exec-path-from-shell" :description "Emacs plugin for dynamic PATH loading" :type github :pkgname "purcell/exec-path-from-shell"))
 (expand-region status "installed" recipe
                (:name expand-region :type github :pkgname "magnars/expand-region.el" :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want." :website "https://github.com/magnars/expand-region.el#readme" :features expand-region))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
           (s dash)
           :type github :pkgname "rejeep/f.el"))
 (flycheck status "installed" recipe
           (:name flycheck :type github :pkgname "flycheck/flycheck" :description "On-the-fly syntax checking extension" :build
                  '(("makeinfo" "-o" "doc/flycheck.info" "doc/flycheck.texi"))
                  :info "./doc" :depends
                  (s dash cl-lib f pkg-info)))
 (flymake-easy status "installed" recipe
               (:name flymake-easy :type github :description "Helpers for easily building flymake checkers" :pkgname "purcell/flymake-easy" :website "http://github.com/purcell/flymake-easy"))
 (flymake-ruby status "installed" recipe
               (:name flymake-ruby :type github :description "A flymake handler for ruby-mode files" :pkgname "purcell/flymake-ruby" :website "http://github.com/purcell/flymake-ruby" :depends
                      (flymake-easy)
                      :post-init
                      (add-hook 'ruby-mode-hook 'flymake-ruby-load)))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (git-gutter status "installed" recipe
             (:name git-gutter :description "Emacs port of GitGutter Sublime Text 2 Plugin" :website "https://github.com/syohex/emacs-git-gutter" :type github :pkgname "syohex/emacs-git-gutter"))
 (git-modes status "installed" recipe
            (:name git-modes :description "GNU Emacs modes for various Git-related files" :type github :pkgname "magit/git-modes"))
 (hatena-markup-mode status "installed" recipe
                     (:name hatena-markup-mode :description "Major mode for Hatena Syntax http://d.hatena.ne.jp/tarao/20130110/1357821338" :type http :url "http://gist.github.com/raw/4428666/hatena-markup-mode.el"))
 (hatena-multi-mode status "installed" recipe
                    (:name hatena-multi-mode :type http :depends multi-mode-util :url "http://gist.github.com/raw/4475652/hatena-multi-mode.el"))
 (helm status "installed" recipe
       (:name helm :description "Emacs incremental and narrowing framework" :type github :pkgname "emacs-helm/helm" :compile nil :features helm-config))
 (helm-c-yasnippet status "installed" recipe
                   (:name helm-c-yasnippet :type github :pkgname "emacs-helm/helm-c-yasnippet" :description "Helm source for yasnippet.el." :features helm-c-yasnippet :depends
                          (helm yasnippet)))
 (inf-ruby status "installed" recipe
           (:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "nonsequitur/inf-ruby"))
 (js2-mode status "installed" recipe
           (:name js2-mode :website "https://github.com/mooz/js2-mode#readme" :description "An improved JavaScript editing mode" :type github :pkgname "mooz/js2-mode" :prepare
                  (autoload 'js2-mode "js2-mode" nil t)))
 (magit status "installed" recipe
        (:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :depends
               (cl-lib git-modes)
               :info "." :build
               (if
                   (version<= "24.3" emacs-version)
                   `(("make" ,(format "EMACS=%s" el-get-emacs)
                      "all"))
                 `(("make" ,(format "EMACS=%s" el-get-emacs)
                    "docs")))
               :build/berkeley-unix
               (("touch" "`find . -name Makefile`")
                ("gmake"))))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type git :url "git://jblevins.org/git/markdown-mode.git" :before
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (moccur-edit status "installed" recipe
              (:name moccur-edit :auto-generated t :type emacswiki :description "apply replaces to multiple files" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/moccur-edit.el"))
 (motion-mode status "installed" recipe
              (:name motion-mode :type github :website "https://github.com/ainame/motion-mode" :branch "master" :description "Major mode for RubyMotion." :pkgname "ainame/motion-mode"))
 (multi-mode status "installed" recipe
             (:name multi-mode :website "http://www.loveshack.ukfsn.org/emacs/" :description "support for multiple major modes" :type http :url "http://www.loveshack.ukfsn.org/emacs/multi-mode.el"))
 (multi-mode-util status "installed" recipe
                  (:name multi-mode-util :type http :depends multi-mode :url "http://raw.github.com/tarao/multi-mode-util/master/multi-mode-util.el"))
 (nginx-mode status "installed" recipe
             (:name nginx-mode :website "https://github.com/ajc/nginx-mode" :description "major mode for editing nginx config files" :type github :pkgname "ajc/nginx-mode"))
 (pbcopy status "installed" recipe
         (:name pbcopy :description "An interface to OSX's pbcopy utility" :type github :pkgname "jkp/pbcopy.el" :features "pbcopy"))
 (php-mode status "installed" recipe
           (:name php-mode :description "A PHP mode for GNU Emacs " :type github :pkgname "ejmr/php-mode" :website "https://github.com/ejmr/php-mode"))
 (pkg-info status "installed" recipe
           (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
                  (dash epl)))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (puppet-mode status "installed" recipe
              (:name puppet-mode :description "A simple mode for editing puppet manifests" :type github :pkgname "lunaryorn/puppet-mode" :website "https://github.com/lunaryorn/puppet-mode" :prepare
                     (progn
                       (autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests" t)
                       (add-to-list 'auto-mode-alist
                                    '("\\.pp$" . puppet-mode)))))
 (review-mode status "installed" recipe
              (:name review-mode :type github :pkgname "kmuto/review-el" :after
                     (progn
                       (require 'review-mode))))
 (riece status "installed" recipe
        (:name riece :type http-tar :options
               ("xzf")
               :description "IRC client" :url "http://dl.sv.gnu.org/releases/riece/riece-8.0.0.tar.gz" :build
               `(("./configure")
                 ("make" ,(concat "EMACS=" el-get-emacs)))
               :load-path
               ("lisp")))
 (robe-mode status "installed" recipe
            (:name robe-mode :type github :description "Code navigation, documentation lookup and completion for Ruby" :pkgname "dgutov/robe" :website "https://github.com/dgutov/robe" :depends
                   (inf-ruby)
                   :post-init
                   (add-hook 'ruby-mode-hook 'robe-mode)))
 (rspec-mode status "installed" recipe
             (:name rspec-mode :description "Enhance ruby-mode for RSpec" :type github :pkgname "pezra/rspec-mode" :features rspec-mode))
 (ruby-mode status "installed" recipe
            (:name ruby-mode :builtin "24" :type http :description "Major mode for editing Ruby files." :url "http://bugs.ruby-lang.org/projects/ruby-trunk/repository/raw/misc/ruby-mode.el"))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el" :features s))
 (scss-mode status "installed" recipe
            (:name scss-mode :description "Major mode for editing SCSS files(http://sass-lang.com)" :type github :pkgname "antonj/scss-mode" :features scss-mode))
 (smartparens status "installed" recipe
              (:name smartparens :description "Autoinsert pairs of defined brackets and wrap regions" :type github :pkgname "Fuco1/smartparens" :depends dash))
 (undo-tree status "installed" recipe
            (:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
 (web-mode status "installed" recipe
           (:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
 (yasnippet status "installed" recipe
            (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :features "yasnippet" :pre-init
                   (unless
                       (or
                        (boundp 'yas/snippet-dirs)
                        (get 'yas/snippet-dirs 'customized-value))
                     (setq yas/snippet-dirs
                           (list
                            (concat el-get-dir
                                    (file-name-as-directory "yasnippet")
                                    "snippets"))))
                   :post-init
                   (put 'yas/snippet-dirs 'standard-value
                        (list
                         (list 'quote
                               (list
                                (concat el-get-dir
                                        (file-name-as-directory "yasnippet")
                                        "snippets")))))
                   :compile nil :submodule t)))
