// Roteiro 5
// Leticia Gabriela Calixto

parameter divide_by=100000000;  // divisor do clock de referência
// A frequencia do clock de referencia é 50 MHz.
// A frequencia de clk_2 será de  50 MHz / divide_by

parameter NBITS_INSTR = 32;
parameter NBITS_TOP = 8, NREGS_TOP = 32, NBITS_LCD = 64;
module top(input  logic clk_2,
           input  logic [NBITS_TOP-1:0] SWI,
           output logic [NBITS_TOP-1:0] LED,
           output logic [NBITS_TOP-1:0] SEG,
           output logic [NBITS_LCD-1:0] lcd_a, lcd_b,
           output logic [NBITS_INSTR-1:0] lcd_instruction,
           output logic [NBITS_TOP-1:0] lcd_registrador [0:NREGS_TOP-1],
           output logic [NBITS_TOP-1:0] lcd_pc, lcd_SrcA, lcd_SrcB,
             lcd_ALUResult, lcd_Result, lcd_WriteData, lcd_ReadData,
           output logic lcd_MemWrite, lcd_Branch, lcd_MemtoReg, lcd_RegWrite);

  always_comb begin
    //SEG <= SWI;
    lcd_WriteData <= SWI;
    lcd_pc <= 'h12;
    lcd_instruction <= 'h34567890;
    lcd_SrcA <= 'hab;
    lcd_SrcB <= 'hcd;
    lcd_ALUResult <= 'hef;
    lcd_Result <= 'h11;
    lcd_ReadData <= 'h33;
    lcd_MemWrite <= SWI[0];
    lcd_Branch <= SWI[1];
    lcd_MemtoReg <= SWI[2];
    lcd_RegWrite <= SWI[3];
    for(int i=0; i<NREGS_TOP; i++)
       if(i != NREGS_TOP/2-1) lcd_registrador[i] <= i+i*16;
       else                   lcd_registrador[i] <= ~SWI;
    lcd_a <= {56'h1234567890ABCD, SWI};
    lcd_b <= {SWI, 56'hFEDCBA09876543};
  end

  parameter zero = 'b10111111;
  parameter um = 'b00000110;
  parameter dois = 'b01011011;
  parameter tres = 'b01001111;
  parameter quatro = 'b01100110;
  parameter cinco = 'b01101101;
  parameter seis = 'b01111101;
  parameter sete = 'b00000111;
  parameter oito = 'b01111111;
  parameter nove = 'b01101111;
  parameter letraA = 'b01110111;
  parameter letraB = 'b01111100;
  parameter letraC = 'b00111001;
  parameter letraD = 'b01011110;
  parameter letraE = 'b01111001;
  parameter letraF = 'b01110001;



  logic reset;
  logic selecao;
  logic valor;
  logic entradaSerial;
  logic [4:0] entradaParalela;
  //clockled7

  always_comb begin
    reset <= SWI[0];
    selecao <= SWI[1];
    valor <= SWI[2];
    entradaSerial <= SWI[3];
    entradaParalela <= SWI[7:4];


  
 
endmodule