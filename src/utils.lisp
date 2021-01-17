(defpackage #:example/utils
  (:use #:cl)
  (:export #:do-the-job)
  (:documentation "The utils package.

The only exported function DO-THE-JOB will be show in a separate
section \"Exported Definitions\".
"))
(in-package example/utils)


(defun concat (first second)
  "This function is not exported and should not be showed in the API reference."
  (format nil "~A ~A" first second))


(defun do-the-job (first second)
  "The function does the job.

It CONCATENATES first and second arguments
calling internal function concat.

On this multiline we'll check how does documentation
system processes docstrings.

NOTE: pay attention the Texinfo markup in the second paragraph
does not supported in docstrings and I was not able to make
CONCATENATES word bold :(" 
  (concat first second))
