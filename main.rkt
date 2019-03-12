#lang racket

; Racket interface for apertium-kaz-tur
;
; REQUIRES: apertiumpp package.
; https://taruen.github.io/apertiumpp/apertiumpp/ gives info on how to install
; it.

(provide kaz-tur
         kaz-tur-from-pretransfer-to-biltrans
         kaz-tur-from-t1x-to-postgen)

(require pkg/lib
         rackunit
         rash
         apertiumpp/streamparser)

(define (symbol-append s1 s2)
  (string->symbol (string-append (symbol->string s1) (symbol->string s2))))

(define A-KAZ-TUR './)
(define A-KAZ-TUR-BIL (symbol-append A-KAZ-TUR 'kaz-tur.autobil.bin))
(define A-KAZ-TUR-T1X (symbol-append A-KAZ-TUR 'apertium-kaz-tur.kaz-tur.t1x))
(define A-KAZ-TUR-T1X-BIN (symbol-append A-KAZ-TUR 'kaz-tur.t1x.bin))
(define A-KAZ-TUR-T2X (symbol-append A-KAZ-TUR 'apertium-kaz-tur.kaz-tur.t2x))
(define A-KAZ-TUR-T2X-BIN (symbol-append A-KAZ-TUR 'kaz-tur.t2x.bin))
(define A-KAZ-TUR-T3X (symbol-append A-KAZ-TUR 'apertium-kaz-tur.kaz-tur.t3x))
(define A-KAZ-TUR-T3X-BIN (symbol-append A-KAZ-TUR 'kaz-tur.t3x.bin))
(define A-KAZ-TUR-T4X (symbol-append A-KAZ-TUR 'apertium-kaz-tur.kaz-tur.t4x))
(define A-KAZ-TUR-T4X-BIN (symbol-append A-KAZ-TUR 'kaz-tur.t4x.bin))
(define A-KAZ-TUR-GEN (symbol-append A-KAZ-TUR 'kaz-tur.autogen.bin))
(define A-KAZ-TUR-PGEN (symbol-append A-KAZ-TUR 'kaz-tur.autopgen.bin))

(define (kaz-tur s)
  (parameterize ([current-directory (pkg-directory "apertium-kaz-tur")])
    (rash
     "echo (values s) | apertium -d . kaz-tur")))

(define (kaz-tur-from-pretransfer-to-biltrans s)
  (parameterize ([current-directory (pkg-directory "apertium-kaz-tur")])
    (rash
     "echo (values s) | apertium-pretransfer | "
     "lt-proc -b (values A-KAZ-TUR-BIL)")))

(define (kaz-tur-from-t1x-to-postgen s)
  (parameterize ([current-directory (pkg-directory "apertium-kaz-tur")])
    (rash
     "echo (values s) | "
     "apertium-transfer -b (values A-KAZ-TUR-T1X) (values A-KAZ-TUR-T1X-BIN) | "
     "apertium-interchunk (values A-KAZ-TUR-T2X) (values A-KAZ-TUR-T2X-BIN) | "
     "apertium-postchunk (values A-KAZ-TUR-T3X) (values A-KAZ-TUR-T3X-BIN) | "
     "apertium-transfer -n (values A-KAZ-TUR-T4X) (values A-KAZ-TUR-T4X-BIN) | "     
     "lt-proc -g (values A-KAZ-TUR-GEN) | "
     "lt-proc -p (values A-KAZ-TUR-PGEN)")))