(define-library
  (epsilon tests fixture)
  (import
    scheme
    r7rs
    (epsilon base))
  (export test-compile)

  (begin
    (define (with-input-from-string input thunk)
      (parameterize
        ((current-input-port
           (open-input-string input)))
        (thunk)))

    (define (with-output-to-string thunk)
      (parameterize
        ((current-output-port
           (open-output-string)))
        (thunk)
        (get-output-string (current-output-port))))

    (define (test-compile datum)
      (with-output-to-string
        (lambda ()
          (with-input-from-string
            (with-output-to-string
              (lambda () (write datum)))
            compile))))))
