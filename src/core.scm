(define-library
  (epsilon core)
  (import
    scheme
    r7rs
    (only (chicken format) printf))
  (export compile)

  (begin
    (define (compile)
      (write (read)))))
