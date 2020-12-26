(in-package example)


(defmacro defrule (name &body body)
  "This is a fake macro just to see if documentation
extractor is able to extract docs from custom forms."
  `(defparameter ,name '(,@(rest body))))


(defrule number-one
    "This is a rule's docstring. Nothing special, just a text.

After macro-expansion it will be just:

    (defparameter number-one '((a b c)))

"
  (a b c))


(defun foo (first &key (other 100500))
  "This is example function.

Internally it calls EXAMPLE:DO-THE-JOB)
to do the real job.

CL-API does not support any markup and you can
put links into the docstrings."
  (example:do-the-job first other))
