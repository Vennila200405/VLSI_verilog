module even_parity_checker (
    input  [3:0] data_in,
    input        parity_bit,
    output       parity_ok
);
    
  assign parity_ok = ~(^({data_in, parity_bit}));  


module odd_parity_checker (
    input  [3:0] data_in,
    input        parity_bit,
    output       parity_ok
);
    
  assign parity_ok = ^({data_in, parity_bit});
