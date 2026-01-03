`include "uvm_macros.svh"
import uvm_pkg::*;
// Three methods are used to send values on consoles
///// sformatf / core method / do hooks
// 1. sformatf send single value 
// 2. Core method and do hooks in base classes
 
module tb;
 
int data = 235;
  
initial begin
 
  `uvm_info("TB_TOP", $sformatf("Value of data : %h", data), UVM_NONE);
//            ID,            message,                       format specifier   
  
end
  
endmodule

// UVM_BIN       - selects binary (%b) format
// UVM_DEC       - selects decimal (%d) format
// UVM_UNSIGNED  - selects unsigned (%u) format
// UVM_UNFORMAT2 - selects unformated 2 values data (%u) format
// UVM_UNFORMAT4 - selects unformated 4 values data (%z) format
// UVM_OCT       - selects octal (%o) format
// UVM_HEX
// UVM_STRING
// UVM_TIME
// UVM_ENUM
// UVM_REAL
// UVM_REAL_DEC
// UVM_REAL_EXP
