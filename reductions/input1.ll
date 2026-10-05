; ModuleID = '/tmp/sqlite3-sign.ll'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:e-n8:16:32:64-S128-p270:32:32:32:32-p271:32:32:32:32-p272:64:64:64:64-i64:64-i128:128-f80:128-p0:64:64:64:64-i1:8-i8:8-i16:16-i32:32-f16:16-f64:64-f128:128"
target triple = "x86_64-unknown-linux-gnu"

%struct.VdbeOp = type { i8, i8, i16, i32, i32, i32, %union.p4union }
%union.p4union = type { ptr }
%struct.Walker = type { ptr, ptr, ptr, ptr, i32, i16, i16, %union.anon.32 }
%union.anon.32 = type { ptr }
%struct.NameContext = type { ptr, ptr, %union.anon.33, ptr, i32, i32, i32, i32, ptr }
%union.anon.33 = type { ptr }

@sqlite3UpperToLower = external hidden unnamed_addr constant [274 x i8], align 16
@.str.645 = external hidden unnamed_addr constant [15 x i8], align 1
@sqlite3VdbeGetOp.dummy = external hidden global %struct.VdbeOp, align 8
@.str.687 = external hidden unnamed_addr constant [23 x i8], align 1
@.str.744 = external hidden unnamed_addr constant [6 x i8], align 1
@.str.775 = external hidden unnamed_addr constant [18 x i8], align 1
@.str.779 = external hidden unnamed_addr constant [8 x i8], align 1
@.str.780 = external hidden unnamed_addr constant [4 x i8], align 1
@.str.955 = external hidden unnamed_addr constant [36 x i8], align 1
@.str.956 = external hidden unnamed_addr constant [19 x i8], align 1
@.str.957 = external hidden unnamed_addr constant [13 x i8], align 1

