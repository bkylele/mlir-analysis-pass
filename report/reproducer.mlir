module {
  llvm.func @square_i8(%x: i32) -> i32 {
    %small = llvm.trunc %x : i32 to i8
    %square = llvm.mul %small, %small : i8
    %result = llvm.sext %square : i8 to i32
    llvm.return %result : i32
  }
}
