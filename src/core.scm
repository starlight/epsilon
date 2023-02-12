(define-library
  (epsilon core)
  (import
    scheme
    r7rs)
  (export compile)

  (begin
    (define (compile)
      (write (read)))))