; Function Attrs: nounwind sspstrong uwtable
declare hidden void @sqlite3ErrorMsg(ptr nofree noundef captures(none), ptr noundef, ...) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc ptr @sqlite3VdbeCreate(ptr noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc range(i32 -2147483648, 2147483647) i32 @sqlite3VdbeAddOp4Int(ptr nofree noundef captures(none), i32 noundef range(i32 0, 256), i32 noundef, i32 noundef, i32 noundef, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3DbFreeNN(ptr nofree noundef, ptr noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc ptr @sqlite3DbMallocRawNN(ptr noundef, i64 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3SrcListDelete(ptr nofree noundef, ptr noundef) unnamed_addr #0

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3ExprDeleteNN(ptr nofree noundef, ptr noundef nonnull) unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc range(i32 -2147483648, 2147483647) i32 @sqlite3VdbeAddOp2(ptr nofree noundef captures(none), i32 noundef range(i32 -1, 511), i32 noundef, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc range(i32 -2147483648, 2147483647) i32 @sqlite3VdbeAddOp3(ptr nofree noundef captures(none), i32 noundef, i32 noundef, i32 noundef, i32 noundef) unnamed_addr #0

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc range(i32 -2147483648, 2147483647) i32 @growOp3(ptr nofree noundef captures(none), i32 noundef, i32 noundef, i32 noundef, i32 noundef) unnamed_addr #1

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc void @deleteTable(ptr nofree noundef, ptr noundef nonnull) unnamed_addr #1

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc void @exprListDeleteNN(ptr nofree noundef, ptr noundef nonnull) unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
define hidden fastcc void @sqlite3Update(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, ptr noundef %5) unnamed_addr #0 {
  %7 = alloca %struct.Walker, align 8
  %8 = alloca %struct.Walker, align 8
  %9 = alloca %struct.Walker, align 8
  %10 = alloca %struct.NameContext, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr %10)
  call void @llvm.lifetime.start.p0(ptr %11)
  call void @llvm.lifetime.start.p0(ptr %12)
  store i32 0, ptr %12, align 4, !tbaa !6
  %15 = load ptr, ptr %0, align 8, !tbaa !10
  %16 = getelementptr inbounds nuw i8, ptr %0, i64 52
  %17 = load i32, ptr %16, align 4, !tbaa !33
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %1543

19:                                               ; preds = %6
  %20 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %21 = tail call fastcc ptr @sqlite3LocateTableItem(ptr noundef nonnull %0, i32 noundef 0, ptr noundef nonnull %20)
  %22 = getelementptr inbounds nuw i8, ptr %1, i64 24
  %23 = load ptr, ptr %22, align 8, !tbaa !34
  %24 = icmp eq ptr %23, null
  br i1 %24, label %36, label %25

25:                                               ; preds = %19
  %26 = load ptr, ptr %0, align 8, !tbaa !10
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 768
  %28 = load ptr, ptr %27, align 8, !tbaa !38
  %29 = icmp eq ptr %28, null
  br i1 %29, label %30, label %35

30:                                               ; preds = %25
  %31 = getelementptr inbounds nuw i8, ptr %23, i64 44
  %32 = load i32, ptr %31, align 4, !tbaa !58
  %33 = add i32 %32, -1
  store i32 %33, ptr %31, align 4, !tbaa !58
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %30, %25
  tail call fastcc void @deleteTable(ptr noundef nonnull %26, ptr noundef nonnull %23)
  br label %36

36:                                               ; preds = %35, %30, %19
  store ptr %21, ptr %22, align 8, !tbaa !34
  %37 = getelementptr inbounds nuw i8, ptr %1, i64 33
  %38 = load i16, ptr %37, align 1
  %39 = or i16 %38, 1024
  store i16 %39, ptr %37, align 1
  %40 = icmp eq ptr %21, null
  br i1 %40, label %1543, label %41

41:                                               ; preds = %36
  %42 = getelementptr inbounds nuw i8, ptr %21, i64 44
  %43 = load i32, ptr %42, align 4, !tbaa !58
  %44 = add i32 %43, 1
  store i32 %44, ptr %42, align 4, !tbaa !58
  %45 = load i16, ptr %37, align 1
  %46 = and i16 %45, 2
  %47 = icmp eq i16 %46, 0
  br i1 %47, label %86, label %48

48:                                               ; preds = %41
  %49 = getelementptr inbounds nuw i8, ptr %1, i64 48
  %50 = load ptr, ptr %49, align 8, !tbaa !62
  %51 = getelementptr inbounds nuw i8, ptr %21, i64 16
  %52 = load ptr, ptr %51, align 8, !tbaa !63
  %53 = icmp eq ptr %52, null
  br i1 %53, label %80, label %54

54:                                               ; preds = %76, %48
  %55 = phi ptr [ %78, %76 ], [ %52, %48 ]
  %56 = load ptr, ptr %55, align 8, !tbaa !64
  br label %57

57:                                               ; preds = %73, %54
  %58 = phi ptr [ %75, %73 ], [ %50, %54 ]
  %59 = phi ptr [ %74, %73 ], [ %56, %54 ]
  %60 = load i8, ptr %59, align 1, !tbaa !62
  %61 = load i8, ptr %58, align 1, !tbaa !62
  %62 = icmp eq i8 %60, %61
  br i1 %62, label %63, label %65

63:                                               ; preds = %57
  %64 = icmp eq i8 %60, 0
  br i1 %64, label %84, label %73

65:                                               ; preds = %57
  %66 = zext i8 %60 to i64
  %67 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %66
  %68 = load i8, ptr %67, align 1, !tbaa !62
  %69 = zext i8 %61 to i64
  %70 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %69
  %71 = load i8, ptr %70, align 1, !tbaa !62
  %72 = icmp eq i8 %68, %71
  br i1 %72, label %73, label %76

73:                                               ; preds = %65, %63
  %74 = getelementptr inbounds nuw i8, ptr %59, i64 1
  %75 = getelementptr inbounds nuw i8, ptr %58, i64 1
  br label %57

76:                                               ; preds = %65
  %77 = getelementptr inbounds nuw i8, ptr %55, i64 40
  %78 = load ptr, ptr %77, align 8, !tbaa !63
  %79 = icmp eq ptr %78, null
  br i1 %79, label %80, label %54, !llvm.loop !68

80:                                               ; preds = %76, %48
  tail call void (ptr, ptr, ...) @sqlite3ErrorMsg(ptr noundef nonnull %0, ptr noundef nonnull @.str.775, ptr noundef %50, i32 noundef 0)
  %81 = getelementptr inbounds nuw i8, ptr %0, i64 39
  %82 = load i16, ptr %81, align 1
  %83 = or i16 %82, 256
  store i16 %83, ptr %81, align 1
  br label %1543

84:                                               ; preds = %63
  %85 = getelementptr inbounds nuw i8, ptr %1, i64 56
  store ptr %55, ptr %85, align 8, !tbaa !62
  br label %86

86:                                               ; preds = %84, %41
  %87 = load ptr, ptr %0, align 8, !tbaa !10
  %88 = getelementptr inbounds nuw i8, ptr %21, i64 96
  %89 = load ptr, ptr %88, align 8, !tbaa !70
  %90 = icmp eq ptr %89, null
  br i1 %90, label %102, label %91

91:                                               ; preds = %86
  %92 = getelementptr inbounds nuw i8, ptr %87, i64 32
  %93 = load ptr, ptr %92, align 8, !tbaa !71
  br label %94

94:                                               ; preds = %94, %91
  %95 = phi i32 [ %101, %94 ], [ 0, %91 ]
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [32 x i8], ptr %93, i64 %96
  %98 = getelementptr inbounds nuw i8, ptr %97, i64 24
  %99 = load ptr, ptr %98, align 8, !tbaa !72
  %100 = icmp eq ptr %99, %89
  %101 = add i32 %95, 1
  br i1 %100, label %102, label %94

102:                                              ; preds = %94, %86
  %103 = phi i32 [ %95, %94 ], [ -32768, %86 ]
  %104 = getelementptr inbounds nuw i8, ptr %21, i64 88
  %105 = load ptr, ptr %104, align 8, !tbaa !75
  %106 = icmp eq ptr %105, null
  br i1 %106, label %107, label %117

107:                                              ; preds = %102
  %108 = getelementptr inbounds nuw i8, ptr %87, i64 32
  %109 = load ptr, ptr %108, align 8, !tbaa !71
  %110 = getelementptr inbounds nuw i8, ptr %109, i64 56
  %111 = load ptr, ptr %110, align 8, !tbaa !72
  %112 = icmp eq ptr %111, null
  br i1 %112, label %122, label %113

113:                                              ; preds = %107
  %114 = getelementptr inbounds nuw i8, ptr %111, i64 64
  %115 = load ptr, ptr %114, align 8, !tbaa !76
  %116 = icmp eq ptr %115, null
  br i1 %116, label %122, label %117

117:                                              ; preds = %113, %102
  %118 = getelementptr inbounds nuw i8, ptr %0, i64 39
  %119 = load i16, ptr %118, align 1
  %120 = and i16 %119, 1
  %121 = icmp eq i16 %120, 0
  br i1 %121, label %123, label %122

122:                                              ; preds = %117, %113, %107
  store i32 0, ptr %11, align 4, !tbaa !6
  br label %125

123:                                              ; preds = %117
  %124 = call fastcc ptr @triggersReallyExist(ptr noundef nonnull %0, ptr noundef nonnull readonly %21, i32 noundef 130, ptr noundef readonly %2, ptr noundef nonnull %11)
  br label %125

125:                                              ; preds = %123, %122
  %126 = phi ptr [ %124, %123 ], [ null, %122 ]
  %127 = getelementptr inbounds nuw i8, ptr %21, i64 63
  %128 = load i8, ptr %127, align 1, !tbaa !78
  %129 = icmp eq i8 %128, 2
  %130 = load i32, ptr %1, align 8, !tbaa !6
  %131 = icmp sgt i32 %130, 1
  br i1 %131, label %132, label %134

132:                                              ; preds = %125
  %133 = load i32, ptr %2, align 8, !tbaa !6
  br label %134

134:                                              ; preds = %132, %125
  %135 = phi i32 [ %133, %132 ], [ 0, %125 ]
  %136 = icmp eq i8 %128, 1
  br i1 %136, label %141, label %137

137:                                              ; preds = %134
  %138 = getelementptr inbounds nuw i8, ptr %21, i64 54
  %139 = load i16, ptr %138, align 2, !tbaa !79
  %140 = icmp sgt i16 %139, 0
  br i1 %140, label %144, label %141

141:                                              ; preds = %137, %134
  %142 = call fastcc i32 @viewGetColumnNames(ptr noundef nonnull %0, ptr noundef nonnull %21)
  %143 = icmp eq i32 %142, 0
  br i1 %143, label %144, label %1543

144:                                              ; preds = %141, %137
  %145 = call fastcc i32 @sqlite3IsReadOnly(ptr noundef nonnull %0, ptr noundef %21, ptr noundef %126)
  %146 = icmp eq i32 %145, 0
  br i1 %146, label %147, label %1543

147:                                              ; preds = %144
  %148 = getelementptr inbounds nuw i8, ptr %0, i64 56
  %149 = load i32, ptr %148, align 8, !tbaa !80
  %150 = add i32 %149, 1
  store i32 %150, ptr %148, align 8, !tbaa !80
  %151 = getelementptr inbounds nuw i8, ptr %21, i64 48
  %152 = load i32, ptr %151, align 8, !tbaa !81
  %153 = and i32 %152, 128
  %154 = icmp eq i32 %153, 0
  %155 = getelementptr inbounds nuw i8, ptr %21, i64 16
  %156 = load ptr, ptr %155, align 8, !tbaa !63
  br i1 %154, label %169, label %157

157:                                              ; preds = %147
  %158 = icmp eq ptr %156, null
  br i1 %158, label %185, label %159

159:                                              ; preds = %165, %157
  %160 = phi ptr [ %167, %165 ], [ %156, %157 ]
  %161 = getelementptr inbounds nuw i8, ptr %160, i64 99
  %162 = load i16, ptr %161, align 1
  %163 = and i16 %162, 3
  %164 = icmp eq i16 %163, 2
  br i1 %164, label %169, label %165

165:                                              ; preds = %159
  %166 = getelementptr inbounds nuw i8, ptr %160, i64 40
  %167 = load ptr, ptr %166, align 8, !tbaa !63
  %168 = icmp eq ptr %167, null
  br i1 %168, label %169, label %159, !llvm.loop !68

169:                                              ; preds = %165, %159, %147
  %170 = phi ptr [ null, %165 ], [ %160, %159 ], [ null, %147 ]
  %171 = icmp eq ptr %156, null
  br i1 %171, label %185, label %172

172:                                              ; preds = %172, %169
  %173 = phi i32 [ %179, %172 ], [ %150, %169 ]
  %174 = phi ptr [ %182, %172 ], [ %156, %169 ]
  %175 = phi i32 [ %181, %172 ], [ 0, %169 ]
  %176 = phi i32 [ %178, %172 ], [ %149, %169 ]
  %177 = icmp eq ptr %170, %174
  %178 = select i1 %177, i32 %173, i32 %176
  %179 = add i32 %173, 1
  %180 = getelementptr inbounds nuw i8, ptr %174, i64 40
  %181 = add i32 %175, 1
  %182 = load ptr, ptr %180, align 8, !tbaa !63
  %183 = icmp eq ptr %182, null
  br i1 %183, label %184, label %172, !llvm.loop !68

184:                                              ; preds = %172
  store i32 %179, ptr %148, align 8, !tbaa !80
  br label %185

185:                                              ; preds = %184, %169, %157
  %186 = phi ptr [ %170, %184 ], [ %170, %169 ], [ null, %157 ]
  %187 = phi i32 [ %178, %184 ], [ %149, %169 ], [ %149, %157 ]
  %188 = phi i32 [ %181, %184 ], [ 0, %169 ], [ 0, %157 ]
  %189 = getelementptr inbounds nuw i8, ptr %21, i64 16
  %190 = icmp eq ptr %5, null
  br i1 %190, label %196, label %191

191:                                              ; preds = %185
  %192 = getelementptr inbounds nuw i8, ptr %5, i64 76
  %193 = load i32, ptr %192, align 4, !tbaa !82
  %194 = getelementptr inbounds nuw i8, ptr %5, i64 80
  %195 = load i32, ptr %194, align 8, !tbaa !86
  store i32 %149, ptr %148, align 8, !tbaa !80
  br label %196

196:                                              ; preds = %191, %185
  %197 = phi i32 [ %195, %191 ], [ %150, %185 ]
  %198 = phi i32 [ %193, %191 ], [ %187, %185 ]
  %199 = getelementptr inbounds nuw i8, ptr %1, i64 36
  store i32 %198, ptr %199, align 4, !tbaa !87
  %200 = getelementptr inbounds nuw i8, ptr %21, i64 54
  %201 = load i16, ptr %200, align 2, !tbaa !79
  %202 = sext i16 %201 to i32
  %203 = add i32 %188, 1
  %204 = add i32 %203, %202
  %205 = sext i32 %204 to i64
  %206 = shl nsw i64 %205, 2
  %207 = sext i32 %188 to i64
  %208 = add nsw i64 %207, 2
  %209 = add nsw i64 %208, %206
  %210 = call fastcc ptr @sqlite3DbMallocRawNN(ptr noundef %15, i64 noundef %209)
  %211 = icmp eq ptr %210, null
  br i1 %211, label %1543, label %212

212:                                              ; preds = %196
  %213 = load i16, ptr %200, align 2, !tbaa !79
  %214 = sext i16 %213 to i64
  %215 = getelementptr inbounds [4 x i8], ptr %210, i64 %214
  %216 = getelementptr inbounds [4 x i8], ptr %215, i64 %207
  %217 = getelementptr inbounds nuw i8, ptr %216, i64 4
  %218 = sext i32 %203 to i64
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 %217, i8 noundef 1, i64 noundef %218, i1 false)
  %219 = getelementptr inbounds i8, ptr %217, i64 %218
  store i8 0, ptr %219, align 1, !tbaa !62
  %220 = load i16, ptr %200, align 2, !tbaa !79
  %221 = icmp sgt i16 %220, 0
  br i1 %221, label %222, label %225

222:                                              ; preds = %212
  %223 = zext nneg i16 %220 to i64
  %224 = shl nuw nsw i64 %223, 2
  call void @llvm.memset.p0.i64(ptr nonnull align 4 %210, i8 -1, i64 %224, i1 false), !tbaa !6
  br label %225

225:                                              ; preds = %222, %212
  %226 = getelementptr inbounds nuw i8, ptr %10, i64 24
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %226, i8 noundef 0, i64 noundef 32, i1 false)
  store ptr %0, ptr %10, align 8, !tbaa !88
  %227 = getelementptr inbounds nuw i8, ptr %10, i64 8
  store ptr %1, ptr %227, align 8, !tbaa !92
  %228 = getelementptr inbounds nuw i8, ptr %10, i64 16
  store ptr %5, ptr %228, align 8, !tbaa !62
  %229 = getelementptr inbounds nuw i8, ptr %10, i64 40
  store i32 512, ptr %229, align 8, !tbaa !93
  %230 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %231 = load ptr, ptr %230, align 8, !tbaa !94
  %232 = icmp eq ptr %231, null
  br i1 %232, label %233, label %250

233:                                              ; preds = %225
  %234 = getelementptr inbounds nuw i8, ptr %0, i64 160
  %235 = load ptr, ptr %234, align 8, !tbaa !95
  %236 = icmp eq ptr %235, null
  br i1 %236, label %237, label %247

237:                                              ; preds = %233
  %238 = load ptr, ptr %0, align 8, !tbaa !10
  %239 = getelementptr inbounds nuw i8, ptr %238, i64 96
  %240 = load i32, ptr %239, align 8, !tbaa !96
  %241 = and i32 %240, 8
  %242 = icmp eq i32 %241, 0
  br i1 %242, label %243, label %247

243:                                              ; preds = %237
  %244 = getelementptr inbounds nuw i8, ptr %0, i64 39
  %245 = load i16, ptr %244, align 1
  %246 = or i16 %245, 128
  store i16 %246, ptr %244, align 1
  br label %247

247:                                              ; preds = %243, %237, %233
  %248 = call fastcc ptr @sqlite3VdbeCreate(ptr noundef nonnull %0)
  %249 = icmp eq ptr %248, null
  br i1 %249, label %1542, label %250

250:                                              ; preds = %247, %225
  %251 = phi ptr [ %248, %247 ], [ %231, %225 ]
  %252 = load i32, ptr %2, align 8, !tbaa !6
  %253 = icmp sgt i32 %252, 0
  br i1 %253, label %254, label %512

254:                                              ; preds = %250
  %255 = icmp eq i32 %135, 0
  %256 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %257 = getelementptr inbounds nuw i8, ptr %21, i64 8
  %258 = getelementptr inbounds nuw i8, ptr %21, i64 104
  %259 = icmp eq ptr %186, null
  %260 = getelementptr inbounds nuw i8, ptr %21, i64 52
  %261 = getelementptr inbounds nuw i8, ptr %15, i64 32
  %262 = sext i32 %103 to i64
  %263 = getelementptr inbounds nuw i8, ptr %0, i64 308
  %264 = getelementptr inbounds nuw i8, ptr %0, i64 376
  br label %265

265:                                              ; preds = %507, %254
  %266 = phi i64 [ %508, %507 ], [ 0, %254 ]
  %267 = phi i32 [ %470, %507 ], [ -1, %254 ]
  %268 = phi ptr [ %471, %507 ], [ null, %254 ]
  %269 = phi i8 [ %472, %507 ], [ 0, %254 ]
  %270 = phi i8 [ %473, %507 ], [ 0, %254 ]
  br i1 %255, label %271, label %276

271:                                              ; preds = %265
  %272 = getelementptr inbounds nuw [24 x i8], ptr %256, i64 %266
  %273 = load ptr, ptr %272, align 8, !tbaa !97
  %274 = call fastcc i32 @sqlite3ResolveExprNames(ptr noundef %10, ptr noundef %273)
  %275 = icmp eq i32 %274, 0
  br i1 %275, label %276, label %1542

276:                                              ; preds = %271, %265
  %277 = getelementptr inbounds nuw [24 x i8], ptr %256, i64 %266
  %278 = getelementptr inbounds nuw i8, ptr %277, i64 8
  %279 = load ptr, ptr %278, align 8, !tbaa !100
  %280 = icmp eq ptr %279, null
  br i1 %280, label %295, label %281

281:                                              ; preds = %276
  %282 = load i8, ptr %279, align 1, !tbaa !62
  %283 = icmp eq i8 %282, 0
  br i1 %283, label %295, label %284

284:                                              ; preds = %284, %281
  %285 = phi i8 [ %293, %284 ], [ %282, %281 ]
  %286 = phi i8 [ %291, %284 ], [ 0, %281 ]
  %287 = phi ptr [ %292, %284 ], [ %279, %281 ]
  %288 = zext i8 %285 to i64
  %289 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %288
  %290 = load i8, ptr %289, align 1, !tbaa !62
  %291 = add i8 %290, %286
  %292 = getelementptr inbounds nuw i8, ptr %287, i64 1
  %293 = load i8, ptr %292, align 1, !tbaa !62
  %294 = icmp eq i8 %293, 0
  br i1 %294, label %295, label %284, !llvm.loop !68

295:                                              ; preds = %284, %281, %276
  %296 = phi i8 [ %291, %284 ], [ 0, %281 ], [ 0, %276 ]
  %297 = load ptr, ptr %257, align 8, !tbaa !101
  %298 = load i16, ptr %200, align 2, !tbaa !79
  %299 = and i8 %296, 15
  %300 = zext nneg i8 %299 to i64
  %301 = getelementptr inbounds nuw i8, ptr %258, i64 %300
  %302 = load i8, ptr %301, align 1, !tbaa !62
  %303 = zext i8 %302 to i32
  %304 = zext i8 %302 to i64
  %305 = getelementptr inbounds nuw [16 x i8], ptr %297, i64 %304
  %306 = getelementptr inbounds nuw i8, ptr %305, i64 11
  %307 = load i8, ptr %306, align 1, !tbaa !102
  %308 = icmp eq i8 %307, %296
  br i1 %308, label %309, label %330

309:                                              ; preds = %295
  %310 = load ptr, ptr %305, align 8, !tbaa !104
  br label %311

311:                                              ; preds = %327, %309
  %312 = phi ptr [ %329, %327 ], [ %279, %309 ]
  %313 = phi ptr [ %328, %327 ], [ %310, %309 ]
  %314 = load i8, ptr %313, align 1, !tbaa !62
  %315 = load i8, ptr %312, align 1, !tbaa !62
  %316 = icmp eq i8 %314, %315
  br i1 %316, label %317, label %319

317:                                              ; preds = %311
  %318 = icmp eq i8 %314, 0
  br i1 %318, label %365, label %327

319:                                              ; preds = %311
  %320 = zext i8 %314 to i64
  %321 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %320
  %322 = load i8, ptr %321, align 1, !tbaa !62
  %323 = zext i8 %315 to i64
  %324 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %323
  %325 = load i8, ptr %324, align 1, !tbaa !62
  %326 = icmp eq i8 %322, %325
  br i1 %326, label %327, label %330

327:                                              ; preds = %319, %317
  %328 = getelementptr inbounds nuw i8, ptr %313, i64 1
  %329 = getelementptr inbounds nuw i8, ptr %312, i64 1
  br label %311

330:                                              ; preds = %319, %295
  %331 = call i16 @llvm.smax.i16(i16 %298, i16 1)
  %332 = zext nneg i16 %331 to i64
  br label %333

333:                                              ; preds = %360, %330
  %334 = phi i64 [ %361, %360 ], [ 0, %330 ]
  %335 = getelementptr inbounds nuw [16 x i8], ptr %297, i64 %334
  %336 = getelementptr inbounds nuw i8, ptr %335, i64 11
  %337 = load i8, ptr %336, align 1, !tbaa !102
  %338 = icmp eq i8 %337, %296
  br i1 %338, label %339, label %360

339:                                              ; preds = %333
  %340 = load ptr, ptr %335, align 8, !tbaa !104
  br label %341

341:                                              ; preds = %357, %339
  %342 = phi ptr [ %359, %357 ], [ %279, %339 ]
  %343 = phi ptr [ %358, %357 ], [ %340, %339 ]
  %344 = load i8, ptr %343, align 1, !tbaa !62
  %345 = load i8, ptr %342, align 1, !tbaa !62
  %346 = icmp eq i8 %344, %345
  br i1 %346, label %347, label %349

347:                                              ; preds = %341
  %348 = icmp eq i8 %344, 0
  br i1 %348, label %363, label %357

349:                                              ; preds = %341
  %350 = zext i8 %344 to i64
  %351 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %350
  %352 = load i8, ptr %351, align 1, !tbaa !62
  %353 = zext i8 %345 to i64
  %354 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %353
  %355 = load i8, ptr %354, align 1, !tbaa !62
  %356 = icmp eq i8 %352, %355
  br i1 %356, label %357, label %360

357:                                              ; preds = %349, %347
  %358 = getelementptr inbounds nuw i8, ptr %343, i64 1
  %359 = getelementptr inbounds nuw i8, ptr %342, i64 1
  br label %341

360:                                              ; preds = %349, %333
  %361 = add nuw nsw i64 %334, 1
  %362 = icmp eq i64 %361, %332
  br i1 %362, label %388, label %333

363:                                              ; preds = %347
  %364 = trunc nuw nsw i64 %334 to i32
  br label %365

365:                                              ; preds = %363, %317
  %366 = phi i32 [ %364, %363 ], [ %303, %317 ]
  %367 = load i16, ptr %260, align 4, !tbaa !105
  %368 = sext i16 %367 to i32
  %369 = icmp eq i32 %366, %368
  br i1 %369, label %370, label %374

370:                                              ; preds = %365
  %371 = load ptr, ptr %277, align 8, !tbaa !97
  %372 = trunc nuw nsw i64 %266 to i32
  %373 = zext nneg i32 %366 to i64
  br label %454

374:                                              ; preds = %365
  %375 = zext i32 %366 to i64
  %376 = getelementptr inbounds nuw [16 x i8], ptr %297, i64 %375
  %377 = getelementptr inbounds nuw i8, ptr %376, i64 14
  %378 = load i16, ptr %377, align 2, !tbaa !106
  %379 = and i16 %378, 1
  %380 = icmp eq i16 %379, 0
  %381 = select i1 %259, i1 true, i1 %380
  br i1 %381, label %382, label %454

382:                                              ; preds = %374
  %383 = and i16 %378, 96
  %384 = icmp eq i16 %383, 0
  br i1 %384, label %454, label %385

385:                                              ; preds = %382
  %386 = getelementptr inbounds nuw [16 x i8], ptr %297, i64 %375
  %387 = load ptr, ptr %386, align 8, !tbaa !104
  call void (ptr, ptr, ...) @sqlite3ErrorMsg(ptr noundef nonnull %0, ptr noundef nonnull @.str.955, ptr noundef %387)
  br label %1542

388:                                              ; preds = %360
  br i1 %259, label %389, label %450

389:                                              ; preds = %405, %388
  %390 = phi ptr [ %407, %405 ], [ @.str.779, %388 ]
  %391 = phi ptr [ %406, %405 ], [ %279, %388 ]
  %392 = load i8, ptr %391, align 1, !tbaa !62
  %393 = load i8, ptr %390, align 1, !tbaa !62
  %394 = icmp eq i8 %392, %393
  br i1 %394, label %395, label %397

395:                                              ; preds = %389
  %396 = icmp eq i8 %392, 0
  br i1 %396, label %446, label %405

397:                                              ; preds = %389
  %398 = zext i8 %392 to i64
  %399 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %398
  %400 = load i8, ptr %399, align 1, !tbaa !62
  %401 = zext i8 %393 to i64
  %402 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %401
  %403 = load i8, ptr %402, align 1, !tbaa !62
  %404 = icmp eq i8 %400, %403
  br i1 %404, label %405, label %408

405:                                              ; preds = %397, %395
  %406 = getelementptr inbounds nuw i8, ptr %391, i64 1
  %407 = getelementptr inbounds nuw i8, ptr %390, i64 1
  br label %389

408:                                              ; preds = %424, %397
  %409 = phi ptr [ %426, %424 ], [ @.str.744, %397 ]
  %410 = phi ptr [ %425, %424 ], [ %279, %397 ]
  %411 = load i8, ptr %410, align 1, !tbaa !62
  %412 = load i8, ptr %409, align 1, !tbaa !62
  %413 = icmp eq i8 %411, %412
  br i1 %413, label %414, label %416

414:                                              ; preds = %408
  %415 = icmp eq i8 %411, 0
  br i1 %415, label %446, label %424

416:                                              ; preds = %408
  %417 = zext i8 %411 to i64
  %418 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %417
  %419 = load i8, ptr %418, align 1, !tbaa !62
  %420 = zext i8 %412 to i64
  %421 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %420
  %422 = load i8, ptr %421, align 1, !tbaa !62
  %423 = icmp eq i8 %419, %422
  br i1 %423, label %424, label %427

424:                                              ; preds = %416, %414
  %425 = getelementptr inbounds nuw i8, ptr %410, i64 1
  %426 = getelementptr inbounds nuw i8, ptr %409, i64 1
  br label %408

427:                                              ; preds = %443, %416
  %428 = phi ptr [ %445, %443 ], [ @.str.780, %416 ]
  %429 = phi ptr [ %444, %443 ], [ %279, %416 ]
  %430 = load i8, ptr %429, align 1, !tbaa !62
  %431 = load i8, ptr %428, align 1, !tbaa !62
  %432 = icmp eq i8 %430, %431
  br i1 %432, label %433, label %435

433:                                              ; preds = %427
  %434 = icmp eq i8 %430, 0
  br i1 %434, label %446, label %443

435:                                              ; preds = %427
  %436 = zext i8 %430 to i64
  %437 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %436
  %438 = load i8, ptr %437, align 1, !tbaa !62
  %439 = zext i8 %431 to i64
  %440 = getelementptr inbounds nuw i8, ptr @sqlite3UpperToLower, i64 %439
  %441 = load i8, ptr %440, align 1, !tbaa !62
  %442 = icmp eq i8 %438, %441
  br i1 %442, label %443, label %450

443:                                              ; preds = %435, %433
  %444 = getelementptr inbounds nuw i8, ptr %429, i64 1
  %445 = getelementptr inbounds nuw i8, ptr %428, i64 1
  br label %427

446:                                              ; preds = %433, %414, %395
  %447 = load ptr, ptr %277, align 8, !tbaa !97
  %448 = load ptr, ptr %21, align 8, !tbaa !107
  %449 = trunc nuw nsw i64 %266 to i32
  br label %467

450:                                              ; preds = %435, %388
  call void (ptr, ptr, ...) @sqlite3ErrorMsg(ptr noundef nonnull %0, ptr noundef nonnull @.str.956, ptr noundef %279)
  %451 = getelementptr inbounds nuw i8, ptr %0, i64 39
  %452 = load i16, ptr %451, align 1
  %453 = or i16 %452, 256
  store i16 %453, ptr %451, align 1
  br label %1542

454:                                              ; preds = %382, %374, %370
  %455 = phi i64 [ %375, %382 ], [ %375, %374 ], [ %373, %370 ]
  %456 = phi i8 [ %270, %382 ], [ 1, %374 ], [ %270, %370 ]
  %457 = phi i8 [ %269, %382 ], [ %269, %374 ], [ 1, %370 ]
  %458 = phi ptr [ %268, %382 ], [ %268, %374 ], [ %371, %370 ]
  %459 = phi i32 [ %267, %382 ], [ %267, %374 ], [ %372, %370 ]
  %460 = getelementptr inbounds nuw [4 x i8], ptr %210, i64 %455
  %461 = trunc nuw nsw i64 %266 to i32
  store i32 %461, ptr %460, align 4, !tbaa !6
  %462 = load ptr, ptr %21, align 8, !tbaa !107
  %463 = icmp slt i32 %366, 0
  br i1 %463, label %467, label %464

464:                                              ; preds = %454
  %465 = getelementptr inbounds nuw [16 x i8], ptr %297, i64 %455
  %466 = load ptr, ptr %465, align 8, !tbaa !104
  br label %467

467:                                              ; preds = %464, %454, %446
  %468 = phi ptr [ %462, %464 ], [ %462, %454 ], [ %448, %446 ]
  %469 = phi i32 [ %366, %464 ], [ %366, %454 ], [ -1, %446 ]
  %470 = phi i32 [ %459, %464 ], [ %459, %454 ], [ %449, %446 ]
  %471 = phi ptr [ %458, %464 ], [ %458, %454 ], [ %447, %446 ]
  %472 = phi i8 [ %457, %464 ], [ %457, %454 ], [ 1, %446 ]
  %473 = phi i8 [ %456, %464 ], [ %456, %454 ], [ %270, %446 ]
  %474 = phi ptr [ %466, %464 ], [ @.str.744, %454 ], [ @.str.744, %446 ]
  %475 = load ptr, ptr %261, align 8, !tbaa !71
  %476 = getelementptr inbounds [32 x i8], ptr %475, i64 %262
  %477 = load ptr, ptr %476, align 8, !tbaa !108
  %478 = load ptr, ptr %0, align 8, !tbaa !10
  %479 = getelementptr inbounds nuw i8, ptr %478, i64 504
  %480 = load ptr, ptr %479, align 8, !tbaa !109
  %481 = icmp eq ptr %480, null
  br i1 %481, label %507, label %482

482:                                              ; preds = %467
  %483 = getelementptr inbounds nuw i8, ptr %478, i64 197
  %484 = load i8, ptr %483, align 1, !tbaa !110
  %485 = icmp eq i8 %484, 0
  br i1 %485, label %486, label %507

486:                                              ; preds = %482
  %487 = load i8, ptr %263, align 4, !tbaa !111
  %488 = icmp eq i8 %487, 0
  br i1 %488, label %489, label %507

489:                                              ; preds = %486
  %490 = getelementptr inbounds nuw i8, ptr %478, i64 512
  %491 = load ptr, ptr %490, align 8, !tbaa !112
  %492 = load ptr, ptr %264, align 8, !tbaa !113
  %493 = call i32 %480(ptr noundef %491, i32 noundef 23, ptr noundef %468, ptr noundef %474, ptr noundef %477, ptr noundef %492) #7
  %494 = icmp eq i32 %493, 1
  br i1 %494, label %498, label %495

495:                                              ; preds = %489
  %496 = and i32 %493, -3
  %497 = icmp eq i32 %496, 0
  br i1 %497, label %502, label %498

498:                                              ; preds = %495, %489
  %499 = phi ptr [ @.str.687, %495 ], [ @.str.645, %489 ]
  %500 = phi i32 [ 1, %495 ], [ 23, %489 ]
  call void (ptr, ptr, ...) @sqlite3ErrorMsg(ptr noundef nonnull %0, ptr noundef nonnull %499)
  %501 = getelementptr inbounds nuw i8, ptr %0, i64 24
  store i32 %500, ptr %501, align 8, !tbaa !114
  br label %1542

502:                                              ; preds = %495
  %503 = icmp eq i32 %493, 2
  br i1 %503, label %504, label %507

504:                                              ; preds = %502
  %505 = sext i32 %469 to i64
  %506 = getelementptr inbounds [4 x i8], ptr %210, i64 %505
  store i32 -1, ptr %506, align 4, !tbaa !6
  br label %507

507:                                              ; preds = %504, %502, %486, %482, %467
  %508 = add nuw nsw i64 %266, 1
  %509 = load i32, ptr %2, align 8, !tbaa !6
  %510 = sext i32 %509 to i64
  %511 = icmp slt i64 %508, %510
  br i1 %511, label %265, label %512, !llvm.loop !68

512:                                              ; preds = %507, %250
  %513 = phi i8 [ %473, %507 ], [ 0, %250 ]
  %514 = phi i8 [ %472, %507 ], [ 0, %250 ]
  %515 = phi ptr [ %471, %507 ], [ null, %250 ]
  %516 = phi i32 [ %470, %507 ], [ -1, %250 ]
  %517 = add nuw nsw i8 %514, %513
  %518 = load i32, ptr %151, align 8, !tbaa !81
  %519 = and i32 %518, 96
  %520 = icmp eq i32 %519, 0
  br i1 %520, label %583, label %521

521:                                              ; preds = %512
  %522 = getelementptr inbounds nuw i8, ptr %21, i64 8
  %523 = getelementptr inbounds nuw i8, ptr %21, i64 80
  %524 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %525 = getelementptr inbounds nuw i8, ptr %9, i64 40
  %526 = getelementptr inbounds nuw i8, ptr %9, i64 36
  %527 = icmp eq i8 %514, 0
  %528 = load i16, ptr %200, align 2, !tbaa !79
  br label %529

529:                                              ; preds = %581, %521
  %530 = phi i16 [ %578, %581 ], [ %528, %521 ]
  %531 = icmp sgt i16 %530, 0
  br i1 %531, label %532, label %583

532:                                              ; preds = %575, %529
  %533 = phi i64 [ %577, %575 ], [ 0, %529 ]
  %534 = phi i32 [ %576, %575 ], [ 0, %529 ]
  %535 = getelementptr inbounds nuw [4 x i8], ptr %210, i64 %533
  %536 = load i32, ptr %535, align 4, !tbaa !6
  %537 = icmp sgt i32 %536, -1
  br i1 %537, label %575, label %538

538:                                              ; preds = %532
  %539 = load ptr, ptr %522, align 8, !tbaa !101
  %540 = getelementptr inbounds nuw [16 x i8], ptr %539, i64 %533
  %541 = getelementptr inbounds nuw i8, ptr %540, i64 14
  %542 = load i16, ptr %541, align 2, !tbaa !106
  %543 = and i16 %542, 96
  %544 = icmp eq i16 %543, 0
  br i1 %544, label %575, label %545

545:                                              ; preds = %538
  %546 = getelementptr inbounds nuw i8, ptr %540, i64 12
  %547 = load i16, ptr %546, align 4, !tbaa !115
  %548 = zext i16 %547 to i32
  %549 = icmp eq i16 %547, 0
  br i1 %549, label %559, label %550

550:                                              ; preds = %545
  %551 = load i8, ptr %127, align 1, !tbaa !78
  %552 = icmp eq i8 %551, 0
  br i1 %552, label %553, label %559

553:                                              ; preds = %550
  %554 = load ptr, ptr %523, align 8, !tbaa !62
  %555 = icmp eq ptr %554, null
  br i1 %555, label %559, label %556

556:                                              ; preds = %553
  %557 = load i32, ptr %554, align 8, !tbaa !6
  %558 = icmp slt i32 %557, %548
  br i1 %558, label %559, label %560

559:                                              ; preds = %556, %553, %550, %545
  call void @llvm.lifetime.start.p0(ptr %9)
  br label %569

560:                                              ; preds = %556
  %561 = zext i16 %547 to i64
  %562 = getelementptr [24 x i8], ptr %554, i64 %561
  %563 = getelementptr i8, ptr %562, i64 -16
  %564 = load ptr, ptr %563, align 8, !tbaa !97
  call void @llvm.lifetime.start.p0(ptr %9)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(40) %9, i8 0, i64 40, i1 false)
  store ptr @checkConstraintExprNode, ptr %524, align 8, !tbaa !116
  store ptr %210, ptr %525, align 8, !tbaa !62
  %565 = icmp eq ptr %564, null
  br i1 %565, label %569, label %566

566:                                              ; preds = %560
  %567 = call fastcc i32 @sqlite3WalkExprNN(ptr noundef nonnull %9, ptr noundef nonnull %564)
  %568 = load i16, ptr %526, align 4, !tbaa !118
  br label %569

569:                                              ; preds = %566, %560, %559
  %570 = phi i16 [ %568, %566 ], [ 0, %560 ], [ 0, %559 ]
  %571 = and i16 %570, -3
  %572 = select i1 %527, i16 %571, i16 %570
  %573 = icmp eq i16 %572, 0
  call void @llvm.lifetime.end.p0(ptr %9)
  br i1 %573, label %575, label %574

574:                                              ; preds = %569
  store i32 99999, ptr %535, align 4, !tbaa !6
  br label %575

575:                                              ; preds = %574, %569, %538, %532
  %576 = phi i32 [ 1, %574 ], [ %534, %569 ], [ %534, %538 ], [ %534, %532 ]
  %577 = add nuw nsw i64 %533, 1
  %578 = load i16, ptr %200, align 2, !tbaa !79
  %579 = sext i16 %578 to i64
  %580 = icmp slt i64 %577, %579
  br i1 %580, label %532, label %581, !llvm.loop !68

581:                                              ; preds = %575
  %582 = icmp eq i32 %576, 0
  br i1 %582, label %583, label %529, !llvm.loop !68

583:                                              ; preds = %581, %529, %512
  %584 = load i8, ptr %127, align 1, !tbaa !78
  %585 = icmp eq i8 %584, 1
  %586 = sext i1 %585 to i64
  %587 = getelementptr inbounds nuw i8, ptr %1, i64 40
  store i64 %586, ptr %587, align 8, !tbaa !119
  %588 = zext nneg i8 %517 to i32
  %589 = call fastcc i32 @sqlite3FkRequired(ptr noundef nonnull %0, ptr noundef %21, ptr noundef nonnull %210, i32 noundef %588) #8
  %590 = icmp eq i32 %4, 5
  %591 = zext i1 %590 to i32
  %592 = load ptr, ptr %189, align 8, !tbaa !63
  %593 = icmp eq ptr %592, null
  br i1 %593, label %701, label %594

594:                                              ; preds = %583
  %595 = icmp ne i8 %517, 0
  %596 = icmp ugt i32 %589, 1
  %597 = select i1 %595, i1 true, i1 %596
  %598 = getelementptr inbounds nuw i8, ptr %8, i64 8
  %599 = getelementptr inbounds nuw i8, ptr %8, i64 40
  %600 = getelementptr inbounds nuw i8, ptr %8, i64 36
  %601 = icmp eq i8 %514, 0
  %602 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %603 = getelementptr inbounds nuw i8, ptr %7, i64 40
  %604 = getelementptr inbounds nuw i8, ptr %7, i64 36
  %605 = getelementptr inbounds nuw i8, ptr %0, i64 60
  %606 = icmp eq i32 %4, 11
  br label %607

607:                                              ; preds = %690, %594
  %608 = phi ptr [ %697, %690 ], [ %592, %594 ]
  %609 = phi i32 [ %691, %690 ], [ 0, %594 ]
  %610 = phi i32 [ %692, %690 ], [ %591, %594 ]
  %611 = icmp eq ptr %608, %186
  %612 = or i1 %597, %611
  br i1 %612, label %630, label %613

613:                                              ; preds = %607
  %614 = getelementptr inbounds nuw i8, ptr %608, i64 72
  %615 = load ptr, ptr %614, align 8, !tbaa !120
  %616 = icmp eq ptr %615, null
  br i1 %616, label %617, label %624

617:                                              ; preds = %624, %613
  %618 = getelementptr inbounds nuw i8, ptr %608, i64 94
  %619 = load i16, ptr %618, align 2, !tbaa !121
  %620 = icmp eq i16 %619, 0
  br i1 %620, label %685, label %621

621:                                              ; preds = %617
  %622 = getelementptr inbounds nuw i8, ptr %608, i64 8
  %623 = getelementptr inbounds nuw i8, ptr %608, i64 80
  br label %642

624:                                              ; preds = %613
  call void @llvm.lifetime.start.p0(ptr %8)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(40) %8, i8 0, i64 40, i1 false)
  store ptr @checkConstraintExprNode, ptr %598, align 8, !tbaa !116
  store ptr %210, ptr %599, align 8, !tbaa !62
  %625 = call fastcc i32 @sqlite3WalkExprNN(ptr noundef nonnull %8, ptr noundef nonnull %615)
  %626 = load i16, ptr %600, align 4, !tbaa !118
  %627 = and i16 %626, -3
  %628 = select i1 %601, i16 %627, i16 %626
  %629 = icmp eq i16 %628, 0
  call void @llvm.lifetime.end.p0(ptr %8)
  br i1 %629, label %617, label %630

