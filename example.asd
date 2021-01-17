(defsystem "example" 
  :class :package-inferred-system
  :author "Alexander Artemenko"
  :license "MIT"
  :pathname "src"
  :description "This description will be used only if long-description is missing"
  :long-description "Test long description. Both descriptions will be shown in the docs."
  :depends-on ("example/app"))
