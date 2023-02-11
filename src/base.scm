(define-library
  (epsilon base)
  (import
    scheme
    r7rs)
  (export compile)

  (begin
    (define (compile)
      (write (read)))))