630:                                              ; preds = %624, %607
  %631 = load i32, ptr %605, align 4, !tbaa !122
  %632 = add i32 %631, 1
  %633 = getelementptr inbounds nuw i8, ptr %608, i64 96
  %634 = load i16, ptr %633, align 8, !tbaa !123
  %635 = zext i16 %634 to i32
  %636 = add i32 %632, %635
  store i32 %636, ptr %605, align 4, !tbaa !122
  br label %679

637:                                              ; preds = %662, %648
  %638 = add nuw nsw i64 %643, 1
  %639 = load i16, ptr %618, align 2, !tbaa !121
  %640 = zext i16 %639 to i64
  %641 = icmp ult i64 %638, %640
  br i1 %641, label %642, label %685, !llvm.loop !68

642:                                              ; preds = %637, %621
  %643 = phi i64 [ %638, %637 ], [ 0, %621 ]
  %644 = load ptr, ptr %622, align 8, !tbaa !124
  %645 = getelementptr inbounds nuw [2 x i8], ptr %644, i64 %643
  %646 = load i16, ptr %645, align 2, !tbaa !125
  %647 = icmp sgt i16 %646, -1
  br i1 %647, label %648, label %653

648:                                              ; preds = %642
  %649 = zext nneg i16 %646 to i64
  %650 = getelementptr inbounds nuw [4 x i8], ptr %210, i64 %649
  %651 = load i32, ptr %650, align 4, !tbaa !6
  %652 = icmp sgt i32 %651, -1
  br i1 %652, label %667, label %637

653:                                              ; preds = %642
  %654 = load ptr, ptr %623, align 8, !tbaa !126
  %655 = getelementptr inbounds nuw i8, ptr %654, i64 8
  %656 = getelementptr inbounds nuw [24 x i8], ptr %655, i64 %643
  %657 = load ptr, ptr %656, align 8, !tbaa !97
  call void @llvm.lifetime.start.p0(ptr %7)
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 8 dereferenceable(40) %7, i8 0, i64 40, i1 false)
  store ptr @checkConstraintExprNode, ptr %602, align 8, !tbaa !116
  store ptr %210, ptr %603, align 8, !tbaa !62
  %658 = icmp eq ptr %657, null
  br i1 %658, label %662, label %659

659:                                              ; preds = %653
  %660 = call fastcc i32 @sqlite3WalkExprNN(ptr noundef nonnull %7, ptr noundef nonnull %657)
  %661 = load i16, ptr %604, align 4, !tbaa !118
  br label %662

662:                                              ; preds = %659, %653
  %663 = phi i16 [ %661, %659 ], [ 0, %653 ]
  %664 = and i16 %663, -3
  %665 = select i1 %601, i16 %664, i16 %663
  %666 = icmp eq i16 %665, 0
  call void @llvm.lifetime.end.p0(ptr %7)
  br i1 %666, label %637, label %667

667:                                              ; preds = %662, %648
  %668 = load i32, ptr %605, align 4, !tbaa !122
  %669 = add i32 %668, 1
  %670 = getelementptr inbounds nuw i8, ptr %608, i64 96
  %671 = load i16, ptr %670, align 8, !tbaa !123
  %672 = zext i16 %671 to i32
  %673 = add i32 %669, %672
  store i32 %673, ptr %605, align 4, !tbaa !122
  br i1 %606, label %674, label %679

674:                                              ; preds = %667
  %675 = getelementptr inbounds nuw i8, ptr %608, i64 98
  %676 = load i8, ptr %675, align 2, !tbaa !127
  %677 = icmp eq i8 %676, 5
  %678 = select i1 %677, i32 1, i32 %610
  br label %679

679:                                              ; preds = %674, %667, %630
  %680 = phi i32 [ %678, %674 ], [ %610, %667 ], [ %610, %630 ]
  %681 = phi i32 [ %669, %674 ], [ %669, %667 ], [ %632, %630 ]
  %682 = icmp eq i32 %681, 0
  br i1 %682, label %685, label %683

683:                                              ; preds = %679
  %684 = add i32 %609, 1
  br label %690

685:                                              ; preds = %679, %637, %617
  %686 = phi i32 [ %680, %679 ], [ %610, %637 ], [ %610, %617 ]
  %687 = add i32 %609, 1
  %688 = sext i32 %687 to i64
  %689 = getelementptr inbounds i8, ptr %217, i64 %688
  store i8 0, ptr %689, align 1, !tbaa !62
  br label %690

690:                                              ; preds = %685, %683
  %691 = phi i32 [ %687, %685 ], [ %684, %683 ]
  %692 = phi i32 [ %686, %685 ], [ %680, %683 ]
  %693 = phi i32 [ 0, %685 ], [ %681, %683 ]
  %694 = sext i32 %609 to i64
  %695 = getelementptr inbounds [4 x i8], ptr %215, i64 %694
  store i32 %693, ptr %695, align 4, !tbaa !6
  %696 = getelementptr inbounds nuw i8, ptr %608, i64 40
  %697 = load ptr, ptr %696, align 8, !tbaa !63
  %698 = icmp eq ptr %697, null
  br i1 %698, label %699, label %607, !llvm.loop !68

699:                                              ; preds = %690
  %700 = sext i32 %691 to i64
  br label %701

701:                                              ; preds = %699, %583
  %702 = phi i32 [ %692, %699 ], [ %591, %583 ]
  %703 = phi i64 [ %700, %699 ], [ 0, %583 ]
  store i32 %702, ptr %12, align 4
  %704 = getelementptr inbounds nuw i8, ptr %0, i64 60
  %705 = load i32, ptr %704, align 4, !tbaa !122
  %706 = add i32 %705, 1
  store i32 %706, ptr %704, align 4, !tbaa !122
  %707 = getelementptr inbounds [4 x i8], ptr %215, i64 %703
  store i32 %706, ptr %707, align 4, !tbaa !6
  %708 = icmp eq i32 %702, 0
  br i1 %708, label %710, label %709

709:                                              ; preds = %701
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 %217, i8 noundef 1, i64 noundef %218, i1 false)
  br label %710

710:                                              ; preds = %709, %701
  %711 = getelementptr inbounds nuw i8, ptr %0, i64 30
  %712 = load i8, ptr %711, align 2, !tbaa !128
  %713 = icmp eq i8 %712, 0
  br i1 %713, label %714, label %718

714:                                              ; preds = %710
  %715 = getelementptr inbounds nuw i8, ptr %251, i64 200
  %716 = load i16, ptr %715, align 8
  %717 = or i16 %716, 16
  store i16 %717, ptr %715, align 8
  br label %718

718:                                              ; preds = %714, %710
  %719 = icmp ne ptr %126, null
  %720 = icmp ne i32 %589, 0
  %721 = select i1 %719, i1 true, i1 %720
  %722 = zext i1 %721 to i32
  call fastcc void @sqlite3BeginWriteOperation(ptr noundef nonnull %0, i32 noundef %722, i32 noundef %103)
  %723 = load i8, ptr %127, align 1, !tbaa !78
  %724 = icmp eq i8 %723, 1
  br i1 %724, label %750, label %725

725:                                              ; preds = %718
  %726 = load i32, ptr %707, align 4, !tbaa !6
  %727 = load i32, ptr %704, align 4, !tbaa !122
  %728 = add i32 %727, 1
  %729 = icmp ne i8 %513, 0
  %730 = or i1 %719, %729
  %731 = select i1 %730, i1 true, i1 %720
  br i1 %731, label %732, label %737

732:                                              ; preds = %725
  %733 = add i32 %727, 2
  %734 = load i16, ptr %200, align 2, !tbaa !79
  %735 = sext i16 %734 to i32
  %736 = add i32 %728, %735
  br label %737

737:                                              ; preds = %732, %725
  %738 = phi i32 [ %736, %732 ], [ %728, %725 ]
  %739 = phi i32 [ %733, %732 ], [ 0, %725 ]
  %740 = icmp ne i8 %517, 0
  %741 = or i1 %719, %740
  %742 = select i1 %741, i1 true, i1 %720
  %743 = add i32 %738, 1
  %744 = select i1 %742, i32 %743, i32 %738
  %745 = select i1 %742, i32 %743, i32 %728
  %746 = add i32 %744, 1
  %747 = load i16, ptr %200, align 2, !tbaa !79
  %748 = sext i16 %747 to i32
  %749 = add i32 %744, %748
  store i32 %749, ptr %704, align 4, !tbaa !122
  br label %750

