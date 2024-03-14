# Pipelined-CPU-Design
整體架構圖
![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/3f7ac2fb-5eb5-404c-805f-b00c5e722185)

# ALU：
ALU 為由 32 個 ALUOne 用連波進位串聯法組成的 32 - bits ALU。

輸入、輸出的訊號:
dataA、dataB ：等待被計算的兩個 32 - bits 的數值。
Signal : 決定輸出運算結果的訊號。
dataOut : 運算完的結果。
reset : 初始化。

主要的功能為 32 - bits 的 and、or、add、sub、slt 以 32 個 ALUOne 分別計算出每位元的結果，最後輸出。
其中 Cin 訊號的輸入，首先我們先看 Signal 是否為 SLT 或 SUB 的訊號，如果是，我們把 Binvert 設成 1 否則為 0，其他的 Cin 分別都是以前一個位元的 Cout 結果作為 Cin 訊號的輸入。
第 0 位元的 Less 訊號是以第 31 位元的 set 訊號，代表第 31 位元的減法結果，作為輸入，其餘的 Less 訊號皆為 0 輸入。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/d0686ed6-42b0-4263-99ed-3d42acd3735f)
![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/40378841-0ff6-4661-81b1-fe7b14a663e7)

# ALU_oneBit：
ALU_oneBit 是組成 32 位元 ALU 的小單元。
	
		輸入輸出的訊號:
			dataA、dataB : 被計算的兩個輸入值。
			Cin : 為上一個單元做加法與減法的進位輸入。
# Signal : 決定輸出運算結果的訊號。
			Binvert : 做減法時，與 dataB做 xor 運算，將 dataB 轉為負值。
dataOut : 運算結果。
Cout : 為下一個單元做加法與減法的進位輸出。
			Less : slt 的輸出值。
			Reset : 初始化。
			Set : 輸出 FullAdder 的運算值，供判斷 slt 做使用。

主要的功能有 1 - bit 的 and、or、add、sub、slt，其中 add 跟 sub 的運
算由 FullAdder 實現，並藉由輸入 Binvert 和 dataB 做 xor，來決定是做加還是減。
再來是 slt，它的功能是根據 sub 的結果作判斷，第 31 位元的減法結果assign 給 Set，並將此 Set 訊號傳給第 0 位元，當作其 Less 訊號的輸入，以此決定的 slt 的輸出結果。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/39a78d97-1d85-43a4-b6d3-85708792cc40)
![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/59a4ca0c-5d85-4217-96f5-25b95df65807)

# ALU_ctl：

ALU_ctl 的作用就是控制並整理訊號，並且如果 Signal 為乘法，就把 counter 歸 0，接著，利用正源觸發 clk 32 次之後，將值放進 HiLo 暫存器中，超過 32 次後，再將 counter 歸 0。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/0e759563-21e6-499f-ae76-5c79a34541a9)

# control_single:

根據指令的不同，更改輸出參數的值，這這些輸出參數其實就是之後執行該指令時的開關。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/8f3cdbd5-e5bc-44a8-bc4e-ca7d0cf29ab9)

# EXreg32：

依據 clk 的變動來執行，如果 rst 為 1，就將全部的輸出參數都歸零；否則就將傳入的各個參數指派給輸出參數。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/bc5a5e45-1435-4600-8851-1eb47e2f043d)

# FullAdder：

	32 - bit 加法器的其中一個小單元。
		輸入、輸出的訊號 :
            	A、B : 為計算的兩個輸入值
            	Cin : 前一位元的進位輸入
            	Cout : 下一位元的進位輸出
            	Sum : 運算結果
            e1, e2, e3 為線，以 Gate - Level 的形式完成。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/14b88555-0dc2-4115-8412-914d5a917682)
![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/8dca673b-c28a-49d8-869c-5271a0546edb)

# IDreg32：

	兩個階段間的暫存器。
依據 clk 的變動來執行，如果 rst 為 1，就將全部的輸出參數都歸零；否則就將傳入的各個參數指派給輸出參數。


# IFreg32：
![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/e4be30b4-7725-4322-8dae-9c35b7ad1311)

兩個階段間的暫存器。
依據 clk 的變動來執行，如果 rst 為 1，就將全部的輸出參數都歸零；否則就將傳入的各個參數指派給輸出參數。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/7f18e739-707c-4a1c-b21c-20394acaa76b)

# memory ：
	主要負責執行 lw, sw 指令。
根據 clk 的變動來執行，依據 MemRead 和 MemWrite 的值來決定是要執行讀
取還是寫入的功能，依照傳入的 addr 參數至指定的位置進行讀取或寫入。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/737fa525-9ea3-4e32-8dc4-a444c7876998)

# MEMreg32：

兩個階段間的暫存器。
依據 clk 的變動來執行，如果 rst 為 1，就將全部的輸出參數都歸零；否則就將傳入的各個參數指派給輸出參數。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/7f028959-2307-45d5-9441-4743c85ad1cc)

# mips_single：

		根據指令的不同，進到各個 module 中執行指令。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/a3184b9e-6304-4ba2-a91c-500d232e0c13)

# reg32 :
根據 clk 的變動來執行，依據 en_reg 的值來判定暫存器是否可寫入，否則將依循 rst 訊號將 out_d 歸零。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/bb2c93cf-216e-46c6-9c3d-e4f808ed162d)

# shifter：

將值 ( inputNum ) 和位移量 ( move ) input 進來，呼叫 Shifter_mux2x1，由位移量的第一個 bit 開始判定，呼叫 32 次多工器，例如move [4] 是 1，表示要左移 16 bit，多工器放入 (inputNum[31], inputNum[15], move[4])，將inputNum[15] 存入 saveOne[31]。

( 做 32 次，一次搬 16 bit，這樣的動作需要做 5 階，由move [4] 判定到 move [0] )
( 因為是 32 bit，移位量超過 32 則全部為 0 )
( move[4] == 1 移動 16 bit ，move[3] == 1 移動 8 bit ，move[2] == 1 移動 4 bit，move[1] == 1 移動 2 bit ，move[0] == 1 移動 16 bit )

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/48ddcf39-2839-44b2-8aea-9c240ada4cf4)

# shifter2X1：
依據 sel 與 signal 的控制，將 in0 或 in1 指派給 out。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/7c09cc53-ec22-4de0-9dd5-46b6fee04458)

# tb_SingleCycle：
	設定 cycle、產生時脈，執行開檔、讀檔、寫檔......等相關命令，及顯示計算結果。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/dd7f7739-3dd1-4d1b-9b78-4502aba0637f)

# TotalALU：										  	
TotalALU 的作用就是整合所有功能，並於 tb_ALU 做呼叫。

![image](https://github.com/kenwu890831/Pipelined-CPU-Design/assets/92260086/ea41a27b-7b0d-4bad-a271-f91ec9c8647b)


