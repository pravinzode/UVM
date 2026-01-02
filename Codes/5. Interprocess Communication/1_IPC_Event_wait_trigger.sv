module tb;
 event a1,a2;
  
  initial begin
    ->a1;
    ->a2;
  end
  
  initial begin
    wait(a1.triggered);
    $display("Event A1 Trigger");
    wait(a2.triggered);
    $display("Event A2 Trigger");
  end
 
 
 
endmodule