750:                                              ; preds = %737, %718
  %751 = phi i32 [ %728, %737 ], [ 0, %718 ]
  %752 = phi i32 [ %745, %737 ], [ 0, %718 ]
  %753 = phi i32 [ %746, %737 ], [ 0, %718 ]
  %754 = phi i32 [ %739, %737 ], [ 0, %718 ]
  %755 = phi i32 [ %726, %737 ], [ 0, %718 ]
  br i1 %129, label %758, label %756

756:                                              ; preds = %750
  %757 = icmp eq i32 %135, 0
  br i1 %757, label %764, label %771

758:                                              ; preds = %750
  %759 = load ptr, ptr %21, align 8, !tbaa !107
  %760 = getelementptr inbounds nuw i8, ptr %0, i64 376
  %761 = load ptr, ptr %760, align 8, !tbaa !113
  store ptr %759, ptr %760, align 8, !tbaa !113
  %762 = icmp eq i32 %135, 0
  br i1 %762, label %763, label %771

763:                                              ; preds = %758
  call fastcc void @sqlite3MaterializeView(ptr noundef nonnull %0, ptr noundef %21, ptr noundef %3, i32 noundef %198)
  br label %764

764:                                              ; preds = %763, %756
  %765 = phi ptr [ %761, %763 ], [ null, %756 ]
  %766 = phi ptr [ %0, %763 ], [ null, %756 ]
  %767 = call fastcc i32 @sqlite3ResolveExprNames(ptr noundef %10, ptr noundef %3)
  %768 = icmp eq i32 %767, 0
  br i1 %768, label %769, label %1536

769:                                              ; preds = %764
  %770 = load i8, ptr %127, align 1, !tbaa !78
  br label %771

771:                                              ; preds = %769, %758, %756
  %772 = phi i8 [ %770, %769 ], [ %723, %758 ], [ %723, %756 ]
  %773 = phi ptr [ %765, %769 ], [ %761, %758 ], [ null, %756 ]
  %774 = phi ptr [ %766, %769 ], [ %0, %758 ], [ null, %756 ]
  %775 = phi i1 [ true, %769 ], [ false, %758 ], [ false, %756 ]
  %776 = icmp eq i8 %772, 1
  br i1 %776, label %777, label %778

777:                                              ; preds = %771
  call fastcc void @updateVirtualTable(ptr noundef nonnull %0, ptr noundef nonnull %1, ptr noundef %21, ptr noundef nonnull %2, ptr noundef %515, ptr noundef %210, ptr noundef %3, i32 noundef %4)
  br label %1536

778:                                              ; preds = %771
  %779 = getelementptr inbounds nuw i8, ptr %0, i64 76
  %780 = load i32, ptr %779, align 4, !tbaa !129
  %781 = add i32 %780, -1
  store i32 %781, ptr %779, align 4, !tbaa !129
  %782 = getelementptr inbounds nuw i8, ptr %15, i64 48
  %783 = load i64, ptr %782, align 8, !tbaa !130
  %784 = and i64 %783, 4294967296
  %785 = icmp eq i64 %784, 0
  br i1 %785, label %803, label %786

786:                                              ; preds = %778
  %787 = getelementptr inbounds nuw i8, ptr %0, i64 168
  %788 = load ptr, ptr %787, align 8, !tbaa !131
  %789 = icmp eq ptr %788, null
  br i1 %789, label %790, label %803

790:                                              ; preds = %786
  %791 = load i8, ptr %711, align 2, !tbaa !128
  %792 = icmp eq i8 %791, 0
  br i1 %792, label %793, label %803

793:                                              ; preds = %790
  %794 = getelementptr inbounds nuw i8, ptr %0, i64 39
  %795 = load i16, ptr %794, align 1
  %796 = and i16 %795, 8
  %797 = icmp eq i16 %796, 0
  %798 = and i1 %190, %797
  br i1 %798, label %799, label %803

799:                                              ; preds = %793
  %800 = load i32, ptr %704, align 4, !tbaa !122
  %801 = add i32 %800, 1
  store i32 %801, ptr %704, align 4, !tbaa !122
  %802 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 73, i32 noundef 0, i32 noundef %801)
  br label %803

803:                                              ; preds = %799, %793, %790, %786, %778
  %804 = phi i32 [ %801, %799 ], [ 0, %793 ], [ 0, %790 ], [ 0, %786 ], [ 0, %778 ]
  br i1 %775, label %805, label %814

805:                                              ; preds = %803
  %806 = load i32, ptr %151, align 8, !tbaa !81
  %807 = and i32 %806, 128
  %808 = icmp eq i32 %807, 0
  br i1 %808, label %809, label %814

809:                                              ; preds = %805
  %810 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 77, i32 noundef 0, i32 noundef %755, i32 noundef %751)
  %811 = load i32, ptr %148, align 8, !tbaa !80
  %812 = add i32 %811, 1
  store i32 %812, ptr %148, align 8, !tbaa !80
  %813 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 120, i32 noundef %811, i32 noundef 0, i32 noundef %755)
  br label %851

814:                                              ; preds = %805, %803
  %815 = icmp eq ptr %186, null
  br i1 %815, label %819, label %816

816:                                              ; preds = %814
  %817 = getelementptr inbounds nuw i8, ptr %186, i64 94
  %818 = load i16, ptr %817, align 2, !tbaa !121
  br label %819

819:                                              ; preds = %816, %814
  %820 = phi i16 [ %818, %816 ], [ 0, %814 ]
  %821 = load i32, ptr %704, align 4, !tbaa !122
  %822 = add i32 %821, 1
  %823 = sext i16 %820 to i32
  %824 = add i32 %821, %823
  %825 = add i32 %135, 1
  %826 = add i32 %825, %824
  store i32 %826, ptr %704, align 4, !tbaa !122
  br i1 %190, label %827, label %861

827:                                              ; preds = %819
  %828 = add i32 %135, %823
  br i1 %129, label %829, label %832

829:                                              ; preds = %827
  %830 = load i16, ptr %200, align 2, !tbaa !79
  %831 = sext i16 %830 to i32
  br label %832

832:                                              ; preds = %829, %827
  %833 = phi i32 [ %831, %829 ], [ 0, %827 ]
  %834 = add i32 %828, %833
  %835 = load i32, ptr %148, align 8, !tbaa !80
  %836 = add i32 %835, 1
  store i32 %836, ptr %148, align 8, !tbaa !80
  br i1 %815, label %837, label %839

837:                                              ; preds = %832
  %838 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 120, i32 noundef %835, i32 noundef %834)
  br label %847

839:                                              ; preds = %832
  %840 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 77, i32 noundef 0, i32 noundef %822, i32 noundef %824)
  %841 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 120, i32 noundef %835, i32 noundef %834)
  %842 = call fastcc ptr @sqlite3KeyInfoOfIndex(ptr noundef nonnull %0, ptr noundef nonnull %186)
  %843 = icmp eq ptr %842, null
  br i1 %843, label %847, label %844

844:                                              ; preds = %839
  %845 = trunc i32 %834 to i16
  %846 = getelementptr inbounds nuw i8, ptr %842, i64 8
  store i16 %845, ptr %846, align 8, !tbaa !125
  call fastcc void @sqlite3VdbeAppendP4(ptr noundef nonnull %251, ptr noundef nonnull %842, i32 noundef -9)
  br label %847

847:                                              ; preds = %844, %839, %837
  %848 = phi i32 [ %841, %844 ], [ %841, %839 ], [ %838, %837 ]
  br i1 %775, label %851, label %849

849:                                              ; preds = %847
  call fastcc void @updateFromSelect(ptr noundef nonnull %0, i32 noundef %835, ptr noundef %186, ptr noundef nonnull %2, ptr noundef nonnull %1, ptr noundef %3)
  %850 = select i1 %129, i32 %835, i32 %198
  br label %851

851:                                              ; preds = %849, %847, %809
  %852 = phi i32 [ %850, %849 ], [ %198, %847 ], [ %198, %809 ]
  %853 = phi i32 [ %835, %849 ], [ %835, %847 ], [ %811, %809 ]
  %854 = phi i32 [ %848, %849 ], [ %848, %847 ], [ %813, %809 ]
  %855 = phi i32 [ %822, %849 ], [ %822, %847 ], [ 0, %809 ]
  %856 = phi i16 [ %820, %849 ], [ %820, %847 ], [ 0, %809 ]
  %857 = phi i32 [ %826, %849 ], [ %826, %847 ], [ 0, %809 ]
  %858 = icmp eq i32 %135, 0
  br i1 %858, label %874, label %859

859:                                              ; preds = %851
  %860 = sext i16 %856 to i32
  br label %863

861:                                              ; preds = %819
  %862 = icmp eq i32 %135, 0
  br i1 %862, label %875, label %863

863:                                              ; preds = %861, %859
  %864 = phi i32 [ %823, %861 ], [ %860, %859 ]
  %865 = phi i16 [ %820, %861 ], [ %856, %859 ]
  %866 = phi i32 [ %822, %861 ], [ %855, %859 ]
  %867 = phi i32 [ 0, %861 ], [ %853, %859 ]
  %868 = phi i32 [ %198, %861 ], [ %852, %859 ]
  %869 = getelementptr inbounds nuw i8, ptr %0, i64 160
  %870 = load ptr, ptr %869, align 8, !tbaa !95
  %871 = icmp eq ptr %870, null
  %872 = select i1 %871, ptr %0, ptr %870
  %873 = getelementptr inbounds nuw i8, ptr %872, i64 32
  store i8 1, ptr %873, align 8, !tbaa !132
  br label %991

874:                                              ; preds = %851
  br i1 %190, label %882, label %875

875:                                              ; preds = %874, %861
  %876 = phi i32 [ %852, %874 ], [ %198, %861 ]
  %877 = phi i32 [ %853, %874 ], [ 0, %861 ]
  %878 = phi i32 [ %854, %874 ], [ 0, %861 ]
  %879 = phi i32 [ %855, %874 ], [ %822, %861 ]
  %880 = phi i16 [ %856, %874 ], [ %820, %861 ]
  %881 = phi i32 [ %857, %874 ], [ %826, %861 ]
  call void @sqlite3ExprIfFalse(ptr noundef nonnull %0, ptr noundef %3, i32 noundef %781, i32 noundef 16)
  br label %935

882:                                              ; preds = %874
  %883 = load i8, ptr %711, align 2, !tbaa !128
  %884 = icmp ne i8 %883, 0
  %885 = or i1 %719, %884
  %886 = select i1 %885, i1 true, i1 %720
  %887 = icmp ne i8 %517, 0
  %888 = select i1 %886, i1 true, i1 %887
  %889 = load i32, ptr %12, align 4
  %890 = icmp ne i32 %889, 0
  %891 = select i1 %888, i1 true, i1 %890
  br i1 %891, label %900, label %892

892:                                              ; preds = %882
  %893 = icmp eq ptr %3, null
  br i1 %893, label %899, label %894

894:                                              ; preds = %892
  %895 = getelementptr inbounds nuw i8, ptr %3, i64 4
  %896 = load i32, ptr %895, align 4, !tbaa !133
  %897 = and i32 %896, 4194304
  %898 = icmp eq i32 %897, 0
  br i1 %898, label %899, label %900

899:                                              ; preds = %894, %892
  br label %900

900:                                              ; preds = %899, %894, %882
  %901 = phi i16 [ 12, %899 ], [ 4, %894 ], [ 4, %882 ]
  %902 = call fastcc ptr @sqlite3WhereBegin(ptr noundef nonnull %0, ptr noundef nonnull %1, ptr noundef %3, ptr noundef null, ptr noundef null, ptr noundef null, i16 noundef zeroext %901, i32 noundef %197)
  %903 = icmp eq ptr %902, null
  br i1 %903, label %1536, label %904

904:                                              ; preds = %900
  %905 = getelementptr inbounds nuw i8, ptr %902, i64 40
  %906 = load i64, ptr %905, align 1
  %907 = trunc i64 %906 to i32
  %908 = lshr i64 %906, 32
  %909 = trunc nuw i64 %908 to i32
  %910 = getelementptr inbounds nuw i8, ptr %902, i64 66
  %911 = load i8, ptr %910, align 2, !tbaa !62
  %912 = getelementptr inbounds nuw i8, ptr %902, i64 68
  %913 = load i8, ptr %912, align 4
  %914 = and i8 %913, 1
  %915 = icmp eq i8 %911, 1
  br i1 %915, label %935, label %916

916:                                              ; preds = %904
  %917 = zext i8 %911 to i32
  %918 = getelementptr inbounds nuw i8, ptr %0, i64 160
  %919 = load ptr, ptr %918, align 8, !tbaa !95
  %920 = icmp eq ptr %919, null
  %921 = select i1 %920, ptr %0, ptr %919
  %922 = getelementptr inbounds nuw i8, ptr %921, i64 32
  store i8 1, ptr %922, align 8, !tbaa !132
  %923 = icmp eq i8 %911, 2
  br i1 %923, label %924, label %935

924:                                              ; preds = %916
  %925 = icmp slt i64 %906, 0
  %926 = icmp eq i32 %852, %909
  %927 = select i1 %925, i1 true, i1 %926
  br i1 %927, label %935, label %928

928:                                              ; preds = %924
  %929 = sub i32 %909, %149
  %930 = sext i32 %929 to i64
  %931 = getelementptr inbounds i8, ptr %217, i64 %930
  %932 = load i8, ptr %931, align 1, !tbaa !62
  %933 = icmp eq i8 %932, 0
  %934 = select i1 %933, i32 2, i32 0
  br label %935

935:                                              ; preds = %928, %924, %916, %904, %875
  %936 = phi i32 [ %909, %928 ], [ %909, %924 ], [ %909, %916 ], [ %909, %904 ], [ undef, %875 ]
  %937 = phi i32 [ %907, %928 ], [ %907, %924 ], [ %907, %916 ], [ %907, %904 ], [ undef, %875 ]
  %938 = phi i32 [ %852, %928 ], [ %852, %924 ], [ %852, %916 ], [ %852, %904 ], [ %876, %875 ]
  %939 = phi i32 [ %853, %928 ], [ %853, %924 ], [ %853, %916 ], [ %853, %904 ], [ %877, %875 ]
  %940 = phi i32 [ %854, %928 ], [ %854, %924 ], [ %854, %916 ], [ %854, %904 ], [ %878, %875 ]
  %941 = phi i32 [ %855, %928 ], [ %855, %924 ], [ %855, %916 ], [ %855, %904 ], [ %879, %875 ]
  %942 = phi i16 [ %856, %928 ], [ %856, %924 ], [ %856, %916 ], [ %856, %904 ], [ %880, %875 ]
  %943 = phi i32 [ %857, %928 ], [ %857, %924 ], [ %857, %916 ], [ %857, %904 ], [ %881, %875 ]
  %944 = phi i32 [ %934, %928 ], [ 2, %924 ], [ %917, %916 ], [ 1, %904 ], [ 1, %875 ]
  %945 = phi ptr [ %902, %928 ], [ %902, %924 ], [ %902, %916 ], [ %902, %904 ], [ null, %875 ]
  %946 = phi i8 [ %914, %928 ], [ %914, %924 ], [ %914, %916 ], [ %914, %904 ], [ 0, %875 ]
  %947 = load i32, ptr %151, align 8, !tbaa !81
  %948 = and i32 %947, 128
  %949 = icmp eq i32 %948, 0
  br i1 %949, label %956, label %950

950:                                              ; preds = %935
  %951 = sext i16 %942 to i32
  %952 = icmp sgt i16 %942, 0
  br i1 %952, label %953, label %976

953:                                              ; preds = %950
  %954 = getelementptr inbounds nuw i8, ptr %186, i64 8
  %955 = zext nneg i32 %951 to i64
  br label %966

956:                                              ; preds = %935
  %957 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 137, i32 noundef %938, i32 noundef %751)
  %958 = icmp eq i32 %944, 0
  br i1 %958, label %959, label %963

959:                                              ; preds = %956
  %960 = load i32, ptr %704, align 4, !tbaa !122
  %961 = add i32 %960, 1
  store i32 %961, ptr %704, align 4, !tbaa !122
  store i32 %961, ptr %707, align 4, !tbaa !6
  %962 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 130, i32 noundef %939, i32 noundef %755, i32 noundef %751)
  br label %991

963:                                              ; preds = %956
  %964 = icmp eq i32 %940, 0
  br i1 %964, label %991, label %965

965:                                              ; preds = %963
  call fastcc void @sqlite3VdbeChangeToNoop(ptr noundef nonnull %251, i32 noundef %940)
  br label %991

966:                                              ; preds = %966, %953
  %967 = phi i64 [ %974, %966 ], [ 0, %953 ]
  %968 = load ptr, ptr %954, align 8, !tbaa !124
  %969 = getelementptr inbounds nuw [2 x i8], ptr %968, i64 %967
  %970 = load i16, ptr %969, align 2, !tbaa !125
  %971 = sext i16 %970 to i32
  %972 = trunc nuw nsw i64 %967 to i32
  %973 = add i32 %941, %972
  call fastcc void @sqlite3ExprCodeGetColumnOfTable(ptr noundef nonnull %251, ptr noundef nonnull %21, i32 noundef %938, i32 noundef %971, i32 noundef %973)
  %974 = add nuw nsw i64 %967, 1
  %975 = icmp eq i64 %974, %955
  br i1 %975, label %976, label %966, !llvm.loop !68

976:                                              ; preds = %966, %950
  %977 = icmp eq i32 %944, 0
  br i1 %977, label %981, label %978

978:                                              ; preds = %976
  %979 = icmp eq i32 %940, 0
  br i1 %979, label %991, label %980

980:                                              ; preds = %978
  call fastcc void @sqlite3VdbeChangeToNoop(ptr noundef nonnull %251, i32 noundef %940)
  br label %991

