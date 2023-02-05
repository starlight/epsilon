(define-library
  (epsilon base)
  (import scheme r7rs)
  (export
    compile
    compile-string)

  (begin
    (define (compile program)
      (write-string "\a"))

    (define (compile-string program)
      (parameterize
        ((current-output-port
           (open-output-string)))
        (compile program)
        (get-output-string (current-output-port))))))
