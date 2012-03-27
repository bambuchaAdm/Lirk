(in-package :asdf)

(defsystem "lirk"
  :description "Lisp AVR with assembly kernel"
  :version "0.0.1"
  :author "Łukasz Dubiel <bambucha14@gmail.com>"
  :license "GPL"
  :pathname "src"
  :components ((:file "main")
	       (:file "attiny13" :depends-on ("main"))))