981:                                              ; preds = %976
  %982 = getelementptr inbounds nuw i8, ptr %186, i64 32
  %983 = load ptr, ptr %982, align 8, !tbaa !136
  %984 = icmp eq ptr %983, null
  br i1 %984, label %985, label %987

985:                                              ; preds = %981
  %986 = call fastcc ptr @computeIndexAffStr(ptr noundef nonnull %15, ptr noundef nonnull %186)
  br label %987

987:                                              ; preds = %985, %981
  %988 = phi ptr [ %986, %985 ], [ %983, %981 ]
  %989 = call fastcc i32 @sqlite3VdbeAddOp4(ptr noundef nonnull %251, i32 noundef 99, i32 noundef %941, i32 noundef %951, i32 noundef %943, ptr noundef %988, i32 noundef %951)
  %990 = call fastcc i32 @sqlite3VdbeAddOp4Int(ptr noundef nonnull %251, i32 noundef 140, i32 noundef %939, i32 noundef %943, i32 noundef %941, i32 noundef %951)
  br label %991

991:                                              ; preds = %987, %980, %978, %965, %963, %959, %863
  %992 = phi i32 [ %936, %987 ], [ %936, %980 ], [ %936, %978 ], [ %936, %965 ], [ %936, %963 ], [ %936, %959 ], [ undef, %863 ]
  %993 = phi i32 [ %937, %987 ], [ %937, %980 ], [ %937, %978 ], [ %937, %965 ], [ %937, %963 ], [ %937, %959 ], [ undef, %863 ]
  %994 = phi i1 [ false, %987 ], [ false, %980 ], [ false, %978 ], [ false, %965 ], [ false, %963 ], [ false, %959 ], [ true, %863 ]
  %995 = phi i16 [ %942, %987 ], [ %942, %980 ], [ %942, %978 ], [ %942, %965 ], [ %942, %963 ], [ %942, %959 ], [ %865, %863 ]
  %996 = phi i32 [ %941, %987 ], [ %941, %980 ], [ %941, %978 ], [ %941, %965 ], [ %941, %963 ], [ %941, %959 ], [ %866, %863 ]
  %997 = phi i32 [ %939, %987 ], [ %939, %980 ], [ %939, %978 ], [ %939, %965 ], [ %939, %963 ], [ %939, %959 ], [ %867, %863 ]
  %998 = phi i32 [ %938, %987 ], [ %938, %980 ], [ %938, %978 ], [ %938, %965 ], [ %938, %963 ], [ %938, %959 ], [ %868, %863 ]
  %999 = phi i32 [ 0, %987 ], [ %944, %980 ], [ %944, %978 ], [ %944, %965 ], [ %944, %963 ], [ 0, %959 ], [ 0, %863 ]
  %1000 = phi ptr [ %945, %987 ], [ %945, %980 ], [ %945, %978 ], [ %945, %965 ], [ %945, %963 ], [ %945, %959 ], [ null, %863 ]
  %1001 = phi i32 [ 0, %987 ], [ %951, %980 ], [ %951, %978 ], [ 0, %965 ], [ 0, %963 ], [ 0, %959 ], [ %864, %863 ]
  %1002 = phi i8 [ %946, %987 ], [ %946, %980 ], [ %946, %978 ], [ %946, %965 ], [ %946, %963 ], [ %946, %959 ], [ 1, %863 ]
  %1003 = phi i32 [ %943, %987 ], [ %941, %980 ], [ %941, %978 ], [ %943, %965 ], [ %943, %963 ], [ %943, %959 ], [ %866, %863 ]
  %1004 = zext nneg i8 %1002 to i32
  br i1 %190, label %1005, label %1108

1005:                                             ; preds = %991
  %1006 = icmp ne i32 %999, 2
  %1007 = select i1 %775, i1 %1006, i1 false
  br i1 %1007, label %1008, label %1009

1008:                                             ; preds = %1005
  call fastcc void @sqlite3WhereEnd(ptr noundef %1000)
  br label %1009

1009:                                             ; preds = %1008, %1005
  br i1 %129, label %1056, label %1010

1010:                                             ; preds = %1009
  call void @llvm.lifetime.start.p0(ptr %13)
  store i32 0, ptr %13, align 4, !tbaa !6
  call void @llvm.lifetime.start.p0(ptr %14)
  store i32 0, ptr %14, align 4, !tbaa !6
  %1011 = icmp eq i32 %999, 0
  br i1 %1011, label %1030, label %1012

1012:                                             ; preds = %1010
  %1013 = icmp sgt i32 %993, -1
  br i1 %1013, label %1014, label %1018

1014:                                             ; preds = %1012
  %1015 = sub i32 %993, %149
  %1016 = sext i32 %1015 to i64
  %1017 = getelementptr inbounds i8, ptr %217, i64 %1016
  store i8 0, ptr %1017, align 1, !tbaa !62
  br label %1018

1018:                                             ; preds = %1014, %1012
  %1019 = icmp sgt i32 %992, -1
  br i1 %1019, label %1020, label %1024

1020:                                             ; preds = %1018
  %1021 = sub i32 %992, %149
  %1022 = sext i32 %1021 to i64
  %1023 = getelementptr inbounds i8, ptr %217, i64 %1022
  store i8 0, ptr %1023, align 1, !tbaa !62
  br label %1024

1024:                                             ; preds = %1020, %1018
  %1025 = icmp eq i32 %999, 2
  br i1 %1025, label %1026, label %1030

1026:                                             ; preds = %1024
  %1027 = sext i1 %1019 to i32
  %1028 = add i32 %188, %1027
  %1029 = icmp sgt i32 %1028, 0
  br i1 %1029, label %1032, label %1030

1030:                                             ; preds = %1026, %1024, %1010
  %1031 = call fastcc i32 @sqlite3OpenTableAndIndices(ptr noundef nonnull %0, ptr noundef nonnull %21, i32 noundef 116, i8 noundef zeroext 0, i32 noundef %149, ptr noundef nonnull %217, ptr noundef %13, ptr noundef %14)
  br label %1055

1032:                                             ; preds = %1026
  %1033 = call fastcc i32 @sqlite3VdbeAddOp0(ptr noundef nonnull %251, i32 noundef 15)
  %1034 = call fastcc i32 @sqlite3OpenTableAndIndices(ptr noundef nonnull %0, ptr noundef nonnull %21, i32 noundef 116, i8 noundef zeroext 0, i32 noundef %149, ptr noundef nonnull %217, ptr noundef %13, ptr noundef %14)
  %1035 = icmp eq i32 %1033, 0
  br i1 %1035, label %1055, label %1036

1036:                                             ; preds = %1032
  %1037 = getelementptr inbounds nuw i8, ptr %251, i64 144
  %1038 = load i32, ptr %1037, align 8, !tbaa !137
  %1039 = add i32 %1038, -1
  %1040 = icmp eq i32 %1033, %1039
  br i1 %1040, label %1041, label %1042

1041:                                             ; preds = %1036
  store i32 %1033, ptr %1037, align 8, !tbaa !137
  br label %1055

1042:                                             ; preds = %1036
  %1043 = load ptr, ptr %251, align 8, !tbaa !146
  %1044 = getelementptr inbounds nuw i8, ptr %1043, i64 103
  %1045 = load i8, ptr %1044, align 1, !tbaa !147
  %1046 = icmp eq i8 %1045, 0
  br i1 %1046, label %1047, label %1052

1047:                                             ; preds = %1042
  %1048 = getelementptr inbounds nuw i8, ptr %251, i64 136
  %1049 = load ptr, ptr %1048, align 8, !tbaa !148
  %1050 = sext i32 %1033 to i64
  %1051 = getelementptr inbounds [24 x i8], ptr %1049, i64 %1050
  br label %1052

1052:                                             ; preds = %1047, %1042
  %1053 = phi ptr [ %1051, %1047 ], [ @sqlite3VdbeGetOp.dummy, %1042 ]
  %1054 = getelementptr inbounds nuw i8, ptr %1053, i64 8
  store i32 %1038, ptr %1054, align 8, !tbaa !149
  br label %1055

1055:                                             ; preds = %1052, %1041, %1032, %1030
  call void @llvm.lifetime.end.p0(ptr %14)
  call void @llvm.lifetime.end.p0(ptr %13)
  br label %1056

1056:                                             ; preds = %1055, %1009
  %1057 = icmp eq i32 %999, 0
  br i1 %1057, label %1074, label %1058

1058:                                             ; preds = %1056
  %1059 = icmp eq i32 %993, %998
  %1060 = icmp eq i32 %992, %998
  %1061 = select i1 %1059, i1 true, i1 %1060
  br i1 %1061, label %1064, label %1062

1062:                                             ; preds = %1058
  %1063 = call fastcc i32 @sqlite3VdbeAddOp4Int(ptr noundef nonnull %251, i32 noundef 28, i32 noundef %998, i32 noundef %781, i32 noundef %1003, i32 noundef %1001)
  br label %1064

1064:                                             ; preds = %1062, %1058
  %1065 = icmp eq i32 %999, 1
  br i1 %1065, label %1069, label %1066

1066:                                             ; preds = %1064
  %1067 = load i32, ptr %779, align 4, !tbaa !129
  %1068 = add i32 %1067, -1
  store i32 %1068, ptr %779, align 4, !tbaa !129
  br label %1069

1069:                                             ; preds = %1066, %1064
  %1070 = phi i32 [ %1068, %1066 ], [ %781, %1064 ]
  %1071 = icmp eq ptr %186, null
  %1072 = select i1 %1071, i32 %751, i32 %1003
  %1073 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 51, i32 noundef %1072, i32 noundef %781)
  br label %1108

1074:                                             ; preds = %1056
  %1075 = icmp ne ptr %186, null
  %1076 = or i1 %1075, %994
  br i1 %1076, label %1077, label %1102

1077:                                             ; preds = %1074
  %1078 = load i32, ptr %779, align 4, !tbaa !129
  %1079 = add i32 %1078, -1
  store i32 %1079, ptr %779, align 4, !tbaa !129
  %1080 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 36, i32 noundef %997, i32 noundef %781)
  %1081 = getelementptr inbounds nuw i8, ptr %251, i64 144
  %1082 = load i32, ptr %1081, align 8, !tbaa !137
  br i1 %994, label %1083, label %1099

1083:                                             ; preds = %1077
  br i1 %129, label %1108, label %1084

1084:                                             ; preds = %1083
  br i1 %1075, label %1085, label %1096

1085:                                             ; preds = %1084
  %1086 = sext i16 %995 to i32
  %1087 = icmp sgt i16 %995, 0
  br i1 %1087, label %1088, label %1094

1088:                                             ; preds = %1088, %1085
  %1089 = phi i32 [ %1092, %1088 ], [ 0, %1085 ]
  %1090 = add i32 %1089, %996
  %1091 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 96, i32 noundef %997, i32 noundef %1089, i32 noundef %1090)
  %1092 = add nuw nsw i32 %1089, 1
  %1093 = icmp eq i32 %1092, %1086
  br i1 %1093, label %1094, label %1088, !llvm.loop !68

1094:                                             ; preds = %1088, %1085
  %1095 = call fastcc i32 @sqlite3VdbeAddOp4Int(ptr noundef nonnull %251, i32 noundef 28, i32 noundef %998, i32 noundef %1079, i32 noundef %996, i32 noundef %1086)
  br label %1108

1096:                                             ; preds = %1084
  %1097 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 137, i32 noundef %997, i32 noundef %751)
  %1098 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 31, i32 noundef %998, i32 noundef %1079, i32 noundef %751)
  br label %1108

1099:                                             ; preds = %1077
  %1100 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 136, i32 noundef %997, i32 noundef %1003)
  %1101 = call fastcc i32 @sqlite3VdbeAddOp4Int(ptr noundef nonnull %251, i32 noundef 28, i32 noundef %998, i32 noundef %1079, i32 noundef %1003, i32 noundef 0)
  br label %1108

1102:                                             ; preds = %1074
  %1103 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 36, i32 noundef %997, i32 noundef %781)
  %1104 = load i32, ptr %779, align 4, !tbaa !129
  %1105 = add i32 %1104, -1
  store i32 %1105, ptr %779, align 4, !tbaa !129
  %1106 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 137, i32 noundef %997, i32 noundef %751)
  %1107 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 31, i32 noundef %998, i32 noundef %1105, i32 noundef %751)
  br label %1108

1108:                                             ; preds = %1102, %1099, %1096, %1094, %1083, %1069, %991
  %1109 = phi i32 [ %1105, %1102 ], [ %1079, %1099 ], [ %1079, %1096 ], [ %1079, %1094 ], [ %1079, %1083 ], [ %1070, %1069 ], [ %781, %991 ]
  %1110 = phi i32 [ %1106, %1102 ], [ %1082, %1099 ], [ %1082, %1096 ], [ %1082, %1094 ], [ %1082, %1083 ], [ 0, %1069 ], [ 0, %991 ]
  %1111 = icmp eq i8 %514, 0
  br i1 %1111, label %1118, label %1112

1112:                                             ; preds = %1108
  br i1 %775, label %1113, label %1114

1113:                                             ; preds = %1112
  call fastcc void @sqlite3ExprCode(ptr noundef nonnull %0, ptr noundef %515, i32 noundef %752)
  br label %1116

1114:                                             ; preds = %1112
  %1115 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 96, i32 noundef %997, i32 noundef %516, i32 noundef %752)
  br label %1116

1116:                                             ; preds = %1114, %1113
  %1117 = call fastcc i32 @sqlite3VdbeAddOp1(ptr noundef nonnull %251, i32 noundef 13, i32 noundef %752)
  br label %1118

1118:                                             ; preds = %1116, %1108
  %1119 = icmp ne i8 %513, 0
  %1120 = select i1 %1119, i1 true, i1 %720
  %1121 = or i1 %719, %1120
  br i1 %1121, label %1122, label %1333

1122:                                             ; preds = %1118
  br i1 %720, label %1123, label %1125

1123:                                             ; preds = %1122
  %1124 = call fastcc i32 @sqlite3FkOldmask(ptr noundef nonnull %0, ptr noundef %21)
  br label %1125

1125:                                             ; preds = %1123, %1122
  %1126 = phi i32 [ %1124, %1123 ], [ 0, %1122 ]
  %1127 = call fastcc i32 @sqlite3TriggerColmask(ptr noundef nonnull %0, ptr noundef %126, ptr noundef nonnull %2, i32 noundef 0, i32 noundef 3, ptr noundef %21, i32 noundef %4)
  %1128 = or i32 %1127, %1126
  %1129 = load i16, ptr %200, align 2, !tbaa !79
  %1130 = icmp sgt i16 %1129, 0
  br i1 %1130, label %1131, label %1328

1131:                                             ; preds = %1125
  %1132 = getelementptr inbounds nuw i8, ptr %21, i64 8
  %1133 = getelementptr inbounds nuw i8, ptr %21, i64 56
  %1134 = icmp eq i32 %1128, -1
  br label %1135

1135:                                             ; preds = %1323, %1131
  %1136 = phi i64 [ %1324, %1323 ], [ 0, %1131 ]
  %1137 = load ptr, ptr %1132, align 8, !tbaa !101
  %1138 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1136
  %1139 = getelementptr inbounds nuw i8, ptr %1138, i64 14
  %1140 = load i16, ptr %1139, align 2, !tbaa !106
  %1141 = trunc nuw nsw i64 %1136 to i32
  %1142 = trunc i64 %1136 to i16
  %1143 = load i32, ptr %151, align 8, !tbaa !81
  %1144 = and i32 %1143, 32
  %1145 = icmp eq i32 %1144, 0
  %1146 = shl i64 %1136, 16
  %1147 = ashr exact i64 %1146, 16
  %1148 = icmp slt i16 %1142, 0
  %1149 = or i1 %1148, %1145
  br i1 %1149, label %1304, label %1150

1150:                                             ; preds = %1135
  %1151 = icmp eq i16 %1142, 0
  br i1 %1151, label %1293, label %1152

1152:                                             ; preds = %1150
  %1153 = icmp ult i64 %1136, 5
  br i1 %1153, label %1278, label %1154

1154:                                             ; preds = %1152
  %1155 = icmp ult i64 %1136, 17
  br i1 %1155, label %1243, label %1156

1156:                                             ; preds = %1154
  %1157 = and i64 %1136, 15
  %1158 = icmp eq i64 %1157, 0
  %1159 = select i1 %1158, i64 16, i64 %1157
  %1160 = sub nsw i64 %1136, %1159
  br label %1161

