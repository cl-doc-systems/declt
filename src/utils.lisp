(defpackage #:example/utils
  (:use #:cl)
  (:export #:do-the-job)
  (:documentation "The utils package.

This package's docstring is not mention any functions via @code{aboutfun} or @code{aboutclass} tags.

Hence, the only exported function @fun{do-the-job} will be show in a separate
section \"Other functions in example/utils\".
"))
(in-package example/utils)


(defun concat (first second)
  "This function is not exported and should not be showed in the API reference."
  (format nil "~A ~A" first second))


(defun do-the-job (first second)
  "The function does the job.

It @v{concatenates} first and second arguments
calling internal function concat.

On this multiline we'll check how does documentation
system processes docstrings."
  (concat first second))
