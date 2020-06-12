#|
 This file is a part of zippy
 (c) 2020 Shirakumo http://tymoon.eu (shinmera@tymoon.eu)
 Author: Nicolas Hafner <shinmera@tymoon.eu>
|#

(in-package #:org.shirakumo.zippy)

(define-byte-structure (local-file-header #x04034B50)
  (version ub16)
  (flags ub16)
  (compression-method ub16)
  (last-modified-time ub16)
  (last-modified-date ub16)
  (crc-32 ub32)
  (compressed-size ub32)
  (uncompressed-size ub32)
  (file-name-length ub16)
  (extra-field-length ub16)
  (file-name character file-name-length)
  (extra ub8 extra-field-length))

(define-byte-structure (data-descriptor #x08074B50)
  (crc-32 ub32)
  (compressed-size ub32)
  (uncompressed-size ub32))

(define-byte-structure (data-descriptor/64 #x08074B50)
  (crc-32 ub32)
  (compressed-size ub64)
  (uncompressed-size ub64))

(define-byte-structure (extra-data #x08064B50)
  (extra-field-length ub32)
  (extra ub8 extra-field-length))

(define-byte-structure (file-header #x02014B50)
  (version-made ub16)
  (version-needed ub16)
  (flags ub16)
  (compression-method ub16)
  (last-modified-time ub16)
  (last-modified-date ub16)
  (crc-32 ub32)
  (compressed-size ub32)
  (uncompressed-size ub32)
  (file-name-length ub16)
  (extra-field-length ub16)
  (file-comment-length ub16)
  (disk-number-start ub16)
  (internal-file-attributes ub16)
  (external-file-attributes ub32)
  (local-header-offset ub32)
  (file-name character file-name-length)
  (extra ub8 extra-field-length)
  (file-comment character file-comment-length))

(define-byte-structure (digital-signature #x05054B50)
  (size ub16)
  (data ub8 size))

(define-byte-structure (end-of-central-directory/64 #x06064B50)
  (size ub64)
  (version-made ub16)
  (version-needed ub16)
  (number-of-disk ub32)
  (central-directory-disk ub32)
  (disk-entries ub64)
  (central-directory-entries ub64)
  (central-directory-start ub64)
  (starting-disk ub64)
  (data-sector character (- size 44)))

(define-byte-structure (end-of-central-directory-locator/64 #x07064B50)
  (number-of-disk ub32)
  (relative-offset ub64)
  (number-of-disks ub32))

(define-byte-structure (end-of-central-directory #x06054B50)
  (number-of-disk ub16)
  (central-directory-disk ub16)
  (disk-entries ub16)
  (central-directory-entries ub16)
  (central-directory-size ub32)
  (central-directory-start ub32)
  (file-comment-length ub16)
  (file-comment character file-comment-length))
