# SystemVerilog and OOP

---
## 📜 Defining Class Basics 
-Demonstrate how to define class and handler(object) 
-Constructor function 
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
---
## 📜  Task in SystemVerilog  
```verilog
// we can add task and function in classes
//Task support timing information (Multiple Output Port ) and Function does not support timing function
//Function do not support output port 

module tb;
  
  ///default direction : input
  /*
  task add (input bit [3:0] a, input bit [3:0] b, output bit [4:0] y);
   y = a + b;
  endtask
  */
  
  
  bit [3:0] a,b;
  bit [4:0] y;
  
  bit clk = 0;
  
  always #5 clk = ~clk;  ///20 ns --> 50 Mhz
  
  task add ();
   y = a + b;
   $display("a : %0d and b : %0d and y : %0d",a,b,y);
  endtask
  
  task stim_a_b();
    a = 1;
    b = 3;
    add();
    #10;
    a = 5;
    b = 6;
    add();
    #10;
    a = 7;
    b = 8;
    add();
    #10;
  endtask
  
  
  task stim_clk ();
    @(posedge clk);    // wait
    a =$urandom();
    b = $urandom();
    add();
  endtask
  
  
  initial begin
    #110;
    $finish();
  end
  
  
  initial begin
   // stim_a_b();
    for(int i = 0; i< 11 ; i++) begin
      stim_clk();
    end
  
  end
  
endmodule

```

---
## Function in SystemVerilog  
```verilog
module tb;
	bit [4:0]res=0;
	bit [3:0]ain=4'b0100;
	bit [3:0]bin=4'b0010;

function bit [4:0] add(input bit[3:0]a,b);
return ain+bin;
endfunction

bit[4:0] res=0;
initial begin 
	res=add();
	$display("Value of addition is :%d",res);
end

function void display_ain_bin();
	$display("Value of a =%0d and b=%0d",ain,bin);
endfunction

endmodule 
```
---

## Pass by Value and Pass by Reference 
```verilog 
module tb;
 
  //////pass by value
  
  task swap ( input bit [1:0] a, [1:0] b); 
    bit [1:0] temp;
    temp = a;
    a = b;
    b = temp;   
    $display("Value of a : %0d and b : %0d", a,b);
  endtask
  
  
  //////pass by reference
  
   task automatic swap ( ref bit [1:0] a, [1:0] b); /// function automatic bit [1:0] add (arguments);
    bit [1:0] temp;
    temp = a;
    a = b;
    b = temp;
    
    $display("Value of a : %0d and b : %0d", a,b);
  endtask
 
  
  ////restrict access to variables
  task automatic swap (const ref bit [1:0] a, ref bit [1:0] b); /// function automatic bit [1:0] add (arguments);
    bit [1:0] temp;
    
    temp = a;
  //  a = b;
    b = temp;
    
    $display("Value of a : %0d and b : %0d", a,b);
  endtask
  
  bit [1:0] a;
  bit [1:0] b;
  
  initial begin
    a = 1;
    b = 2;
    
    swap(a,b);
    
    $display("Value of a : %0d and b : %0d", a,b);
  end
  
  
endmodule
```
---
## Use of Array in Function 
```verilog 
module tb;
  
  bit [3:0] res[16];
  
  function automatic void init_arr (ref bit [3:0] a[16]);  
    for(int i =0; i <= 15; i++) begin
      a[i] = i;
    end
  endfunction 
  
  initial begin
    init_arr(res);
    
    for(int i =0; i <= 15; i++) begin
      $display("res[%0d] : %0d", i, res[i]);
    end
    
  end
endmodule
```
---

##  Application of function as custom constructor 
```verilog 
//constructor function does not return void also 
class first;
  
  int data;
  
  function new(input int datain = 0);
  data = datain;
  endfunction 
endclass
 
 
module tb;

  first f1;
  
  initial begin
    f1 = new(23);
    $display("Data : %0d", f1.data); 
  end
endmodule

```
---

##  Specifying Arguments in constructor and this keyword 
```verilog 

class first;
  
  int data1;
  bit [7:0] data2;
  shortint data3;
  
  function new(input int data1 = 0, input bit[7:0] data2 = 8'h00, input shortint data3 = 0);
   this.data1 = data1;
   this.data2 = data2;
   this.data3 = data3;    
  endfunction
  
  
endclass
 
 
module tb;
  
  first f1;
  
  initial begin
    //f1 = new(23,,35); ///follow position
    f1 = new( .data2(4), .data3(5), .data1(23)); //follow name
    $display("Data1 : %0d, Data2 : %0d and Data3 : %0d", f1.data1, f1.data2, f1.data3); 
  end
  
  
endmodule
```
---


##  
```
```
---









