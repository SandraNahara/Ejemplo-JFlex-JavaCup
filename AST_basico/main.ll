target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.16.27031"

@formatString = private constant [2 x i8] c"%d"
declare i32 @printf(i8*, ...)

define dso_local i32 @main(i32, i8**) {
%nodo_1670675563 = alloca  i32
store i32 15, i32* %nodo_1670675563
%nodo_723074861 = alloca  i32
store i32 3, i32* %nodo_723074861
%nodo_1725154839 = alloca  i32
%nodo_1725154839_izq = load i32 , i32* %nodo_1670675563
%nodo_1725154839_der = load i32 , i32* %nodo_723074861
%nodo_1725154839_temp = add i32 %nodo_1725154839_izq, %nodo_1725154839_der
store i32 %nodo_1725154839_temp, i32* %nodo_1725154839
%nodo_895328852 = alloca  i32
store i32 20, i32* %nodo_895328852
%nodo_1581781576 = alloca  i32
%nodo_1581781576_izq = load i32 , i32* %nodo_1725154839
%nodo_1581781576_der = load i32 , i32* %nodo_895328852
%nodo_1581781576_temp = mul i32 %nodo_1581781576_izq, %nodo_1581781576_der
store i32 %nodo_1581781576_temp, i32* %nodo_1581781576
%nodo_1304836502 = alloca  i32
store i32 3, i32* %nodo_1304836502
%nodo_1872034366 = alloca  i32
%nodo_1872034366_izq = load i32 , i32* %nodo_1581781576
%nodo_1872034366_der = load i32 , i32* %nodo_1304836502
%nodo_1872034366_temp = sdiv i32 %nodo_1872034366_izq, %nodo_1872034366_der
store i32 %nodo_1872034366_temp, i32* %nodo_1872034366
%nodo_225534817 = alloca  i32
store i32 8, i32* %nodo_225534817
%nodo_644117698 = alloca  i32
%nodo_644117698_izq = load i32 , i32* %nodo_1872034366
%nodo_644117698_der = load i32 , i32* %nodo_225534817
%nodo_644117698_temp = sub i32 %nodo_644117698_izq, %nodo_644117698_der
store i32 %nodo_644117698_temp, i32* %nodo_644117698
%nodo_1173230247 = load i32, i32* %nodo_644117698
%call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @formatString , i32 0, i32 0), i32 %nodo_1173230247)
ret i32 %nodo_1173230247
}
