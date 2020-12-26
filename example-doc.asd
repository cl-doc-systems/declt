(defsystem "example-doc"
  :class :package-inferred-system
  :pathname "doc/scripts/"
  :depends-on ("example-doc/builder"))
