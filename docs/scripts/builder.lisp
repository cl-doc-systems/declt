(defpackage #:example-doc/builder
  (:use #:cl)
  (:import-from #:atdoc)
  (:import-from #:example/app)
  (:export #:build))
(in-package example-doc/builder)


(defun build ()
  (let ((title "ATDOC example project")
        (packages '(:example/app
                    :example/class
                    :example/utils))
        ;; atdoc fails if pathname is relative.
        ;; that is why we need to make it absolute:
        (html-dir (merge-pathnames #P"docs/build/"))
        (latex-dir (merge-pathnames #P"docs/build/latex/"))
        (info-dir (merge-pathnames #P"docs/build/info/"))
        ;; To make class documentation more verbose
        (include-slot-definitions-p t)
        ;; To see which commands are executed under the hood.
        ;; This can be useful for debugging.
        (asdf:*verbose-out* t))
    (ensure-directories-exist latex-dir)
    (ensure-directories-exist info-dir)
    
    (atdoc:generate-html-documentation packages
                                       html-dir
                                       ;; By default, multipage documentation is generated
                                       ;; and because of backslashes in package inferred names
                                       ;; CSS is not loaded propertly on pages other than index.html.
                                       ;; 
                                       ;; That is why I've switched to the single page:
                                       :single-page-p t
                                       :include-slot-definitions-p include-slot-definitions-p
                                       :index-title title
                                       :heading title)
    (atdoc:generate-info-documentation packages
                                       info-dir 
                                       :name "example"
                                       :title title
                                       :include-slot-definitions-p include-slot-definitions-p)
    (atdoc:generate-latex-documentation packages
                                        latex-dir
                                        :title title
                                        :include-slot-definitions-p include-slot-definitions-p)

    (uiop:with-output-file (s (merge-pathnames ".nojekyll" html-dir)
                              :if-exists :overwrite)
      (declare (ignorable s)))))