1161:                                             ; preds = %1161, %1156
  %1162 = phi i64 [ %1237, %1161 ], [ 0, %1156 ]
  %1163 = phi <8 x i16> [ %1235, %1161 ], [ zeroinitializer, %1156 ]
  %1164 = phi <8 x i16> [ %1236, %1161 ], [ zeroinitializer, %1156 ]
  %1165 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1166 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1167 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1168 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1169 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1170 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1171 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1172 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1173 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1174 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1175 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1176 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1177 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1178 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1179 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1180 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1162
  %1181 = getelementptr inbounds nuw i8, ptr %1165, i64 14
  %1182 = getelementptr inbounds nuw i8, ptr %1166, i64 30
  %1183 = getelementptr inbounds nuw i8, ptr %1167, i64 46
  %1184 = getelementptr inbounds nuw i8, ptr %1168, i64 62
  %1185 = getelementptr inbounds nuw i8, ptr %1169, i64 78
  %1186 = getelementptr inbounds nuw i8, ptr %1170, i64 94
  %1187 = getelementptr inbounds nuw i8, ptr %1171, i64 110
  %1188 = getelementptr inbounds nuw i8, ptr %1172, i64 126
  %1189 = getelementptr inbounds nuw i8, ptr %1173, i64 142
  %1190 = getelementptr inbounds nuw i8, ptr %1174, i64 158
  %1191 = getelementptr inbounds nuw i8, ptr %1175, i64 174
  %1192 = getelementptr inbounds nuw i8, ptr %1176, i64 190
  %1193 = getelementptr inbounds nuw i8, ptr %1177, i64 206
  %1194 = getelementptr inbounds nuw i8, ptr %1178, i64 222
  %1195 = getelementptr inbounds nuw i8, ptr %1179, i64 238
  %1196 = getelementptr inbounds nuw i8, ptr %1180, i64 254
  %1197 = load i16, ptr %1181, align 2, !tbaa !106
  %1198 = load i16, ptr %1182, align 2, !tbaa !106
  %1199 = load i16, ptr %1183, align 2, !tbaa !106
  %1200 = load i16, ptr %1184, align 2, !tbaa !106
  %1201 = load i16, ptr %1185, align 2, !tbaa !106
  %1202 = load i16, ptr %1186, align 2, !tbaa !106
  %1203 = load i16, ptr %1187, align 2, !tbaa !106
  %1204 = load i16, ptr %1188, align 2, !tbaa !106
  %1205 = insertelement <8 x i16> poison, i16 %1197, i64 0
  %1206 = insertelement <8 x i16> %1205, i16 %1198, i64 1
  %1207 = insertelement <8 x i16> %1206, i16 %1199, i64 2
  %1208 = insertelement <8 x i16> %1207, i16 %1200, i64 3
  %1209 = insertelement <8 x i16> %1208, i16 %1201, i64 4
  %1210 = insertelement <8 x i16> %1209, i16 %1202, i64 5
  %1211 = insertelement <8 x i16> %1210, i16 %1203, i64 6
  %1212 = insertelement <8 x i16> %1211, i16 %1204, i64 7
  %1213 = load i16, ptr %1189, align 2, !tbaa !106
  %1214 = load i16, ptr %1190, align 2, !tbaa !106
  %1215 = load i16, ptr %1191, align 2, !tbaa !106
  %1216 = load i16, ptr %1192, align 2, !tbaa !106
  %1217 = load i16, ptr %1193, align 2, !tbaa !106
  %1218 = load i16, ptr %1194, align 2, !tbaa !106
  %1219 = load i16, ptr %1195, align 2, !tbaa !106
  %1220 = load i16, ptr %1196, align 2, !tbaa !106
  %1221 = insertelement <8 x i16> poison, i16 %1213, i64 0
  %1222 = insertelement <8 x i16> %1221, i16 %1214, i64 1
  %1223 = insertelement <8 x i16> %1222, i16 %1215, i64 2
  %1224 = insertelement <8 x i16> %1223, i16 %1216, i64 3
  %1225 = insertelement <8 x i16> %1224, i16 %1217, i64 4
  %1226 = insertelement <8 x i16> %1225, i16 %1218, i64 5
  %1227 = insertelement <8 x i16> %1226, i16 %1219, i64 6
  %1228 = insertelement <8 x i16> %1227, i16 %1220, i64 7
  %1229 = lshr <8 x i16> %1212, splat (i16 5)
  %1230 = lshr <8 x i16> %1228, splat (i16 5)
  %1231 = and <8 x i16> %1229, splat (i16 1)
  %1232 = and <8 x i16> %1230, splat (i16 1)
  %1233 = xor <8 x i16> %1231, splat (i16 1)
  %1234 = xor <8 x i16> %1232, splat (i16 1)
  %1235 = add <8 x i16> %1233, %1163
  %1236 = add <8 x i16> %1234, %1164
  %1237 = add nuw i64 %1162, 16
  %1238 = icmp eq i64 %1237, %1160
  br i1 %1238, label %1239, label %1161, !llvm.loop !151

1239:                                             ; preds = %1161
  %1240 = add <8 x i16> %1236, %1235
  %1241 = call i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %1240)
  %1242 = icmp ult i64 %1159, 5
  br i1 %1242, label %1278, label %1243, !prof !154

1243:                                             ; preds = %1239, %1154
  %1244 = phi i64 [ %1160, %1239 ], [ 0, %1154 ]
  %1245 = phi i16 [ %1241, %1239 ], [ 0, %1154 ]
  %1246 = and i64 %1136, 3
  %1247 = icmp eq i64 %1246, 0
  %1248 = select i1 %1247, i64 4, i64 %1246
  %1249 = sub nsw i64 %1136, %1248
  %1250 = insertelement <4 x i16> <i16 poison, i16 0, i16 0, i16 0>, i16 %1245, i64 0
  br label %1251

1251:                                             ; preds = %1251, %1243
  %1252 = phi i64 [ %1274, %1251 ], [ %1244, %1243 ]
  %1253 = phi <4 x i16> [ %1273, %1251 ], [ %1250, %1243 ]
  %1254 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1252
  %1255 = getelementptr [16 x i8], ptr %1137, i64 %1252
  %1256 = getelementptr [16 x i8], ptr %1137, i64 %1252
  %1257 = getelementptr [16 x i8], ptr %1137, i64 %1252
  %1258 = getelementptr inbounds nuw i8, ptr %1254, i64 14
  %1259 = getelementptr i8, ptr %1255, i64 30
  %1260 = getelementptr i8, ptr %1256, i64 46
  %1261 = getelementptr i8, ptr %1257, i64 62
  %1262 = load i16, ptr %1258, align 2, !tbaa !106
  %1263 = load i16, ptr %1259, align 2, !tbaa !106
  %1264 = load i16, ptr %1260, align 2, !tbaa !106
  %1265 = load i16, ptr %1261, align 2, !tbaa !106
  %1266 = insertelement <4 x i16> poison, i16 %1262, i64 0
  %1267 = insertelement <4 x i16> %1266, i16 %1263, i64 1
  %1268 = insertelement <4 x i16> %1267, i16 %1264, i64 2
  %1269 = insertelement <4 x i16> %1268, i16 %1265, i64 3
  %1270 = lshr <4 x i16> %1269, splat (i16 5)
  %1271 = and <4 x i16> %1270, splat (i16 1)
  %1272 = xor <4 x i16> %1271, splat (i16 1)
  %1273 = add <4 x i16> %1272, %1253
  %1274 = add nuw i64 %1252, 4
  %1275 = icmp eq i64 %1274, %1249
  br i1 %1275, label %1276, label %1251, !llvm.loop !151

1276:                                             ; preds = %1251
  %1277 = call i16 @llvm.vector.reduce.add.v4i16(<4 x i16> %1273)
  br label %1278

1278:                                             ; preds = %1276, %1239, %1152
  %1279 = phi i64 [ %1249, %1276 ], [ %1160, %1239 ], [ 0, %1152 ]
  %1280 = phi i16 [ %1277, %1276 ], [ %1241, %1239 ], [ 0, %1152 ]
  br label %1281

1281:                                             ; preds = %1281, %1278
  %1282 = phi i64 [ %1291, %1281 ], [ %1279, %1278 ]
  %1283 = phi i16 [ %1290, %1281 ], [ %1280, %1278 ]
  %1284 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1282
  %1285 = getelementptr inbounds nuw i8, ptr %1284, i64 14
  %1286 = load i16, ptr %1285, align 2, !tbaa !106
  %1287 = lshr i16 %1286, 5
  %1288 = and i16 %1287, 1
  %1289 = xor i16 %1288, 1
  %1290 = add i16 %1289, %1283
  %1291 = add nuw nsw i64 %1282, 1
  %1292 = icmp eq i64 %1291, %1147
  br i1 %1292, label %1293, label %1281, !llvm.loop !151

1293:                                             ; preds = %1281, %1150
  %1294 = phi i16 [ %1290, %1281 ], [ 0, %1150 ]
  %1295 = getelementptr inbounds nuw [16 x i8], ptr %1137, i64 %1147
  %1296 = getelementptr inbounds nuw i8, ptr %1295, i64 14
  %1297 = load i16, ptr %1296, align 2, !tbaa !106
  %1298 = and i16 %1297, 32
  %1299 = icmp eq i16 %1298, 0
  br i1 %1299, label %1304, label %1300

1300:                                             ; preds = %1293
  %1301 = load i16, ptr %1133, align 8, !tbaa !155
  %1302 = sub i16 %1142, %1294
  %1303 = add i16 %1302, %1301
  br label %1304

1304:                                             ; preds = %1300, %1293, %1135
  %1305 = phi i16 [ %1303, %1300 ], [ %1294, %1293 ], [ %1142, %1135 ]
  %1306 = sext i16 %1305 to i32
  %1307 = add i32 %754, %1306
  br i1 %1134, label %1320, label %1308

1308:                                             ; preds = %1304
  %1309 = icmp ult i64 %1136, 32
  br i1 %1309, label %1310, label %1317

1310:                                             ; preds = %1308
  %1311 = shl nuw i32 1, %1141
  %1312 = and i32 %1311, %1128
  %1313 = icmp eq i32 %1312, 0
  %1314 = and i16 %1140, 1
  %1315 = icmp eq i16 %1314, 0
  %1316 = select i1 %1313, i1 %1315, i1 false
  br i1 %1316, label %1321, label %1320

1317:                                             ; preds = %1308
  %1318 = and i16 %1140, 1
  %1319 = icmp eq i16 %1318, 0
  br i1 %1319, label %1321, label %1320

1320:                                             ; preds = %1317, %1310, %1304
  call fastcc void @sqlite3ExprCodeGetColumnOfTable(ptr noundef nonnull %251, ptr noundef nonnull %21, i32 noundef %998, i32 noundef %1141, i32 noundef %1307)
  br label %1323

1321:                                             ; preds = %1317, %1310
  %1322 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 77, i32 noundef 0, i32 noundef %1307)
  br label %1323

1323:                                             ; preds = %1321, %1320
  %1324 = add nuw nsw i64 %1136, 1
  %1325 = load i16, ptr %200, align 2, !tbaa !79
  %1326 = sext i16 %1325 to i64
  %1327 = icmp slt i64 %1324, %1326
  br i1 %1327, label %1135, label %1328, !llvm.loop !68

1328:                                             ; preds = %1323, %1125
  %1329 = icmp eq ptr %186, null
  %1330 = and i1 %1329, %1111
  br i1 %1330, label %1331, label %1333

1331:                                             ; preds = %1328
  %1332 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 82, i32 noundef %751, i32 noundef %752)
  br label %1333

1333:                                             ; preds = %1331, %1328, %1118
  %1334 = call fastcc i32 @sqlite3TriggerColmask(ptr noundef nonnull %0, ptr noundef %126, ptr noundef nonnull %2, i32 noundef 1, i32 noundef 1, ptr noundef %21, i32 noundef %4)
  %1335 = load i16, ptr %200, align 2, !tbaa !79
  %1336 = icmp sgt i16 %1335, 0
  br i1 %1336, label %1337, label %1419

1337:                                             ; preds = %1333
  %1338 = zext nneg i16 %1335 to i32
  %1339 = getelementptr inbounds nuw i8, ptr %21, i64 52
  %1340 = getelementptr inbounds nuw i8, ptr %21, i64 8
  %1341 = load i32, ptr %11, align 4
  %1342 = and i32 %1341, 1
  %1343 = icmp eq i32 %1342, 0
  %1344 = getelementptr inbounds nuw i8, ptr %2, i64 8
  %1345 = sext i16 %995 to i32
  %1346 = getelementptr inbounds nuw i8, ptr %251, i64 144
  %1347 = getelementptr inbounds nuw i8, ptr %251, i64 148
  %1348 = getelementptr inbounds nuw i8, ptr %251, i64 136
  br label %1349

1349:                                             ; preds = %1410, %1337
  %1350 = phi i64 [ %1413, %1410 ], [ 0, %1337 ]
  %1351 = phi i32 [ %1416, %1410 ], [ %1338, %1337 ]
  %1352 = phi i32 [ %1414, %1410 ], [ %753, %1337 ]
  %1353 = phi i32 [ %1411, %1410 ], [ %1004, %1337 ]
  %1354 = load i16, ptr %1339, align 4, !tbaa !105
  %1355 = sext i16 %1354 to i64
  %1356 = icmp eq i64 %1350, %1355
  br i1 %1356, label %1357, label %1374

1357:                                             ; preds = %1349
  %1358 = load i32, ptr %1346, align 8, !tbaa !137
  %1359 = load i32, ptr %1347, align 4, !tbaa !156
  %1360 = icmp sgt i32 %1359, %1358
  br i1 %1360, label %1363, label %1361

1361:                                             ; preds = %1357
  %1362 = call fastcc i32 @growOp3(ptr noundef nonnull %251, i32 noundef 77, i32 noundef 0, i32 noundef %1352, i32 noundef 0)
  br label %1410

1363:                                             ; preds = %1357
  %1364 = add nsw i32 %1358, 1
  store i32 %1364, ptr %1346, align 8, !tbaa !137
  %1365 = load ptr, ptr %1348, align 8, !tbaa !148
  %1366 = sext i32 %1358 to i64
  %1367 = getelementptr inbounds [24 x i8], ptr %1365, i64 %1366
  store i8 77, ptr %1367, align 8, !tbaa !157
  %1368 = getelementptr inbounds nuw i8, ptr %1367, i64 2
  store i16 0, ptr %1368, align 2, !tbaa !158
  %1369 = getelementptr inbounds nuw i8, ptr %1367, i64 4
  store i32 0, ptr %1369, align 4, !tbaa !159
  %1370 = getelementptr inbounds nuw i8, ptr %1367, i64 8
  store i32 %1352, ptr %1370, align 8, !tbaa !149
  %1371 = getelementptr inbounds nuw i8, ptr %1367, i64 12
  store i32 0, ptr %1371, align 4, !tbaa !160
  %1372 = getelementptr inbounds nuw i8, ptr %1367, i64 16
  store ptr null, ptr %1372, align 8, !tbaa !62
  %1373 = getelementptr inbounds nuw i8, ptr %1367, i64 1
  store i8 0, ptr %1373, align 1, !tbaa !161
  br label %1410

1374:                                             ; preds = %1349
  %1375 = load ptr, ptr %1340, align 8, !tbaa !101
  %1376 = getelementptr inbounds nuw [16 x i8], ptr %1375, i64 %1350
  %1377 = getelementptr inbounds nuw i8, ptr %1376, i64 14
  %1378 = load i16, ptr %1377, align 2, !tbaa !106
  %1379 = zext i16 %1378 to i32
  %1380 = and i32 %1379, 96
  %1381 = icmp eq i32 %1380, 0
  br i1 %1381, label %1386, label %1382

1382:                                             ; preds = %1374
  %1383 = shl i32 %1379, 26
  %1384 = ashr i32 %1383, 31
  %1385 = add i32 %1384, %1352
  br label %1410

1386:                                             ; preds = %1374
  %1387 = getelementptr inbounds nuw [4 x i8], ptr %210, i64 %1350
  %1388 = load i32, ptr %1387, align 4, !tbaa !6
  %1389 = icmp sgt i32 %1388, -1
  br i1 %1389, label %1390, label %1399

1390:                                             ; preds = %1386
  br i1 %994, label %1391, label %1395

1391:                                             ; preds = %1390
  %1392 = select i1 %129, i32 %1351, i32 %1345
  %1393 = add i32 %1388, %1392
  %1394 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 96, i32 noundef %997, i32 noundef %1393, i32 noundef %1352)
  br label %1410

1395:                                             ; preds = %1390
  %1396 = zext nneg i32 %1388 to i64
  %1397 = getelementptr inbounds nuw [24 x i8], ptr %1344, i64 %1396
  %1398 = load ptr, ptr %1397, align 8, !tbaa !97
  call fastcc void @sqlite3ExprCode(ptr noundef nonnull %0, ptr noundef %1398, i32 noundef %1352)
  br label %1410

1399:                                             ; preds = %1386
  %1400 = icmp ugt i64 %1350, 31
  %1401 = select i1 %1343, i1 true, i1 %1400
  %1402 = trunc nuw nsw i64 %1350 to i32
  br i1 %1401, label %1407, label %1403

1403:                                             ; preds = %1399
  %1404 = shl nuw i32 1, %1402
  %1405 = and i32 %1404, %1334
  %1406 = icmp eq i32 %1405, 0
  br i1 %1406, label %1408, label %1407

1407:                                             ; preds = %1403, %1399
  call fastcc void @sqlite3ExprCodeGetColumnOfTable(ptr noundef nonnull %251, ptr noundef nonnull %21, i32 noundef %998, i32 noundef %1402, i32 noundef %1352)
  br label %1410

1408:                                             ; preds = %1403
  %1409 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 77, i32 noundef 0, i32 noundef %1352)
  br label %1410

1410:                                             ; preds = %1408, %1407, %1395, %1391, %1382, %1363, %1361
  %1411 = phi i32 [ %1353, %1408 ], [ 0, %1407 ], [ %1353, %1395 ], [ %1353, %1391 ], [ %1353, %1382 ], [ %1353, %1363 ], [ %1353, %1361 ]
  %1412 = phi i32 [ %1352, %1408 ], [ %1352, %1407 ], [ %1352, %1395 ], [ %1352, %1391 ], [ %1385, %1382 ], [ %1352, %1363 ], [ %1352, %1361 ]
  %1413 = add nuw nsw i64 %1350, 1
  %1414 = add i32 %1412, 1
  %1415 = load i16, ptr %200, align 2, !tbaa !79
  %1416 = sext i16 %1415 to i32
  %1417 = sext i16 %1415 to i64
  %1418 = icmp slt i64 %1413, %1417
  br i1 %1418, label %1349, label %1419, !llvm.loop !68

1419:                                             ; preds = %1410, %1333
  %1420 = phi i32 [ %1411, %1410 ], [ %1004, %1333 ]
  %1421 = load i32, ptr %151, align 8, !tbaa !81
  %1422 = and i32 %1421, 96
  %1423 = icmp eq i32 %1422, 0
  br i1 %1423, label %1425, label %1424

1424:                                             ; preds = %1419
  call fastcc void @sqlite3ComputeGeneratedColumns(ptr noundef nonnull %0, i32 noundef %753, ptr noundef %21)
  br label %1425

1425:                                             ; preds = %1424, %1419
  %1426 = load i32, ptr %11, align 4, !tbaa !6
  %1427 = and i32 %1426, 1
  %1428 = icmp eq i32 %1427, 0
  br i1 %1428, label %1480, label %1429

1429:                                             ; preds = %1425
  call fastcc void @sqlite3TableAffinity(ptr noundef nonnull %251, ptr noundef %21, i32 noundef %753)
  call fastcc void @sqlite3CodeRowTrigger(ptr noundef nonnull %0, ptr noundef %126, i32 noundef 130, ptr noundef nonnull %2, i32 noundef 1, ptr noundef %21, i32 noundef %751, i32 noundef %4, i32 noundef %1109)
  br i1 %129, label %1511, label %1430

