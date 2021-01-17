(defpackage #:docs
  (:use #:cl)
  (:import-from #:net.didierverna.declt
                #:declt)
  ;; To make sure documentation builder will
  ;; find all definitions, we need to import them.
  (:import-from #:example/app)
  (:import-from #:example/class)
  (:export #:build))
(in-package docs)


(defun build ()
  (let* ((system-name :example)
         (license (intern
                   (string-upcase
                    (asdf:system-license
                     (asdf:find-system system-name)))
                   "KEYWORD"))
         (build-dir (merge-pathnames #P"docs/build/"))
         (html-dir (merge-pathnames #P"docs/build/html/"))
         (single-page-p t)
         (texi-dir (merge-pathnames #P"docs/build/texi/"))
         (tmp-dir (merge-pathnames #P"docs/build/tmp/"))
         (sources-dir (merge-pathnames #P"docs/sources/"))
         (intro-path (merge-pathnames #P"intro.texi"
                                      sources-dir))
         (intro (when (probe-file intro-path)
                  (uiop:read-file-string intro-path)))
         (conclusion-path (merge-pathnames #P"conclusion.texi"
                                           sources-dir))
         (conclusion (when (probe-file conclusion-path)
                       (uiop:read-file-string conclusion-path))))

    (flet ((rm (dir)
             (uiop:delete-directory-tree dir :validate t :if-does-not-exist :ignore))
           (run (cmd)
             (uiop:run-program cmd
                          :output nil   ;; We only want to see errors
                          :error-output t)))

      (rm build-dir)
      (ensure-directories-exist html-dir)
      (ensure-directories-exist texi-dir)
      
      (declt system-name
             :tagline "An example of Declt documentation system."
             :license license
             :texi-directory texi-dir
             :texi-name "index"
             :introduction intro
             :conclusion conclusion
             :hyperlinks t)

      ;; Build PDF
      (ensure-directories-exist tmp-dir)
      (uiop:with-current-directory (tmp-dir)
        (run "texi2pdf ../texi/index.texi"))
      ;; We are moving PDF version to HTML dir to make it available on GitHub pages site
      (run (format nil "mv ~A/index.pdf ~A"
                   tmp-dir
                   html-dir))
      (rm tmp-dir)
      (run (format nil
                   (if single-page-p
                       "makeinfo --force --no-split --html -o ~A/index.html ~Aindex.texi"
                       "makeinfo --force --html -o ~A/ ~Aindex.texi")
                   html-dir
                   texi-dir))
    
      (uiop:with-output-file (s (merge-pathnames ".nojekyll" html-dir)
                                :if-exists :overwrite)
        (declare (ignorable s))))
    (values)))
