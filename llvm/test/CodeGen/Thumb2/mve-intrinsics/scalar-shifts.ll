; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main -mattr=+mve.fp -verify-machineinstrs -o - %s | FileCheck %s

define arm_aapcs_vfpcc i64 @test_urshrl(i64 %value) {
; CHECK-LABEL: test_urshrl:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    urshrl r0, r1, #6
; CHECK-NEXT:    bx lr
entry:
  %0 = lshr i64 %value, 32
  %1 = trunc i64 %0 to i32
  %2 = trunc i64 %value to i32
  %3 = tail call { i32, i32 } @llvm.arm.mve.urshrl(i32 %2, i32 %1, i32 6)
  %4 = extractvalue { i32, i32 } %3, 1
  %5 = zext i32 %4 to i64
  %6 = shl nuw i64 %5, 32
  %7 = extractvalue { i32, i32 } %3, 0
  %8 = zext i32 %7 to i64
  %9 = or i64 %6, %8
  ret i64 %9
}

declare { i32, i32 } @llvm.arm.mve.urshrl(i32, i32, i32)
