; ModuleID = '/tmp/sqlite3-sign.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-n8:16:32:64-S128-p270:32:32:32:32-p271:32:32:32:32-p272:64:64:64:64-i64:64-i128:128-f80:128-p0:64:64:64:64-i1:8-i8:8-i16:16-i32:32-f16:16-f64:64-f128:128"
target triple = "x86_64-unknown-linux-gnu"

@sqlite3CtypeMap = external hidden constant [256 x i8], align 16
@.str.123 = external hidden unnamed_addr constant [19 x i8], align 1

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define hidden fastcc range(i32 -1, 4) i32 @sqlite3Atoi64(ptr nofree noundef readonly %0, ptr nofree noundef writeonly captures(none) %1, i32 noundef %2, i8 noundef zeroext %3) unnamed_addr #0 {
  %5 = zext i8 %3 to i32
  %6 = icmp eq i8 %3, 1
  br i1 %6, label %27, label %7

7:                                                ; preds = %4
  %8 = and i32 %2, -2
  %9 = sub nsw i32 3, %5
  %10 = icmp slt i32 %9, %8
  br i1 %10, label %11, label %20

11:                                               ; preds = %17, %7
  %12 = phi i32 [ %18, %17 ], [ %9, %7 ]
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, ptr %0, i64 %13
  %15 = load i8, ptr %14, align 1, !tbaa !6
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %20, label %17

17:                                               ; preds = %11
  %18 = add nsw i32 %12, 2
  %19 = icmp slt i32 %18, %8
  br i1 %19, label %11, label %20, !llvm.loop !9

20:                                               ; preds = %17, %11, %7
  %21 = phi i32 [ %18, %17 ], [ %12, %11 ], [ %9, %7 ]
  %22 = phi i1 [ %16, %17 ], [ %16, %11 ], [ false, %7 ]
  %23 = xor i32 %21, 1
  %24 = and i32 %5, 1
  %25 = zext nneg i32 %24 to i64
  %26 = getelementptr inbounds nuw i8, ptr %0, i64 %25
  br label %27

27:                                               ; preds = %20, %4
  %28 = phi i32 [ 2, %20 ], [ 1, %4 ]
  %29 = phi ptr [ %26, %20 ], [ %0, %4 ]
  %30 = phi i1 [ %22, %20 ], [ false, %4 ]
  %31 = phi i32 [ %23, %20 ], [ %2, %4 ]
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i8, ptr %0, i64 %32
  %34 = icmp ult ptr %29, %33
  br i1 %34, label %35, label %53

35:                                               ; preds = %27
  %36 = zext nneg i32 %28 to i64
  br label %37

37:                                               ; preds = %45, %35
  %38 = phi ptr [ %46, %45 ], [ %29, %35 ]
  %39 = load i8, ptr %38, align 1, !tbaa !6
  %40 = zext i8 %39 to i64
  %41 = getelementptr inbounds nuw i8, ptr @sqlite3CtypeMap, i64 %40
  %42 = load i8, ptr %41, align 1, !tbaa !6
  %43 = and i8 %42, 1
  %44 = icmp eq i8 %43, 0
  br i1 %44, label %48, label %45

45:                                               ; preds = %37
  %46 = getelementptr inbounds nuw i8, ptr %38, i64 %36
  %47 = icmp ult ptr %46, %33
  br i1 %47, label %37, label %53, !llvm.loop !9

48:                                               ; preds = %37
  switch i8 %39, label %53 [
    i8 45, label %49
    i8 43, label %51
  ]

49:                                               ; preds = %48
  %50 = getelementptr inbounds nuw i8, ptr %38, i64 %36
  br label %53

51:                                               ; preds = %48
  %52 = getelementptr inbounds nuw i8, ptr %38, i64 %36
  br label %53

53:                                               ; preds = %51, %49, %48, %45, %27
  %54 = phi i1 [ true, %51 ], [ false, %49 ], [ true, %48 ], [ true, %45 ], [ true, %27 ]
  %55 = phi ptr [ %52, %51 ], [ %50, %49 ], [ %38, %48 ], [ %46, %45 ], [ %29, %27 ]
  %56 = icmp ult ptr %55, %33
  br i1 %56, label %57, label %66

57:                                               ; preds = %53
  %58 = zext nneg i32 %28 to i64
  br label %59

59:                                               ; preds = %63, %57
  %60 = phi ptr [ %64, %63 ], [ %55, %57 ]
  %61 = load i8, ptr %60, align 1, !tbaa !6
  %62 = icmp eq i8 %61, 48
  br i1 %62, label %63, label %66

63:                                               ; preds = %59
  %64 = getelementptr inbounds nuw i8, ptr %60, i64 %58
  %65 = icmp ult ptr %64, %33
  br i1 %65, label %59, label %66, !llvm.loop !9

66:                                               ; preds = %63, %59, %53
  %67 = phi ptr [ %64, %63 ], [ %60, %59 ], [ %55, %53 ]
  %68 = icmp ult ptr %67, %33
  br i1 %68, label %69, label %92

69:                                               ; preds = %77, %66
  %70 = phi ptr [ %83, %77 ], [ %67, %66 ]
  %71 = phi i32 [ %81, %77 ], [ 0, %66 ]
  %72 = phi i64 [ %80, %77 ], [ 0, %66 ]
  %73 = load i8, ptr %70, align 1, !tbaa !6
  %74 = sext i8 %73 to i32
  %75 = add nsw i32 %74, -48
  %76 = icmp ult i32 %75, 10
  br i1 %76, label %77, label %85

