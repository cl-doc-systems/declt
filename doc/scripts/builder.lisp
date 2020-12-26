(defpackage #:example-doc/builder
  (:use #:cl)
  (:import-from #:cl-api)
  (:import-from #:example))
(in-package example-doc/builder)


(defun build ()
  (let ((path #P"doc/build/"))
    (ensure-directories-exist path)

    ;; This will create a "doc/build/example.html",
    ;; but we need index.html
    (cl-api:api-gen :example path)

    ;; Thus, we have to rename the file:
    (uiop:rename-file-overwriting-target "doc/build/example.html"
                                         "index.html")

    (uiop:with-output-file (s "doc/build/.nojekyll" :if-exists :overwrite)
      (declare (ignorable s)))))