1430:                                             ; preds = %1429
  %1431 = icmp eq ptr %186, null
  br i1 %1431, label %1434, label %1432

1432:                                             ; preds = %1430
  %1433 = call fastcc i32 @sqlite3VdbeAddOp4Int(ptr noundef nonnull %251, i32 noundef 28, i32 noundef %998, i32 noundef %1109, i32 noundef %1003, i32 noundef %1001)
  br label %1436

1434:                                             ; preds = %1430
  %1435 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 31, i32 noundef %998, i32 noundef %1109, i32 noundef %751)
  br label %1436

1436:                                             ; preds = %1434, %1432
  %1437 = load i16, ptr %200, align 2, !tbaa !79
  %1438 = icmp sgt i16 %1437, 0
  br i1 %1438, label %1439, label %1475

1439:                                             ; preds = %1436
  %1440 = getelementptr inbounds nuw i8, ptr %21, i64 8
  %1441 = getelementptr inbounds nuw i8, ptr %21, i64 52
  br label %1442

1442:                                             ; preds = %1468, %1439
  %1443 = phi i16 [ %1469, %1468 ], [ %1437, %1439 ]
  %1444 = phi i64 [ %1471, %1468 ], [ 0, %1439 ]
  %1445 = phi i32 [ %1472, %1468 ], [ %753, %1439 ]
  %1446 = load ptr, ptr %1440, align 8, !tbaa !101
  %1447 = getelementptr inbounds nuw [16 x i8], ptr %1446, i64 %1444
  %1448 = getelementptr inbounds nuw i8, ptr %1447, i64 14
  %1449 = load i16, ptr %1448, align 2, !tbaa !106
  %1450 = zext i16 %1449 to i32
  %1451 = and i32 %1450, 96
  %1452 = icmp eq i32 %1451, 0
  br i1 %1452, label %1457, label %1453

1453:                                             ; preds = %1442
  %1454 = shl i32 %1450, 26
  %1455 = ashr i32 %1454, 31
  %1456 = add i32 %1455, %1445
  br label %1468

1457:                                             ; preds = %1442
  %1458 = getelementptr inbounds nuw [4 x i8], ptr %210, i64 %1444
  %1459 = load i32, ptr %1458, align 4, !tbaa !6
  %1460 = icmp slt i32 %1459, 0
  br i1 %1460, label %1461, label %1468

1461:                                             ; preds = %1457
  %1462 = load i16, ptr %1441, align 4, !tbaa !105
  %1463 = sext i16 %1462 to i64
  %1464 = icmp eq i64 %1444, %1463
  br i1 %1464, label %1468, label %1465

1465:                                             ; preds = %1461
  %1466 = trunc nuw nsw i64 %1444 to i32
  call fastcc void @sqlite3ExprCodeGetColumnOfTable(ptr noundef nonnull %251, ptr noundef nonnull %21, i32 noundef %998, i32 noundef %1466, i32 noundef %1445)
  %1467 = load i16, ptr %200, align 2, !tbaa !79
  br label %1468

1468:                                             ; preds = %1465, %1461, %1457, %1453
  %1469 = phi i16 [ %1467, %1465 ], [ %1443, %1461 ], [ %1443, %1457 ], [ %1443, %1453 ]
  %1470 = phi i32 [ %1445, %1465 ], [ %1445, %1461 ], [ %1445, %1457 ], [ %1456, %1453 ]
  %1471 = add nuw nsw i64 %1444, 1
  %1472 = add i32 %1470, 1
  %1473 = sext i16 %1469 to i64
  %1474 = icmp slt i64 %1471, %1473
  br i1 %1474, label %1442, label %1475, !llvm.loop !68

1475:                                             ; preds = %1468, %1436
  %1476 = load i32, ptr %151, align 8, !tbaa !81
  %1477 = and i32 %1476, 96
  %1478 = icmp eq i32 %1477, 0
  br i1 %1478, label %1480, label %1479

1479:                                             ; preds = %1475
  call fastcc void @sqlite3ComputeGeneratedColumns(ptr noundef nonnull %0, i32 noundef %753, ptr noundef %21)
  br label %1480

1480:                                             ; preds = %1479, %1475, %1425
  br i1 %129, label %1511, label %1481

1481:                                             ; preds = %1480
  %1482 = trunc i32 %4 to i8
  call fastcc void @sqlite3GenerateConstraintChecks(ptr noundef nonnull %0, ptr noundef %21, ptr noundef nonnull %215, i32 noundef %998, i32 noundef %197, i32 noundef %752, i32 noundef %751, i8 noundef zeroext %517, i8 noundef zeroext %1482, i32 noundef %1109, ptr noundef %12, ptr noundef nonnull %210, ptr noundef null)
  %1483 = load i32, ptr %12, align 4, !tbaa !6
  %1484 = icmp ne i32 %1483, 0
  %1485 = icmp ne i8 %517, 0
  %1486 = select i1 %1484, i1 true, i1 %1485
  br i1 %1486, label %1487, label %1493

1487:                                             ; preds = %1481
  %1488 = icmp eq ptr %186, null
  br i1 %1488, label %1491, label %1489

1489:                                             ; preds = %1487
  %1490 = call fastcc i32 @sqlite3VdbeAddOp4Int(ptr noundef nonnull %251, i32 noundef 28, i32 noundef %998, i32 noundef %1109, i32 noundef %1003, i32 noundef %1001)
  br label %1493

1491:                                             ; preds = %1487
  %1492 = call fastcc i32 @sqlite3VdbeAddOp3(ptr noundef nonnull %251, i32 noundef 31, i32 noundef %998, i32 noundef %1109, i32 noundef %751)
  br label %1493

1493:                                             ; preds = %1491, %1489, %1481
  br i1 %720, label %1494, label %1495

1494:                                             ; preds = %1493
  call fastcc void @sqlite3FkCheck(ptr noundef nonnull %0, ptr noundef %21, i32 noundef %751, i32 noundef 0, ptr noundef nonnull %210, i32 noundef %588)
  br label %1495

1495:                                             ; preds = %1494, %1493
  call fastcc void @sqlite3GenerateRowIndexDelete(ptr noundef nonnull %0, ptr noundef %21, i32 noundef %998, i32 noundef %197, ptr noundef nonnull %215, i32 noundef -1)
  %1496 = icmp eq i32 %1420, 0
  br i1 %1496, label %1499, label %1497

1497:                                             ; preds = %1495
  %1498 = call fastcc i32 @sqlite3VdbeAddOp1(ptr noundef nonnull %251, i32 noundef 145, i32 noundef %998)
  br label %1499

1499:                                             ; preds = %1497, %1495
  %1500 = icmp ugt i32 %589, 1
  %1501 = select i1 %1500, i1 true, i1 %1485
  br i1 %1501, label %1502, label %1504

1502:                                             ; preds = %1499
  %1503 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 132, i32 noundef %998, i32 noundef 0)
  br label %1504

1504:                                             ; preds = %1502, %1499
  br i1 %720, label %1505, label %1508

1505:                                             ; preds = %1504
  call fastcc void @sqlite3FkCheck(ptr noundef nonnull %0, ptr noundef %21, i32 noundef 0, i32 noundef %752, ptr noundef nonnull %210, i32 noundef %588)
  %1506 = icmp eq i32 %999, 2
  %1507 = select i1 %1506, i32 6, i32 4
  call fastcc void @sqlite3CompleteInsertion(ptr noundef nonnull %0, ptr noundef %21, i32 noundef %998, i32 noundef %197, i32 noundef %752, ptr noundef nonnull %215, i32 noundef %1507, i32 noundef 0, i32 noundef 0)
  call fastcc void @sqlite3FkActions(ptr noundef nonnull %0, ptr noundef %21, ptr noundef nonnull %2, i32 noundef %751, ptr noundef nonnull %210, i32 noundef %588)
  br label %1511

1508:                                             ; preds = %1504
  %1509 = icmp eq i32 %999, 2
  %1510 = select i1 %1509, i32 6, i32 4
  call fastcc void @sqlite3CompleteInsertion(ptr noundef nonnull %0, ptr noundef %21, i32 noundef %998, i32 noundef %197, i32 noundef %752, ptr noundef nonnull %215, i32 noundef %1510, i32 noundef 0, i32 noundef 0)
  br label %1511

1511:                                             ; preds = %1508, %1505, %1480, %1429
  %1512 = icmp eq i32 %804, 0
  br i1 %1512, label %1515, label %1513

1513:                                             ; preds = %1511
  %1514 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 88, i32 noundef %804, i32 noundef 1)
  br label %1515

1515:                                             ; preds = %1513, %1511
  br i1 %719, label %1516, label %1517

1516:                                             ; preds = %1515
  call fastcc void @sqlite3CodeRowTrigger(ptr noundef nonnull %0, ptr noundef nonnull %126, i32 noundef 130, ptr noundef nonnull %2, i32 noundef 2, ptr noundef %21, i32 noundef %751, i32 noundef %4, i32 noundef %1109)
  br label %1517

1517:                                             ; preds = %1516, %1515
  switch i32 %999, label %1519 [
    i32 1, label %1521
    i32 2, label %1518
  ]

1518:                                             ; preds = %1517
  call fastcc void @sqlite3VdbeResolveLabel(ptr noundef nonnull %251, i32 noundef %1109)
  call fastcc void @sqlite3WhereEnd(ptr noundef %1000)
  br label %1521

1519:                                             ; preds = %1517
  call fastcc void @sqlite3VdbeResolveLabel(ptr noundef nonnull %251, i32 noundef %1109)
  %1520 = call fastcc i32 @sqlite3VdbeAddOp2(ptr noundef nonnull %251, i32 noundef 40, i32 noundef %997, i32 noundef %1110)
  br label %1521

1521:                                             ; preds = %1519, %1518, %1517
  call fastcc void @sqlite3VdbeResolveLabel(ptr noundef nonnull %251, i32 noundef %781)
  %1522 = load i8, ptr %711, align 2, !tbaa !128
  %1523 = icmp eq i8 %1522, 0
  br i1 %1523, label %1524, label %1534

1524:                                             ; preds = %1521
  %1525 = getelementptr inbounds nuw i8, ptr %0, i64 168
  %1526 = load ptr, ptr %1525, align 8, !tbaa !131
  %1527 = icmp eq ptr %1526, null
  %1528 = and i1 %190, %1527
  br i1 %1528, label %1529, label %1534

1529:                                             ; preds = %1524
  %1530 = getelementptr inbounds nuw i8, ptr %0, i64 152
  %1531 = load ptr, ptr %1530, align 8, !tbaa !162
  %1532 = icmp eq ptr %1531, null
  br i1 %1532, label %1534, label %1533

1533:                                             ; preds = %1529
  call fastcc void @autoIncrementEnd(ptr noundef nonnull %0)
  br label %1534

1534:                                             ; preds = %1533, %1529, %1524, %1521
  br i1 %1512, label %1536, label %1535

1535:                                             ; preds = %1534
  call fastcc void @sqlite3CodeChangeCount(ptr noundef %251, i32 noundef %804, ptr noundef nonnull @.str.957)
  br label %1536

1536:                                             ; preds = %1535, %1534, %900, %777, %764
  %1537 = phi ptr [ %773, %1535 ], [ %773, %1534 ], [ %773, %900 ], [ %773, %777 ], [ %765, %764 ]
  %1538 = phi ptr [ %774, %1535 ], [ %774, %1534 ], [ %774, %900 ], [ %774, %777 ], [ %766, %764 ]
  %1539 = icmp eq ptr %1538, null
  br i1 %1539, label %1542, label %1540

1540:                                             ; preds = %1536
  %1541 = getelementptr inbounds nuw i8, ptr %1538, i64 376
  store ptr %1537, ptr %1541, align 8, !tbaa !113
  br label %1542

1542:                                             ; preds = %1540, %1536, %498, %450, %385, %271, %247
  call fastcc void @sqlite3DbFreeNN(ptr noundef %15, ptr noundef nonnull %210)
  br label %1543

1543:                                             ; preds = %1542, %196, %144, %141, %80, %36, %6
  call fastcc void @sqlite3SrcListDelete(ptr noundef %15, ptr noundef %1)
  %1544 = icmp eq ptr %2, null
  br i1 %1544, label %1546, label %1545

1545:                                             ; preds = %1543
  call fastcc void @exprListDeleteNN(ptr noundef %15, ptr noundef %2)
  br label %1546

1546:                                             ; preds = %1545, %1543
  %1547 = icmp eq ptr %3, null
  br i1 %1547, label %1549, label %1548

1548:                                             ; preds = %1546
  call fastcc void @sqlite3ExprDeleteNN(ptr noundef %15, ptr noundef %3)
  br label %1549