77:                                               ; preds = %69
  %78 = mul i64 %72, 10
  %79 = zext nneg i32 %75 to i64
  %80 = add i64 %78, %79
  %81 = add i32 %71, %28
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i8, ptr %67, i64 %82
  %84 = icmp ult ptr %83, %33
  br i1 %84, label %69, label %85, !llvm.loop !9

85:                                               ; preds = %77, %69
  %86 = phi i64 [ %80, %77 ], [ %72, %69 ]
  %87 = phi i32 [ %81, %77 ], [ %71, %69 ]
  %88 = phi i1 [ true, %77 ], [ %30, %69 ]
  %89 = icmp slt i64 %86, 0
  br i1 %89, label %90, label %92

90:                                               ; preds = %85
  %91 = select i1 %54, i64 9223372036854775807, i64 -9223372036854775808
  br label %98

92:                                               ; preds = %85, %66
  %93 = phi i1 [ %88, %85 ], [ true, %66 ]
  %94 = phi i32 [ %87, %85 ], [ 0, %66 ]
  %95 = phi i64 [ %86, %85 ], [ 0, %66 ]
  %96 = sub nsw i64 0, %95
  %97 = select i1 %54, i64 %95, i64 %96
  br label %98

98:                                               ; preds = %92, %90
  %99 = phi i64 [ %97, %92 ], [ %91, %90 ]
  %100 = phi i1 [ %93, %92 ], [ %88, %90 ]
  %101 = phi i32 [ %94, %92 ], [ %87, %90 ]
  store i64 %99, ptr %1, align 8, !tbaa !11
  %102 = icmp eq i32 %101, 0
  %103 = icmp eq ptr %55, %67
  %104 = and i1 %102, %103
  br i1 %104, label %122, label %105

105:                                              ; preds = %98
  %106 = zext i1 %30 to i32
  br i1 %100, label %122, label %107

107:                                              ; preds = %117, %105
  %108 = phi i32 [ %118, %117 ], [ %101, %105 ]
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i8, ptr %67, i64 %109
  %111 = load i8, ptr %110, align 1, !tbaa !6
  %112 = zext i8 %111 to i64
  %113 = getelementptr inbounds nuw i8, ptr @sqlite3CtypeMap, i64 %112
  %114 = load i8, ptr %113, align 1, !tbaa !6
  %115 = and i8 %114, 1
  %116 = icmp eq i8 %115, 0
  br i1 %116, label %122, label %117

117:                                              ; preds = %107
  %118 = add i32 %108, %28
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds i8, ptr %67, i64 %119
  %121 = icmp ult ptr %120, %33
  br i1 %121, label %107, label %122, !llvm.loop !9

122:                                              ; preds = %117, %107, %105, %98
  %123 = phi i32 [ 0, %117 ], [ 1, %107 ], [ %106, %105 ], [ -1, %98 ]
  %124 = mul nuw nsw i32 %28, 19
  %125 = icmp slt i32 %101, %124
  br i1 %125, label %164, label %126

126:                                              ; preds = %122
  %127 = icmp ugt i32 %101, %124
  br i1 %127, label %128, label %130

128:                                              ; preds = %126
  %129 = select i1 %54, i64 9223372036854775807, i64 -9223372036854775808
  store i64 %129, ptr %1, align 8, !tbaa !11
  br label %164

130:                                              ; preds = %126
  %131 = zext nneg i32 %28 to i64
  br label %132

132:                                              ; preds = %132, %130
  %133 = phi i64 [ %139, %132 ], [ 0, %130 ]
  %134 = mul nuw nsw i64 %133, %131
  %135 = getelementptr inbounds nuw i8, ptr %67, i64 %134
  %136 = load i8, ptr %135, align 1, !tbaa !6
  %137 = getelementptr inbounds nuw i8, ptr @.str.123, i64 %133
  %138 = load i8, ptr %137, align 1, !tbaa !6
  %139 = add nuw nsw i64 %133, 1
  %140 = icmp eq i8 %136, %138
  %141 = icmp ult i64 %133, 17
  %142 = select i1 %140, i1 %141, i1 false
  br i1 %142, label %132, label %143, !llvm.loop !9

143:                                              ; preds = %132
  %144 = sext i8 %138 to i32
  %145 = sext i8 %136 to i32
  %146 = sub nsw i32 %145, %144
  %147 = mul nsw i32 %146, 10
  br i1 %140, label %148, label %155

148:                                              ; preds = %143
  %149 = mul nuw nsw i32 %28, 18
  %150 = zext nneg i32 %149 to i64
  %151 = getelementptr inbounds nuw i8, ptr %67, i64 %150
  %152 = load i8, ptr %151, align 1, !tbaa !6
  %153 = sext i8 %152 to i32
  %154 = add nsw i32 %153, -56
  br label %155

155:                                              ; preds = %148, %143
  %156 = phi i32 [ %154, %148 ], [ %147, %143 ]
  %157 = freeze i32 %156
  %158 = icmp slt i32 %157, 0
  br i1 %158, label %164, label %159

159:                                              ; preds = %155
  %160 = select i1 %54, i64 9223372036854775807, i64 -9223372036854775808
  store i64 %160, ptr %1, align 8, !tbaa !11
  %161 = icmp eq i32 %157, 0
  %162 = select i1 %54, i32 3, i32 %123
  %163 = select i1 %161, i32 %162, i32 2
  br label %164

164:                                              ; preds = %159, %155, %128, %122
  %165 = phi i32 [ %163, %159 ], [ %123, %155 ], [ 2, %128 ], [ %123, %122 ]
  ret i32 %165
}

attributes #0 = { nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="inline-asm" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "zero-call-used-regs"="used-gpr" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 23.1.0"}
!1 = !{i32 4, !"probe-stack", !"inline-asm"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{!7, !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!12, !12, i64 0}
!12 = !{!"long long", !7, i64 0}
