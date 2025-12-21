# SystemVerilog and OOP

---
## 📜 Defining Class Basics 
```verilog
class first;
  
  reg [2:0] data; 
  reg [1:0] data2;
  
  
endclass
 
module tb;
  
  first f;
  
  initial begin
    f = new(); 
    #1;
    $display("Value of data : %0d and data2 : %0d",f.data, f.data2);
  end
endmodule
```

---
## 📜  Allocating and Deallocating Memory and Updating Variable 
```verilog
class first;
  reg [2:0] data; 
  reg [1:0] data2;
endclass
 
 
module tb;
  
  first f;
  
  initial begin
    f = new(); // allocate memory  
    f.data = 3'b010;
    f.data2 = 2'b10;
    f = null; // De-allocate memory  
    #1;
    $display("Value of data : %0d and data2 : %0d",f.data, f.data2);
  end

endmodule

```


