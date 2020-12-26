(in-package example)


(defun concat (first second)
  "This function is not exported and should not be showed in the API reference."
  (format nil "~A ~A" first second))


(defun do-the-job (first second)
  "The function does the job.

It *concatenates* first and second arguments
calling internal function concat.

On this multiline we'll check how does documentation
system processes docstrings. It does not deindent
subsequent lines and I have to shift them to the left
in the code."
  (concat first second))