1549:                                             ; preds = %1548, %1546
  call void @llvm.lifetime.end.p0(ptr %12)
  call void @llvm.lifetime.end.p0(ptr %11)
  call void @llvm.lifetime.end.p0(ptr %10)
  ret void
}

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc range(i32 -2147483648, 2147483647) i32 @sqlite3VdbeAddOp0(ptr nofree noundef captures(none), i32 noundef range(i32 1, 190)) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc range(i32 -2147483648, 2147483647) i32 @sqlite3VdbeAddOp1(ptr nofree noundef captures(none), i32 noundef range(i32 0, 256), i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc range(i32 -2147483648, 2147483647) i32 @sqlite3VdbeAddOp4(ptr nofree noundef captures(none), i32 noundef range(i32 -1, 511), i32 noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3ExprCode(ptr noundef, ptr noundef, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc ptr @sqlite3KeyInfoOfIndex(ptr nofree noundef captures(none), ptr nofree noundef captures(none)) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3VdbeAppendP4(ptr nofree noundef readonly captures(none), ptr noundef, i32 noundef range(i32 -17, 0)) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3VdbeResolveLabel(ptr nofree noundef readonly captures(none), i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden void @sqlite3ExprIfFalse(ptr noundef, ptr noundef, i32 noundef, i32 noundef) #0

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc range(i32 0, 3) i32 @sqlite3WalkExprNN(ptr noundef, ptr noundef) unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3ExprCodeGetColumnOfTable(ptr nofree noundef captures(none), ptr noundef, i32 noundef, i32 noundef, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3VdbeChangeToNoop(ptr nofree noundef readonly captures(none), i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3BeginWriteOperation(ptr nofree noundef captures(none), i32 noundef range(i32 0, 2), i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3TableAffinity(ptr nofree noundef captures(none), ptr noundef nonnull, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc range(i32 0, 2) i32 @sqlite3ResolveExprNames(ptr noundef nonnull, ptr noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc ptr @sqlite3LocateTableItem(ptr noundef, i32 noundef range(i32 0, 2), ptr nofree noundef readonly captures(none)) unnamed_addr #0

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc i32 @viewGetColumnNames(ptr noundef, ptr noundef) unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc ptr @sqlite3WhereBegin(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, i16 noundef zeroext range(i16 0, 16896), i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3WhereEnd(ptr noundef) unnamed_addr #0

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc ptr @computeIndexAffStr(ptr nofree noundef, ptr nofree noundef captures(none)) unnamed_addr #1

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(read, inaccessiblemem: none, target_mem: none) uwtable
declare hidden fastcc range(i32 0, 3) i32 @sqlite3FkRequired(ptr nofree noundef readonly captures(none), ptr nofree noundef nonnull readonly captures(none), ptr nofree noundef readonly, i32 noundef range(i32 0, 3)) unnamed_addr #2

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc range(i32 0, 2) i32 @sqlite3IsReadOnly(ptr nofree noundef captures(none), ptr nofree noundef nonnull readonly captures(none), ptr nofree noundef readonly) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3MaterializeView(ptr noundef, ptr nofree noundef nonnull readonly captures(none), ptr nofree noundef readonly, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc i32 @sqlite3OpenTableAndIndices(ptr nofree noundef captures(none), ptr nofree noundef readonly captures(none), i32 noundef range(i32 114, 117), i8 noundef zeroext range(i8 0, 9), i32 noundef, ptr nofree noundef readonly, ptr nofree noundef nonnull writeonly captures(none), ptr nofree noundef nonnull writeonly captures(none)) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3CodeChangeCount(ptr nofree noundef nonnull captures(none), i32 noundef range(i32 1, 0), ptr noundef) unnamed_addr #0

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc ptr @triggersReallyExist(ptr nofree noundef captures(none), ptr nofree noundef nonnull readonly captures(none), i32 noundef range(i32 128, 131), ptr nofree noundef readonly, ptr nofree noundef writeonly) unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc i32 @sqlite3TriggerColmask(ptr noundef, ptr noundef, ptr nofree noundef readonly, i32 noundef range(i32 0, 2), i32 noundef range(i32 1, 4), ptr noundef nonnull, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc i32 @sqlite3FkOldmask(ptr nofree noundef captures(none), ptr nofree noundef nonnull readonly captures(none)) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3CodeRowTrigger(ptr noundef, ptr noundef, i32 noundef range(i32 128, 131), ptr nofree noundef readonly, i32 noundef range(i32 1, 3), ptr noundef nonnull, i32 noundef, i32 noundef, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3FkCheck(ptr noundef, ptr noundef nonnull, i32 noundef, i32 noundef, ptr nofree noundef readonly, i32 noundef range(i32 0, 3)) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3GenerateRowIndexDelete(ptr noundef, ptr nofree noundef nonnull readonly captures(none), i32 noundef, i32 noundef, ptr nofree noundef readonly, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3FkActions(ptr noundef, ptr noundef nonnull, ptr nofree noundef readnone, i32 noundef, ptr nofree noundef readonly, i32 noundef range(i32 0, 3)) unnamed_addr #0

; Function Attrs: noinline nounwind sspstrong uwtable
declare hidden fastcc void @autoIncrementEnd(ptr nofree noundef captures(none)) unnamed_addr #1

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @updateVirtualTable(ptr noundef, ptr noundef, ptr noundef nonnull, ptr nofree noundef readonly captures(none), ptr noundef, ptr nofree noundef nonnull readonly captures(none), ptr noundef, i32 noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @updateFromSelect(ptr noundef, i32 noundef, ptr nofree noundef readonly, ptr nofree noundef readonly, ptr nofree noundef readonly, ptr nofree noundef readonly) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3ComputeGeneratedColumns(ptr noundef, i32 noundef, ptr noundef nonnull) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3GenerateConstraintChecks(ptr noundef, ptr noundef nonnull, ptr nofree noundef readonly captures(none), i32 noundef, i32 noundef, i32 noundef, i32 noundef, i8 noundef zeroext range(i8 0, 3), i8 noundef zeroext, i32 noundef, ptr nofree noundef nonnull writeonly captures(none), ptr noundef, ptr noundef) unnamed_addr #0

; Function Attrs: nounwind sspstrong uwtable
declare hidden fastcc void @sqlite3CompleteInsertion(ptr nofree noundef readonly captures(none), ptr noundef nonnull, i32 noundef, i32 noundef, i32 noundef, ptr nofree noundef readonly captures(none), i32 noundef range(i32 0, 8), i32 noundef range(i32 0, 2), i32 noundef range(i32 0, 2)) unnamed_addr #0

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem: none) uwtable
declare hidden noundef i32 @checkConstraintExprNode(ptr nofree noundef captures(none), ptr nofree noundef readonly captures(none)) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #5

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.smax.i16(i16, i16) #6

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v8i16(<8 x i16>) #6

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v4i16(<4 x i16>) #6

attributes #0 = { nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="inline-asm" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "zero-call-used-regs"="used-gpr" }
attributes #1 = { noinline nounwind sspstrong uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="inline-asm" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "zero-call-used-regs"="used-gpr" }
attributes #2 = { nofree norecurse nosync nounwind sspstrong memory(read, inaccessiblemem: none, target_mem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="inline-asm" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "zero-call-used-regs"="used-gpr" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: readwrite, inaccessiblemem: none, target_mem: none) uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "probe-stack"="inline-asm" "stack-protector-buffer-size"="4" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "zero-call-used-regs"="used-gpr" }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(argmem: write) }
attributes #6 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nounwind }
attributes #8 = { memory(read, inaccessiblemem: none, target_mem: none) }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 23.1.0"}
!1 = !{i32 4, !"probe-stack", !"inline-asm"}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!11, !12, i64 0}
!11 = !{!"Parse", !12, i64 0, !14, i64 8, !15, i64 16, !7, i64 24, !16, i64 28, !8, i64 30, !8, i64 31, !8, i64 32, !8, i64 33, !8, i64 34, !8, i64 35, !8, i64 36, !8, i64 37, !8, i64 38, !7, i64 39, !7, i64 39, !7, i64 39, !7, i64 39, !7, i64 39, !7, i64 39, !7, i64 39, !7, i64 39, !7, i64 40, !7, i64 44, !7, i64 48, !7, i64 52, !7, i64 56, !7, i64 60, !7, i64 64, !7, i64 68, !7, i64 72, !7, i64 76, !7, i64 80, !17, i64 88, !18, i64 96, !19, i64 104, !19, i64 112, !7, i64 120, !7, i64 124, !7, i64 128, !7, i64 132, !7, i64 136, !7, i64 140, !20, i64 144, !21, i64 152, !22, i64 160, !23, i64 168, !24, i64 176, !25, i64 184, !8, i64 192, !22, i64 224, !26, i64 232, !7, i64 248, !7, i64 252, !8, i64 256, !26, i64 288, !16, i64 304, !8, i64 306, !8, i64 307, !8, i64 308, !7, i64 312, !7, i64 316, !7, i64 320, !17, i64 328, !15, i64 336, !14, i64 344, !23, i64 352, !27, i64 360, !28, i64 368, !14, i64 376, !26, i64 384, !29, i64 400, !31, i64 408, !32, i64 416}
!12 = !{!"p1 _ZTS7sqlite3", !13, i64 0}
!13 = !{!"any pointer", !8, i64 0}
!14 = !{!"p1 omnipotent char", !13, i64 0}
!15 = !{!"p1 _ZTS4Vdbe", !13, i64 0}
!16 = !{!"short", !8, i64 0}
!17 = !{!"p1 int", !13, i64 0}
!18 = !{!"p1 _ZTS8ExprList", !13, i64 0}
!19 = !{!"p1 _ZTS11IndexedExpr", !13, i64 0}
!20 = !{!"p1 _ZTS9TableLock", !13, i64 0}
!21 = !{!"p1 _ZTS11AutoincInfo", !13, i64 0}
!22 = !{!"p1 _ZTS5Parse", !13, i64 0}
!23 = !{!"p1 _ZTS5Table", !13, i64 0}
!24 = !{!"p1 _ZTS10TriggerPrg", !13, i64 0}
!25 = !{!"p1 _ZTS12ParseCleanup", !13, i64 0}
!26 = !{!"Token", !14, i64 0, !7, i64 8}
!27 = !{!"p1 _ZTS5Index", !13, i64 0}
!28 = !{!"p1 _ZTS7Trigger", !13, i64 0}
!29 = !{!"p2 _ZTS5Table", !30, i64 0}
!30 = !{!"any p2 pointer", !13, i64 0}
!31 = !{!"p1 _ZTS4With", !13, i64 0}
!32 = !{!"p1 _ZTS11RenameToken", !13, i64 0}
!33 = !{!11, !7, i64 52}
!34 = !{!35, !23, i64 16}
!35 = !{!"SrcItem", !14, i64 0, !14, i64 8, !23, i64 16, !36, i64 24, !7, i64 28, !37, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64}
!36 = !{!"", !8, i64 0, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 2, !7, i64 2, !7, i64 2, !7, i64 2, !7, i64 2, !7, i64 2, !7, i64 2, !7, i64 2, !7, i64 3, !7, i64 3, !7, i64 3}
!37 = !{!"long long", !8, i64 0}
!38 = !{!39, !17, i64 768}
!39 = !{!"sqlite3", !40, i64 0, !15, i64 8, !41, i64 16, !42, i64 24, !43, i64 32, !7, i64 40, !7, i64 44, !37, i64 48, !37, i64 56, !37, i64 64, !7, i64 72, !7, i64 76, !7, i64 80, !7, i64 84, !7, i64 88, !7, i64 92, !7, i64 96, !8, i64 100, !8, i64 101, !8, i64 102, !8, i64 103, !8, i64 104, !8, i64 105, !8, i64 106, !8, i64 107, !8, i64 108, !8, i64 109, !8, i64 110, !8, i64 111, !8, i64 112, !8, i64 113, !8, i64 114, !7, i64 116, !37, i64 120, !37, i64 128, !8, i64 136, !7, i64 188, !44, i64 192, !7, i64 208, !7, i64 212, !7, i64 216, !7, i64 220, !7, i64 224, !7, i64 228, !30, i64 232, !8, i64 240, !13, i64 248, !13, i64 256, !13, i64 264, !13, i64 272, !13, i64 280, !13, i64 288, !13, i64 296, !13, i64 304, !13, i64 312, !13, i64 320, !13, i64 328, !13, i64 336, !22, i64 344, !13, i64 352, !13, i64 360, !13, i64 368, !13, i64 376, !13, i64 384, !46, i64 392, !8, i64 400, !47, i64 408, !13, i64 504, !13, i64 512, !13, i64 520, !13, i64 528, !7, i64 536, !7, i64 540, !49, i64 544, !52, i64 568, !53, i64 576, !54, i64 584, !49, i64 592, !49, i64 616, !55, i64 640, !8, i64 664, !56, i64 728, !7, i64 736, !7, i64 740, !7, i64 744, !7, i64 748, !37, i64 752, !37, i64 760, !17, i64 768, !57, i64 776, !37, i64 784}
!40 = !{!"p1 _ZTS11sqlite3_vfs", !13, i64 0}
!41 = !{!"p1 _ZTS7CollSeq", !13, i64 0}
!42 = !{!"p1 _ZTS13sqlite3_mutex", !13, i64 0}
!43 = !{!"p1 _ZTS2Db", !13, i64 0}
!44 = !{!"sqlite3InitInfo", !7, i64 0, !8, i64 4, !8, i64 5, !7, i64 6, !7, i64 6, !7, i64 6, !45, i64 8}
!45 = !{!"p2 omnipotent char", !30, i64 0}
!46 = !{!"p1 _ZTS13sqlite3_value", !13, i64 0}
!47 = !{!"Lookaside", !7, i64 0, !16, i64 4, !16, i64 6, !8, i64 8, !7, i64 12, !8, i64 16, !48, i64 32, !48, i64 40, !48, i64 48, !48, i64 56, !13, i64 64, !13, i64 72, !13, i64 80, !13, i64 88}
!48 = !{!"p1 _ZTS13LookasideSlot", !13, i64 0}
!49 = !{!"Hash", !7, i64 0, !7, i64 4, !50, i64 8, !51, i64 16}
!50 = !{!"p1 _ZTS8HashElem", !13, i64 0}
!51 = !{!"p1 _ZTS3_ht", !13, i64 0}
!52 = !{!"p1 _ZTS7VtabCtx", !13, i64 0}
!53 = !{!"p2 _ZTS6VTable", !30, i64 0}
!54 = !{!"p1 _ZTS6VTable", !13, i64 0}
!55 = !{!"BusyHandler", !13, i64 0, !13, i64 8, !7, i64 16}
!56 = !{!"p1 _ZTS9Savepoint", !13, i64 0}
!57 = !{!"p1 _ZTS12DbClientData", !13, i64 0}
!58 = !{!59, !7, i64 44}
!59 = !{!"Table", !14, i64 0, !60, i64 8, !27, i64 16, !14, i64 24, !18, i64 32, !7, i64 40, !7, i64 44, !7, i64 48, !16, i64 52, !16, i64 54, !16, i64 56, !16, i64 58, !16, i64 60, !8, i64 62, !8, i64 63, !8, i64 64, !28, i64 88, !61, i64 96, !8, i64 104}
!60 = !{!"p1 _ZTS6Column", !13, i64 0}
!61 = !{!"p1 _ZTS6Schema", !13, i64 0}
!62 = !{!8, !8, i64 0}
!63 = !{!27, !27, i64 0}
!64 = !{!65, !14, i64 0}
!65 = !{!"Index", !14, i64 0, !66, i64 8, !66, i64 16, !23, i64 24, !14, i64 32, !27, i64 40, !61, i64 48, !14, i64 56, !45, i64 64, !67, i64 72, !18, i64 80, !7, i64 88, !16, i64 92, !16, i64 94, !16, i64 96, !8, i64 98, !7, i64 99, !7, i64 99, !7, i64 99, !7, i64 99, !7, i64 99, !7, i64 99, !7, i64 99, !7, i64 100, !7, i64 100, !7, i64 100, !7, i64 100, !37, i64 104}
!66 = !{!"p1 short", !13, i64 0}
!67 = !{!"p1 _ZTS4Expr", !13, i64 0}
!68 = distinct !{!68, !69}
!69 = !{!"llvm.loop.mustprogress"}
!70 = !{!59, !61, i64 96}
!71 = !{!39, !43, i64 32}
!72 = !{!73, !61, i64 24}
!73 = !{!"Db", !14, i64 0, !74, i64 8, !8, i64 16, !8, i64 17, !61, i64 24}
!74 = !{!"p1 _ZTS5Btree", !13, i64 0}
!75 = !{!59, !28, i64 88}
!76 = !{!77, !50, i64 64}
!77 = !{!"Schema", !7, i64 0, !7, i64 4, !49, i64 8, !49, i64 32, !49, i64 56, !49, i64 80, !23, i64 104, !8, i64 112, !8, i64 113, !16, i64 114, !7, i64 116}
!78 = !{!59, !8, i64 63}
!79 = !{!59, !16, i64 54}
!80 = !{!11, !7, i64 56}
!81 = !{!59, !7, i64 48}
!82 = !{!83, !7, i64 76}
!83 = !{!"Upsert", !18, i64 0, !67, i64 8, !18, i64 16, !67, i64 24, !84, i64 32, !8, i64 40, !8, i64 41, !13, i64 48, !27, i64 56, !85, i64 64, !7, i64 72, !7, i64 76, !7, i64 80}
!84 = !{!"p1 _ZTS6Upsert", !13, i64 0}
!85 = !{!"p1 _ZTS7SrcList", !13, i64 0}
!86 = !{!83, !7, i64 80}
!87 = !{!35, !7, i64 28}
!88 = !{!89, !22, i64 0}
!89 = !{!"NameContext", !22, i64 0, !85, i64 8, !8, i64 16, !90, i64 24, !7, i64 32, !7, i64 36, !7, i64 40, !7, i64 44, !91, i64 48}
!90 = !{!"p1 _ZTS11NameContext", !13, i64 0}
!91 = !{!"p1 _ZTS6Select", !13, i64 0}
!92 = !{!89, !85, i64 8}
!93 = !{!89, !7, i64 40}
!94 = !{!11, !15, i64 16}
!95 = !{!11, !22, i64 160}
!96 = !{!39, !7, i64 96}
!97 = !{!98, !67, i64 0}
!98 = !{!"ExprList_item", !67, i64 0, !14, i64 8, !99, i64 16, !8, i64 20}
!99 = !{!"", !8, i64 0, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 1, !7, i64 2}
!100 = !{!98, !14, i64 8}
!101 = !{!59, !60, i64 8}
!102 = !{!103, !8, i64 11}
!103 = !{!"Column", !14, i64 0, !7, i64 8, !7, i64 8, !8, i64 9, !8, i64 10, !8, i64 11, !16, i64 12, !16, i64 14}
!104 = !{!103, !14, i64 0}
!105 = !{!59, !16, i64 52}
!106 = !{!103, !16, i64 14}
!107 = !{!59, !14, i64 0}
!108 = !{!73, !14, i64 0}
!109 = !{!39, !13, i64 504}
!110 = !{!39, !8, i64 197}
!111 = !{!11, !8, i64 308}
!112 = !{!39, !13, i64 512}
!113 = !{!11, !14, i64 376}
!114 = !{!11, !7, i64 24}
!115 = !{!103, !16, i64 12}
!116 = !{!117, !13, i64 8}
!117 = !{!"Walker", !22, i64 0, !13, i64 8, !13, i64 16, !13, i64 24, !7, i64 32, !16, i64 36, !16, i64 38, !8, i64 40}
!118 = !{!117, !16, i64 36}
!119 = !{!35, !37, i64 32}
!120 = !{!65, !67, i64 72}
!121 = !{!65, !16, i64 94}
!122 = !{!11, !7, i64 60}
!123 = !{!65, !16, i64 96}
!124 = !{!65, !66, i64 8}
!125 = !{!16, !16, i64 0}
!126 = !{!65, !18, i64 80}
!127 = !{!65, !8, i64 98}
!128 = !{!11, !8, i64 30}
!129 = !{!11, !7, i64 76}
!130 = !{!39, !37, i64 48}
!131 = !{!11, !23, i64 168}
!132 = !{!11, !8, i64 32}
!133 = !{!134, !7, i64 4}
!134 = !{!"Expr", !8, i64 0, !8, i64 1, !8, i64 2, !7, i64 4, !8, i64 8, !67, i64 16, !67, i64 24, !8, i64 32, !7, i64 40, !7, i64 44, !16, i64 48, !16, i64 50, !8, i64 52, !135, i64 56, !8, i64 64}
!135 = !{!"p1 _ZTS7AggInfo", !13, i64 0}
!136 = !{!65, !14, i64 32}
!137 = !{!138, !7, i64 144}
!138 = !{!"Vdbe", !12, i64 0, !139, i64 8, !15, i64 16, !22, i64 24, !16, i64 32, !7, i64 36, !7, i64 40, !7, i64 44, !7, i64 48, !7, i64 52, !37, i64 56, !7, i64 64, !37, i64 72, !37, i64 80, !37, i64 88, !37, i64 96, !46, i64 104, !140, i64 112, !141, i64 120, !46, i64 128, !142, i64 136, !7, i64 144, !7, i64 148, !46, i64 152, !46, i64 160, !14, i64 168, !17, i64 176, !37, i64 184, !16, i64 192, !16, i64 194, !8, i64 196, !8, i64 197, !8, i64 198, !8, i64 199, !7, i64 200, !7, i64 200, !7, i64 200, !7, i64 200, !7, i64 200, !7, i64 200, !7, i64 201, !7, i64 204, !7, i64 208, !8, i64 212, !14, i64 248, !13, i64 256, !143, i64 264, !143, i64 272, !7, i64 280, !7, i64 284, !144, i64 288, !145, i64 296}
!139 = !{!"p2 _ZTS4Vdbe", !30, i64 0}
!140 = !{!"p2 _ZTS13sqlite3_value", !30, i64 0}
!141 = !{!"p2 _ZTS10VdbeCursor", !30, i64 0}
!142 = !{!"p1 _ZTS6VdbeOp", !13, i64 0}
!143 = !{!"p1 _ZTS9VdbeFrame", !13, i64 0}
!144 = !{!"p1 _ZTS10SubProgram", !13, i64 0}
!145 = !{!"p1 _ZTS7AuxData", !13, i64 0}
!146 = !{!138, !12, i64 0}
!147 = !{!39, !8, i64 103}
!148 = !{!138, !142, i64 136}
!149 = !{!150, !7, i64 8}
!150 = !{!"VdbeOp", !8, i64 0, !8, i64 1, !16, i64 2, !7, i64 4, !7, i64 8, !7, i64 12, !8, i64 16}
!151 = distinct !{!151, !69, !152, !153}
!152 = !{!"llvm.loop.isvectorized", i32 1}
!153 = !{!"llvm.loop.unroll.runtime.disable", i1 true}
!154 = !{!"branch_weights", i32 4, i32 12}
!155 = !{!59, !16, i64 56}
!156 = !{!138, !7, i64 148}
!157 = !{!150, !8, i64 0}
!158 = !{!150, !16, i64 2}
!159 = !{!150, !7, i64 4}
!160 = !{!150, !7, i64 12}
!161 = !{!150, !8, i64 1}
!162 = !{!11, !21, i64 152}
